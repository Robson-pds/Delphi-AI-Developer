unit DelphiAIDev.Settings.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  DelphiAIDev.Settings,
  DelphiAIDev.Types,
  Vcl.Buttons;

type
  TDelphiAIDevSettingsView = class(TForm)
    pnBottom: TPanel;
    btnConfirm: TButton;
    btnClose: TButton;
    pnBackAll: TPanel;
    pnBody: TPanel;
    gBoxGemini: TGroupBox;
    pnGeminiBack: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbLinkGemini01: TLabel;
    edtBaseUrlGemini: TEdit;
    edtApiKeyGemini: TEdit;
    cBoxModelGemini: TComboBox;
    lbLinkGemini02: TLabel;
    GroupBox2: TGroupBox;
    gBoxOpenAI: TGroupBox;
    pnOpenAIBack: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    lbLinkGpt01: TLabel;
    edtBaseUrlOpenAI: TEdit;
    edtApiKeyOpenAI: TEdit;
    cBoxModelOpenAI: TComboBox;
    Label11: TLabel;
    cBoxAIDefault: TComboBox;
    btnApiKeyGeminiView: TSpeedButton;
    btnApiKeyOpenAIView: TSpeedButton;
    lbLinkGpt02: TLabel;
    lbRestoreDefaults: TLabel;
    ColorBoxColorHighlightCodeDelphi: TColorBox;
    ckColorHighlightCodeDelphiUse: TCheckBox;
    lbLinkGemini03: TLabel;
    Label4: TLabel;
    cBoxLanguageQuestions: TComboBox;
    gboxData: TGroupBox;
    btnOpenDataFolder: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure lbLinkGpt01Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnApiKeyGeminiViewClick(Sender: TObject);
    procedure btnApiKeyOpenAIViewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbRestoreDefaultsClick(Sender: TObject);
    procedure ckColorHighlightCodeDelphiUseClick(Sender: TObject);
    procedure btnOpenDataFolderClick(Sender: TObject);
  private
    FSettings: TDelphiAIDevSettings;
    procedure SaveSettings;
    procedure LoadSettings;
    procedure ConfigScreen;
    procedure ConfigFieldsColorHighlightDelphi;
    procedure FillcBoxLanguageQuestions;
    procedure FillcBoxAIDefault;
  public

  end;

var
  DelphiAIDevSettingsView: TDelphiAIDevSettingsView;

implementation

uses
  DelphiAIDev.Utils,
  DelphiAIDev.Utils.OTA;

{$R *.dfm}

procedure TDelphiAIDevSettingsView.FormCreate(Sender: TObject);
begin
  TUtilsOTA.IDEThemingAll(TDelphiAIDevSettingsView, Self);
  FSettings := TDelphiAIDevSettings.GetInstance;

  Self.FillcBoxLanguageQuestions;
  Self.FillcBoxAIDefault;
end;

procedure TDelphiAIDevSettingsView.FormShow(Sender: TObject);
begin
  FSettings.LoadData;
  Self.ConfigScreen;
  //FSettings.LoadData;
  Self.LoadSettings;
end;

procedure TDelphiAIDevSettingsView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSettings.LoadData;
end;

procedure TDelphiAIDevSettingsView.FillcBoxLanguageQuestions;
var
  LItem: TC4DLanguage;
begin
  cBoxLanguageQuestions.Items.Clear;
  for LItem := Low(TC4DLanguage) to High(TC4DLanguage) do
    cBoxLanguageQuestions.Items.Add(LItem.ToString);
end;

procedure TDelphiAIDevSettingsView.FillcBoxAIDefault;
var
  LItem: TC4DAIsAvailable;
begin
  cBoxAIDefault.Items.Clear;
  for LItem := Low(TC4DAIsAvailable) to High(TC4DAIsAvailable) do
    cBoxAIDefault.Items.Add(LItem.ToString);
end;

procedure TDelphiAIDevSettingsView.ConfigScreen;
var
  LColor: TColor;
begin
  LColor := TUtilsOTA.ActiveThemeColorLink;
  lbLinkGemini01.Font.Color := LColor;
  lbLinkGemini02.Font.Color := LColor;
  lbLinkGemini03.Font.Color := LColor;
  lbLinkGpt01.Font.Color := LColor;
  lbLinkGpt02.Font.Color := LColor;
  lbRestoreDefaults.Font.Color := LColor;
end;

procedure TDelphiAIDevSettingsView.btnApiKeyGeminiViewClick(Sender: TObject);
begin
  TUtils.TogglePasswordChar(edtApiKeyGemini);
end;

procedure TDelphiAIDevSettingsView.btnApiKeyOpenAIViewClick(Sender: TObject);
begin
  TUtils.TogglePasswordChar(edtApiKeyOpenAI);
end;

procedure TDelphiAIDevSettingsView.btnCloseClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TDelphiAIDevSettingsView.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case(Key)of
    VK_F4:
      if(ssAlt in Shift)then
        Key := 0;
    VK_ESCAPE:
      if(Shift = [])then
        btnClose.Click;
  end;
end;

procedure TDelphiAIDevSettingsView.lbLinkGpt01Click(Sender: TObject);
begin
  //**Several
  TUtils.OpenLink(TLabel(Sender).Hint.Trim);
end;

procedure TDelphiAIDevSettingsView.lbRestoreDefaultsClick(Sender: TObject);
var
  LApiKeyGemini: string;
  LApiKeyOpenAI: string;
begin
  LApiKeyGemini := FSettings.ApiKeyGemini;
  LApiKeyOpenAI := FSettings.ApiKeyOpenAI;

  FSettings.LoadDefaults;

  FSettings.ApiKeyGemini := LApiKeyGemini;
  FSettings.ApiKeyOpenAI := LApiKeyOpenAI;

  Self.LoadSettings;
end;

procedure TDelphiAIDevSettingsView.btnConfirmClick(Sender: TObject);
begin
  Self.SaveSettings;
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TDelphiAIDevSettingsView.ckColorHighlightCodeDelphiUseClick(Sender: TObject);
begin
  Self.ConfigFieldsColorHighlightDelphi;
end;

procedure TDelphiAIDevSettingsView.ConfigFieldsColorHighlightDelphi;
begin
  ColorBoxColorHighlightCodeDelphi.Enabled := ckColorHighlightCodeDelphiUse.Checked;
end;

procedure TDelphiAIDevSettingsView.LoadSettings;
begin
  cBoxLanguageQuestions.ItemIndex := Integer(FSettings.LanguageQuestions);
  cBoxAIDefault.ItemIndex := Integer(FSettings.AIDefault);

  ckColorHighlightCodeDelphiUse.Checked := FSettings.ColorHighlightCodeDelphiUse;
  ColorBoxColorHighlightCodeDelphi.Selected := FSettings.ColorHighlightCodeDelphi;
  Self.ConfigFieldsColorHighlightDelphi;

  edtBaseUrlGemini.Text := FSettings.BaseUrlGemini;
  cBoxModelGemini.ItemIndex := cBoxModelGemini.Items.IndexOf(FSettings.ModelGemini);
  edtApiKeyGemini.Text := FSettings.ApiKeyGemini;

  edtBaseUrlOpenAI.Text := FSettings.BaseUrlOpenAI;
  cBoxModelOpenAI.ItemIndex := cBoxModelOpenAI.Items.IndexOf(FSettings.ModelOpenAI);
  edtApiKeyOpenAI.Text := FSettings.ApiKeyOpenAI;
end;

procedure TDelphiAIDevSettingsView.SaveSettings;
begin
  FSettings.LanguageQuestions := TC4DLanguage(cBoxLanguageQuestions.ItemIndex);
  FSettings.AIDefault := TC4DAIsAvailable(cBoxAIDefault.ItemIndex);

  FSettings.ColorHighlightCodeDelphiUse := ckColorHighlightCodeDelphiUse.Checked;
  FSettings.ColorHighlightCodeDelphi := ColorBoxColorHighlightCodeDelphi.Selected;

  FSettings.BaseUrlGemini := edtBaseUrlGemini.Text;
  FSettings.ModelGemini := cBoxModelGemini.Text;
  FSettings.ApiKeyGemini := edtApiKeyGemini.Text;

  FSettings.BaseUrlOpenAI := edtBaseUrlOpenAI.Text;
  FSettings.ModelOpenAI := cBoxModelOpenAI.Text;
  FSettings.ApiKeyOpenAI := edtApiKeyOpenAI.Text;

  FSettings.SaveData;
end;

procedure TDelphiAIDevSettingsView.btnOpenDataFolderClick(Sender: TObject);
var
  LPathFolder: string;
begin
  LPathFolder := TUtils.GetPathFolderRoot;
  if(not DirectoryExists(LPathFolder))then
    TUtils.ShowMsg('Forder not found: ' + LPathFolder);

  TUtils.OpenFolder(LPathFolder);
end;

end.
