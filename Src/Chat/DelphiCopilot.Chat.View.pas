unit DelphiCopilot.Chat.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.Threading,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  DockForm,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Clipbrd,
  DelphiCopilot.Consts,
  DelphiCopilot.Chat, System.ImageList, Vcl.ImgList;

type
  TDelphiCopilotChatView = class(TDockableForm)
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    SelectAll1: TMenuItem;
    pnBack: TPanel;
    pnBottom: TPanel;
    pnBackBtnSend: TPanel;
    btnSend: TButton;
    mmQuestion: TMemo;
    pnCommands: TPanel;
    btnCopy: TSpeedButton;
    btnInsertAtCursor: TSpeedButton;
    btnMoreActions: TSpeedButton;
    Shape3: TShape;
    N1: TMenuItem;
    mmReturn: TRichEdit;
    Splitter1: TSplitter;
    pnWait: TPanel;
    ShapeWait: TShape;
    pnWaitCaption: TPanel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure cBoxSizeFontKeyPress(Sender: TObject; var Key: Char);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendClick(Sender: TObject);
    procedure mmQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCopyClick(Sender: TObject);
    procedure btnInsertAtCursorClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure mmQuestionChange(Sender: TObject);
    procedure mmQuestionKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FChat: TDelphiCopilotChat;
    procedure ReadFromFile;
    procedure WriteToFile;
    procedure InitializeRichEditReturn;
    procedure ProcessSend;
    procedure AddResponseSimple(const AString: string);
    procedure AddResponseComplete(const AStrings: TStrings);
    procedure AddResponseLine(const ALineStr: string);
    procedure Last;
    function GetSelectedTextOrAll: string;
    procedure GetSelectedBlockForQuestion;
    procedure WaitingFormOFF;
    procedure WaitingFormON;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  DelphiCopilotChatView: TDelphiCopilotChatView;

procedure RegisterSelf;
procedure Unregister;
procedure DelphiCopilotChatViewShowDockableForm;

implementation

uses
  DeskUtil,
  DelphiCopilot.Utils,
  DelphiCopilot.Utils.OTA;


{$R *.dfm}

procedure RegisterSelf;
begin
  if(not Assigned(DelphiCopilotChatView))then
    DelphiCopilotChatView := TDelphiCopilotChatView.Create(nil);

  if(@RegisterFieldAddress <> nil)then
    RegisterFieldAddress(DelphiCopilotChatView.Name, @DelphiCopilotChatView);

  RegisterDesktopFormClass(TDelphiCopilotChatView, DelphiCopilotChatView.Name, DelphiCopilotChatView.Name);
end;

procedure Unregister;
begin
  if(@UnRegisterFieldAddress <> nil)then
    UnRegisterFieldAddress(@DelphiCopilotChatView);
  FreeAndNil(DelphiCopilotChatView);
end;

procedure DelphiCopilotChatViewShowDockableForm;
begin
  ShowDockableForm(DelphiCopilotChatView);
  FocusWindow(DelphiCopilotChatView);
end;

constructor TDelphiCopilotChatView.Create(AOwner: TComponent);
begin
  inherited;
  DeskSection := Self.Name;
  AutoSave := True;
  SaveStateNecessary := True;
  FChat := TDelphiCopilotChat.Create;

  pnWait.Visible := False;
end;

destructor TDelphiCopilotChatView.Destroy;
begin
  FChat.Free;
  inherited;
end;

procedure TDelphiCopilotChatView.FormShow(Sender: TObject);
begin
  TDelphiCopilotUtilsOTA.IDEThemingAll(TDelphiCopilotChatView, Self);
  Self.Constraints.MinWidth := 100;
  Self.Constraints.MinHeight := 100;

  Self.InitializeRichEditReturn;
  Self.ReadFromFile;
  Self.GetSelectedBlockForQuestion;

  mmQuestion.SelectAll;
  mmQuestion.SelStart := Length(mmQuestion.Text);
  mmQuestion.SetFocus;
end;

procedure TDelphiCopilotChatView.GetSelectedBlockForQuestion;
var
  LBlockTextSelect: string;
begin
  LBlockTextSelect := TDelphiCopilotUtilsOTA.GetBlockTextSelect;
  if not LBlockTextSelect.Trim.IsEmpty then
    mmQuestion.Text := LBlockTextSelect;
end;

procedure TDelphiCopilotChatView.mmQuestionChange(Sender: TObject);
begin
  if mmQuestion.Lines.Count >= 3 then
    mmQuestion.ScrollBars := ssVertical
  else
    mmQuestion.ScrollBars := ssNone;
end;

procedure TDelphiCopilotChatView.mmQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift)and(Key = VK_RETURN) then
  begin
    btnSend.Click;
    Key := 0;
  end;
end;

procedure TDelphiCopilotChatView.mmQuestionKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift)and(Key = 65)then
  begin
    mmQuestion.SelectAll;
    Key := 0;
  end;
end;

procedure TDelphiCopilotChatView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.WriteToFile;
  Self.WaitingFormOFF;
end;

procedure TDelphiCopilotChatView.ReadFromFile;
begin
  if(FileExists(TDelphiCopilotUtils.GetPathFileChat))then
    mmReturn.Lines.LoadFromFile(TDelphiCopilotUtils.GetPathFileChat)
end;

procedure TDelphiCopilotChatView.SelectAll1Click(Sender: TObject);
begin
  mmReturn.SelectAll;
end;

procedure TDelphiCopilotChatView.WriteToFile;
begin
  mmReturn.Lines.SaveToFile(TDelphiCopilotUtils.GetPathFileChat);
end;

procedure TDelphiCopilotChatView.cBoxSizeFontKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(Key, ['0'..'9', #8]))then
    key := #0;
end;

procedure TDelphiCopilotChatView.Cut1Click(Sender: TObject);
begin
  mmReturn.CutToClipboard;
end;

procedure TDelphiCopilotChatView.Copy1Click(Sender: TObject);
begin
  mmReturn.CopyToClipboard;
end;

procedure TDelphiCopilotChatView.Paste1Click(Sender: TObject);
begin
  mmReturn.PasteFromClipboard;
end;

procedure TDelphiCopilotChatView.btnSendClick(Sender: TObject);
begin
  Self.ProcessSend;
end;

procedure TDelphiCopilotChatView.ProcessSend;
var
  LTask: ITask;
begin
  mmReturn.Lines.Clear;
  Self.WaitingFormON;

  LTask := TTask.Create(
    procedure
    begin
      try
        try
          FChat.ProcessSend(mmQuestion.Lines.Text);
        except
          on E: Exception do
            TThread.Synchronize(nil,
              procedure
              begin
                Self.AddResponseSimple('Unable to perform processing.' + sLineBreak + E.Message);
                Abort;
              end);
        end;

        TThread.Synchronize(nil,
          procedure
          begin
            mmReturn.Lines.BeginUpdate;
            try
              Memo1.Lines.Text := FChat.Response.Text;
              Self.AddResponseComplete(FChat.Response);
              //Self.AddResponseSimple(FChat.Response.Text);
            finally
              mmReturn.Lines.EndUpdate;
            end;
          end);
      finally
        TThread.Synchronize(nil,
          procedure
          begin
            Self.WaitingFormOFF;
          end);
      end;
    end);
  LTask.Start;
end;

procedure TDelphiCopilotChatView.WaitingFormON;
begin
  pnWait.Visible := False;
  TDelphiCopilotUtils.CenterPanel(pnWait, mmReturn);
  pnWait.Visible := True;
end;

procedure TDelphiCopilotChatView.WaitingFormOFF;
begin
  pnWait.Visible := False;
end;

procedure TDelphiCopilotChatView.Last;
begin
  SendMessage(mmReturn.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

function TDelphiCopilotChatView.GetSelectedTextOrAll: string;
begin
  if not mmReturn.SelText.Trim.IsEmpty then
    Result := mmReturn.SelText
  else
    Result := mmReturn.Lines.Text;
end;

procedure TDelphiCopilotChatView.btnCopyClick(Sender: TObject);
begin
  Clipboard.AsText := Self.GetSelectedTextOrAll;
end;

procedure TDelphiCopilotChatView.btnInsertAtCursorClick(Sender: TObject);
begin
  TDelphiCopilotUtilsOTA.DeleteBlockTextSelectedInEditor;
  TDelphiCopilotUtilsOTA.InsertBlockTextIntoEditor(Self.GetSelectedTextOrAll);
end;

procedure TDelphiCopilotChatView.InitializeRichEditReturn;
begin
  mmReturn.Lines.Clear;
  mmReturn.SelAttributes.Name := 'Courier New';
  mmReturn.SelAttributes.Size := 10;

  if TDelphiCopilotUtilsOTA.ActiveThemeIsDark then
  begin
    mmReturn.Color := $004A4136;
    mmReturn.SelAttributes.Color := clWhite;
  end
  else
  begin
    mmReturn.Color := clWindow;
    mmReturn.SelAttributes.Color := clWindowText;
  end;
end;

procedure TDelphiCopilotChatView.AddResponseSimple(const AString: string);
begin
  Self.Last;
  mmReturn.SelAttributes.Color := TDelphiCopilotUtilsOTA.ActiveThemeColorDefault;
  mmReturn.SelAttributes.Style := [];
  mmReturn.Lines.Add(AString);
  Self.Last;
end;

//Add line-by-line response to color where Delphi code is
procedure TDelphiCopilotChatView.AddResponseComplete(const AStrings: TStrings);
var
  LLineNum: Integer;
  LLineStr: string;
  FCodeStarted: Boolean;
begin
  mmReturn.Lines.Clear;
  mmReturn.SelAttributes.Color := TDelphiCopilotUtilsOTA.ActiveThemeColorDefault;
  mmReturn.SelAttributes.Style := [];

  FCodeStarted := False;
  for LLineNum := 0 to Pred(AStrings.Count) do
  begin
    LLineStr := AStrings[LLineNum].TrimRight;

    if not FCodeStarted then
    begin
      if (LLineStr.Trim = TC4DConsts.MARK_BEGIN_DELPHI) or (LLineStr.Trim = TC4DConsts.MARK_BEGIN_PASCAL) then
      begin
        FCodeStarted := True;
        Continue;
      end;
    end;

    if LLineStr.Trim = TC4DConsts.MARK_END then
    begin
      FCodeStarted := False;
      Continue;
    end;

    if FCodeStarted then
      mmReturn.SelAttributes.Color := TDelphiCopilotUtilsOTA.ActiveThemeForCode
    else
      mmReturn.SelAttributes.Color := TDelphiCopilotUtilsOTA.ActiveThemeColorDefault;

    //mmReturn.Lines.Add(LLineStr);
    Self.AddResponseLine(LLineStr);
    SendMessage(mmReturn.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  end;
  Self.Last;
end;

//Bold in words between Backtick
procedure TDelphiCopilotChatView.AddResponseLine(const ALineStr: string);
const
  BACKTICK = '`';
var
  i: Integer;
  LCurrentLetter: Char;
  LNextLetter: Char;
  LLineStarted: Boolean;
  LCodeStarted: Boolean;
begin
  if not ALineStr.Contains(BACKTICK) then
  begin
    mmReturn.Lines.Add(ALineStr);
    Exit;
  end;

  LLineStarted := False;
  LCodeStarted := False;
  for i := 0 to ALineStr.Length do
  begin
    LCurrentLetter := ALineStr[i];
    LNextLetter := ALineStr[Succ(i)];

    if not LCodeStarted then
    begin
      if(LCurrentLetter = BACKTICK)and(LNextLetter <> BACKTICK)then
      begin
        LCodeStarted := True;
        Continue;
      end;
    end;

    if(LCurrentLetter = BACKTICK)and(LNextLetter <> BACKTICK)then
    begin
      LCodeStarted := False;
      mmReturn.SelAttributes.Style := [];
      Continue;
    end;

    SendMessage(mmReturn.Handle, WM_VSCROLL, SB_BOTTOM, 0);
    if LCodeStarted then
      mmReturn.SelAttributes.Style := [fsBold]
    else
      mmReturn.SelAttributes.Style := [];

    if LLineStarted then
      mmReturn.SelText := LCurrentLetter
    else
    begin
      mmReturn.Lines.Add('');
      mmReturn.SelText := LCurrentLetter;

      LLineStarted := True;
    end;
    SendMessage(mmReturn.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  end;
  mmReturn.SelText := ' ';

  //SendMessage(mmReturn.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

initialization

finalization
  Unregister;

end.
