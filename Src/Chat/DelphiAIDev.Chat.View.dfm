object DelphiAIDevChatView: TDelphiAIDevChatView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'AI Chat'
  ClientHeight = 661
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    975
    661)
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 661
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    Padding.Left = 18
    Padding.Top = 15
    ParentBackground = False
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 18
      Top = 518
      Width = 938
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitWidth = 528
    end
    object mmReturn: TRichEdit
      AlignWithMargins = True
      Left = 18
      Top = 15
      Width = 938
      Height = 500
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      ParentCustomHint = False
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'iii'
        'www')
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pMenuMemoReturn
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
      Zoom = 100
    end
    object pnBackQuestion: TPanel
      Left = 18
      Top = 521
      Width = 938
      Height = 113
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Padding.Top = 5
      ParentBackground = False
      TabOrder = 0
      object mmQuestion: TMemo
        AlignWithMargins = True
        Left = 0
        Top = 5
        Width = 938
        Height = 108
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = mmQuestionChange
        OnKeyDown = mmQuestionKeyDown
        OnKeyUp = mmQuestionKeyUp
      end
    end
    object pnBackStatusBar: TPanel
      Left = 18
      Top = 634
      Width = 938
      Height = 27
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Padding.Top = 3
      Padding.Bottom = 2
      ParentBackground = False
      TabOrder = 2
      object lbCurrentAI: TLabel
        Left = 0
        Top = 3
        Width = 56
        Height = 22
        Cursor = crHandPoint
        Hint = 'AI being used'
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'lbCurrentAI'
        PopupMenu = pMenuCurrentAI
        OnClick = lbCurrentAIClick
        ExplicitHeight = 13
      end
      object btnSend: TButton
        AlignWithMargins = True
        Left = 864
        Top = 3
        Width = 74
        Height = 22
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Send'
        TabOrder = 0
        OnClick = btnSendClick
      end
      object pnBackConfigurableButtons: TPanel
        Left = 395
        Top = 3
        Width = 466
        Height = 22
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnUseCurrentUnitCode: TButton
          AlignWithMargins = True
          Left = 261
          Top = 0
          Width = 205
          Height = 22
          Cursor = crHandPoint
          Hint = 'Use data from current unit in query'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = '* Use current unit code in query * '
          ImageIndex = 1
          Images = ImageList1
          TabOrder = 0
          OnClick = btnUseCurrentUnitCodeClick
        end
        object btnCodeOnly: TButton
          AlignWithMargins = True
          Left = 149
          Top = 0
          Width = 109
          Height = 22
          Cursor = crHandPoint
          Hint = 'Return only code without comments or explanations'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = '* Code only *'
          ImageIndex = 2
          Images = ImageList1
          TabOrder = 1
          OnClick = btnCodeOnlyClick
        end
        object btnDefaultsQuestions: TButton
          AlignWithMargins = True
          Left = 56
          Top = 0
          Width = 90
          Height = 22
          Cursor = crHandPoint
          Hint = 'Defaults Questions'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Questions'
          ImageIndex = 4
          Images = ImageList1
          PopupMenu = pMenuQuestions
          TabOrder = 2
          OnClick = btnDefaultsQuestionsClick
        end
      end
    end
  end
  object pnWait: TPanel
    Left = 413
    Top = 256
    Width = 125
    Height = 35
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Caption = 'Wait for loading...'
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object ShapeWait: TShape
      Left = 0
      Top = 0
      Width = 125
      Height = 35
      Align = alClient
      Brush.Color = 16770222
      Pen.Color = 12615680
      Pen.Style = psInsideFrame
      Pen.Width = 2
      ExplicitLeft = 32
      ExplicitTop = 19
      ExplicitWidth = 228
      ExplicitHeight = 49
    end
    object pnWaitCaption: TPanel
      Left = 0
      Top = 0
      Width = 125
      Height = 35
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Wait for loading...'
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 956
    Top = 0
    Width = 19
    Height = 661
    Align = alRight
    Panels = <
      item
        Width = 50
      end>
  end
  object pnCommands: TPanel
    Left = 936
    Top = 8
    Width = 26
    Height = 95
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      26
      95)
    object ShapeCommands: TShape
      Left = 0
      Top = 0
      Width = 26
      Height = 95
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
      Pen.Style = psInsideFrame
      ExplicitHeight = 73
    end
    object btnCopy: TSpeedButton
      AlignWithMargins = True
      Left = 0
      Top = 23
      Width = 26
      Height = 23
      Cursor = crHandPoint
      Hint = 'Copy'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFB58C8C8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A
        5A8C5A5A8C5A5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7F7
        EFDEF7EFDEF7EFDEF7EFDEF7EFDEF7EFDEF7E7CE8C5A5AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB58C8CF7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6EFDE
        CEEFDECE8C5A5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7FF
        D6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE8C5A5AFF00FFFF00FFB58C8C
        8C5A5A8C5A5A8C5A5AB58C8CFFF7EFF7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7
        CEEFDECE9C6B63FF00FFFF00FFB58C8CFFF7E7F7EFDEF7EFDEB58C8CFFF7EFF7
        E7CEF7DEC6F7DEC6F7DEC6F7DEC6F7E7D6EFDECE9C6B6BFF00FFFF00FFB58C8C
        F7EFDEF7DECEF7DEC6B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6
        A5EFE7D6A57B73FF00FFFF00FFB58C8CFFF7E7FFD6A5FFD6A5B58C8CFFFFF7FF
        E7D6FFE7D6F7E7D6F7E7CEFFE7D6FFF7E7EFDEDEA57B73FF00FFFF00FFB58C8C
        FFF7EFF7DEC6F7DEC6B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6
        C6BDADADB58473FF00FFFF00FFB58C8CFFF7EFF7E7CEF7DEC6B58C8CFFFFFFFF
        FFFFFFFFFFFFFFF7FFFFF7B58C8CB58C8CB58C8CB58C8CFF00FFFF00FFB58C8C
        FFFFF7FFD6A5FFD6A5B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB5
        6BC68C7BFF00FFFF00FFFF00FFB58C8CFFFFF7FFE7D6FFE7D6B58C8CB58C8CB5
        8C8CB58C8CB58C8CB58C8CB58C8CBD8484FF00FFFF00FFFF00FFFF00FFB58C8C
        FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6C6BDADADB58473FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFB58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7B5
        8C8CB58C8CB58C8CB58C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8C
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB56BC68C7BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFB58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB5
        8C8CBD8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnCopyClick
      ExplicitTop = 24
    end
    object btnInsertAtCursor: TSpeedButton
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 26
      Height = 23
      Cursor = crHandPoint
      Hint = 'Insert Selected Text at Cursor'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Flat = True
      Glyph.Data = {
        8E010000424D8E010000000000008E0000002800000010000000100000000100
        08000000000000010000120B0000120B0000160000001600000000000000FFFF
        FF00FF00FF00811E0000BD4C0000FFFBF800FFE9D300FFF6ED00FEE0C000FEE3
        C500FEE6CB00FFF0E000FFF3E600FEDEB800FEEAD100FEEED900FFF7ED00FEFB
        F700FFFAF200FFFEFB00004B000031C758000202020202020202020202020202
        02020404040404040402020202020202020211100B0E090D0402020202020202
        020213120C0F0A08040202020202020202020105070B06090402020202020202
        0202030303030303040202020202020202020202020202020202140204030303
        03030202020202020214140204100B0E090D0202020202021415140204120C0F
        0A08020202020202021414020405070B06090202020202020202140204030303
        03030303030303030402020202020202020211100B0E090D0402020202020202
        020213120C0F0A08040202020202020202020105070B06090402020202020202
        020204040404040404020202020202020202}
      OnClick = btnInsertAtCursorClick
    end
    object btnMoreActions: TSpeedButton
      AlignWithMargins = True
      Left = 0
      Top = 69
      Width = 26
      Height = 23
      Cursor = crHandPoint
      Hint = 'More actions...'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = '...'
      Flat = True
      PopupMenu = pMenuMoreActions
      OnClick = btnMoreActionsClick
      ExplicitTop = 46
    end
    object btnCreateNewUnit: TSpeedButton
      AlignWithMargins = True
      Left = 0
      Top = 46
      Width = 26
      Height = 23
      Cursor = crHandPoint
      Hint = 'Create new unit with selected code'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD7384B58484B58484B58484B5
        8484B58484B58484B58484B58484B58484B58484B58484FF00FFFF00FFFF00FF
        FF00FFAD7384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB58484FF00FFFF00FFFF00FFFF00FFAD7384FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58484FF00FFFF00FFFF00FF
        FF00FFAD7384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB58484FF00FFFF00FFFF00FFFF00FFAD7384FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58484FF00FFFF00FFFF00FF
        FF00FFAD7384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB58484FF00FFFF00FFFF00FFFF00FFAD7384FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58484FF00FFFF00FFFF00FF
        FF00FFAD7384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB58484FF00FFFF00FFFF00FF3184FF3184FF3184FFF7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7B58484FF00FFFF00FFFF00FF
        3184FF42B5F73184FFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFB58484FF00FF3184FF3184FF3184FF42B5F73184FF3184FF3184FFE7
        E7E7E7E7E7E7E7E7E7E7E7B58473B5948CB58C84B58484FF00FF3184FF8CD6F7
        B5DEF7B5DEF7B5DEF78CD6F73184FFDEDEDEDEDEDEDEDEDEC6C6C6B58473FFFF
        FFFFFFFFB58484FF00FF3184FF3184FF3184FFB5DEF73184FF3184FF3184FFD6
        D6D6D6D6D6D6D6D6C6C6C6B58473FFFFFFB58484FF00FFFF00FFFF00FFFF00FF
        3184FFB5DEF73184FFCECECECECECECECECECECECECECECEC6C6C6B58473B584
        84FF00FFFF00FFFF00FFFF00FFFF00FF3184FF3184FF3184FFEFD6C6EFD6C6EF
        D6C6EFD6C6EFD6C6D6BDB5B58473FF00FFFF00FFFF00FFFF00FF}
      OnClick = btnCreateNewUnitClick
      ExplicitTop = 55
    end
  end
  object ImageList1: TImageList
    Left = 96
    Top = 240
    Bitmap = {
      494C010105003000040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFF0CAA600F0CAA600C0C0C000C0C0C000CCCC9900F0CAA6000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFF0CA
      A600D7D7D700E3E3E300E3E3E300CBCBCB00C0C0C000C0C0C000B2B2B200A4A0
      A000F0CAA600000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFF0CAA600EAEA
      EA00F0FBFF00F0CAA600CC666600CC663300CC663300CC666600CC999900B2B2
      B200A4A0A000CC999900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFF0CAA600F1F1F100FFFF
      FF00CC996600CC330000CC333300FFCCCC00F0CAA600CC330000CC330000CC66
      6600B2B2B200B2B2B200F0CAA600000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE3E3E300FFFFFF00CC99
      6600CC330000CC333300CC663300CC999900CC999900CC333300CC333300CC33
      0000CC996600C0C0C000C0C0C000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0CAA600FFFFFF00FFECCC00CC66
      3300CC333300CC333300CC663300CC999900CC996600CC333300CC663300CC33
      3300CC663300B2B2B200CBCBCB00F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCCC00FFFFFF00CC999900CC66
      3300CC663300CC663300CC663300F8F8F800EAEAEA00CC663300CC330000CC66
      3300CC330000CC996600D7D7D700F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCCC00FFFFFF00CC996600CC66
      3300CC663300CC663300CC663300F0CAA600FFFFFF00F0CAA600CC663300CC33
      0000CC330000CC666600EAEAEA00F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCCC00FFFFFF00CC996600CC66
      3300CC663300CC663300CC663300CC663300F0CAA600FFFFFF00FFECCC00CC66
      3300CC330000CC666600F1F1F100F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCCC00FFFFFF00F0CAA600CC66
      3300CC993300CC996600CC663300CC663300CC663300F0CAA600FFFFFF00CC99
      6600CC330000CC996600F0FBFF00F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCCC00F8F8F800EAEAEA00CC99
      6600F0CAA600FFFFFF00CC996600CC663300CC663300CC996600FFFFFF00CC99
      9900CC663300FFCCCC00F1F1F100F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE3E3E300FFFFFF00F0CA
      A600FF999900FFFFFF00F8F8F800F0CAA600F0CAA600F8F8F800F8F8F800CC66
      3300CC996600FFFFFF00FFCCCC00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFF0CAA600F1F1F100FFFF
      FF00F0CAA600F0CAA600FFECCC00F8F8F800F8F8F800FFECCC00CC996600CC99
      9900FFFFFF00EAEAEA00FFCCCC00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFF0CAA600F1F1
      F100FFFFFF00FFECCC00F0CAA600F0CAA600F0CAA600F0CAA600FFCCCC00FFFF
      FF00EAEAEA00F0CAA600000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFF0CA
      A600EAEAEA00F1F1F100FFFFFF00FFFFFF00FFFFFF00F8F8F800F8F8F800E3E3
      E300E3E3E300000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFF0CAA600F0CAA600FFCCCC00FFCCCC00F0CAA600F0CAA6000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000555555005555
      5500555555005555550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009696
      9600969696009696960000000000000000000000000099999900E3E3E300CCCC
      CC00C0C0C000C0C0C00096969600000000000000000000000000000000004D4D
      4D004D4D4D004D4D4D0000000000000000000000000055555500CBCBCB00A4A0
      A00096969600969696004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000666666006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      0000000000000000000000000000000000000000000000000000969696009999
      9900A4A0A000B2B2B2009696960096969600000000009999990096969600CBCB
      CB00B2B2B200A4A0A000868686000000000000000000000000004D4D4D005555
      550066666600777777004D4D4D004D4D4D0000000000555555004D4D4D009999
      9900808080006666660042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600777777007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000660000008000000066
      0000000000000000000000000000000000000000000096969600C0C0C0009999
      9900B2B2B200A4A0A000B2B2B200B2B2B20096969600CCCCCC00CBCBCB009696
      960096969600868686000000000000000000000000004D4D4D00868686005555
      5500777777005F5F5F0066996600777777004D4D4D00A4A0A000999999004D4D
      4D004D4D4D003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666660086868600868686007777
      7700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000066000000800000009900000080
      00000033000000000000000000000000000096969600C0C0C000E3E3E3009999
      9900B2B2B200A4A0A000A4A0A000B2B2B20096969600B2B2B200CBCBCB00D7D7
      D700D7D7D700D7D7D700B2B2B200868686004D4D4D0096969600C0C0C0005555
      5500777777005F5F5F0033993300666699004D4D4D00FF990000FFCC3300FFCC
      6600FFCC6600CC99990077777700393939000000000000000000000000000000
      0000000000000000000000000000666666009696960096969600808080008686
      8600666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006600000099330000990000008000000080
      00000066000000000000000000000000000096969600EAEAEA00D7D7D7009696
      9600B2B2B200B2B2B200A4A0A000969696009696960099999900A4A0A000C0C0
      C000C0C0C000C0C0C000C0C0C000868686004D4D4D00CCCCCC00B2B2B2005555
      550077777700777777006666990033669900006699003366660099993300FF99
      3300FF993300FF993300FF993300424242000000000000000000000000000000
      0000000000000000000077777700A4A0A000A4A0A00077777700666666008686
      8600808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000660000009933000099330000660000003300000080
      00000080000000000000000000000000000096969600EAEAEA00D7D7D7008686
      8600999999009999990096969600A4A0A000B2B2B200A4A0A00096969600B2B2
      B200CCCCCC00CBCBCB00B2B2B200868686004D4D4D00CCCCCC00B2B2B2000033
      99003366660033666600006699000066CC003399FF000066CC00006699009999
      6600FFCC6600FFCC3300FF993300393939000000000000000000000000000000
      0000000000000000000000000000868686007777770000000000000000007777
      7700969696006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000009933000066000000000000000000000066
      00000099000000660000000000000000000096969600EAEAEA00D7D7D7008686
      86009696960099999900C0C0C000B2B2B20096969600A4A0A000A4A0A0008686
      8600C0C0C000D7D7D700C0C0C000808080004D4D4D00CCCCCC00B2B2B2000033
      99000066CC000066CC003399FF003399CC000066990066666600336699000033
      990086868600FFCC6600FF993300333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868686008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080000000660000000000000000000096969600EAEAEA00D7D7D7008686
      8600A4A0A000B2B2B200B2B2B2009696960096969600CCCCCC00DDDDDD00C0C0
      C00099999900D7D7D700CBCBCB00777777004D4D4D00D7D7D700B2B2B2000033
      99000066FF000099FF003366CC00336666004D4D4D00FFCC6600FFCC99006699
      990033669900FFCC6600FFCC3300292929000000000000000000333333003333
      3300000000000000000000000000333333003333330000000000000000000000
      00003333330033333300333333000000000000000000000000000000FF000000
      FF000000000000000000000000000000FF000000FF0000000000000000000000
      00000000FF000000FF000000FF000000000096969600F1F1F100DDDDDD008686
      8600A4A0A000B2B2B200A4A0A0009696960096969600B2B2B200C0C0C000CBCB
      CB00C0C0C000CCCCCC00CBCBCB00777777004D4D4D00DDDDDD00C0C0C0000033
      99000066FF000099FF000066CC00336699004D4D4D008080800099996600A4A0
      A00099996600CCCC6600CC996600222222000000000033333300000000000000
      0000333333000000000033333300000000000000000033333300000000003333
      330000000000808080003333330000000000000000000000FF00000000000000
      00000000FF00000000000000FF0000000000000000000000FF00000000000000
      FF0000000000006600000000FF000000000096969600FFFFFF00E3E3E3008686
      860086868600868686008686860086868600B2B2B20096969600969696009696
      9600969696009696960080808000000000004D4D4D00F1F1F100CBCBCB000033
      990000339900003399000033990000339900666699004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D0039393900000000000000000033333300000000000000
      0000000000000000000033333300000000000000000033333300000000003333
      330000000000000000003333330000000000000000000000FF00000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      FF0000000000000000000000FF000000000096969600F1F1F100C0C0C0009999
      9900CCCCCC0099999900A4A0A000B2B2B200C0C0C00096969600000000000000
      0000000000000000000000000000000000004D4D4D00DDDDDD00969696005555
      5500A4A0A000555555005F5F5F0077777700969696004D4D4D00000000000000
      0000000000000000000000000000000000000000000033333300000000000000
      0000333333000000000033333300000000000000000033333300000000003333
      330000000000000000003333330066666600000000000000FF00000000000000
      00000000FF00000000000000FF0000000000000000000000FF00000000000000
      FF0000000000000000000000FF000033000096969600CCCCCC00F1F1F100C0C0
      C000B2B2B200B2B2B200C0C0C000A4A0A000A4A0A00096969600000000000000
      0000000000000000000000000000000000004D4D4D00A4A0A000DDDDDD009696
      9600777777008080800096969600666666005F5F5F004D4D4D00000000000000
      0000000000000000000000000000000000000000000000000000333333003333
      3300000000000000000000000000333333003333330000000000000000000000
      00003333330033333300333333006666660000000000000000000000FF000000
      FF000000000000000000000000000000FF000000FF0000000000000000000000
      00000000FF000000FF000000FF000033000096969600FFFFFF00FFFFFF00F8F8
      F800DDDDDD00CCCCCC00C0C0C000C0C0C000C0C0C00096969600000000000000
      0000000000000000000000000000000000004D4D4D00FFFFFF00F1F1F100E3E3
      E300C0C0C000A4A0A0008686860080808000808080004D4D4D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000A4A0A00096969600FFFFFF00FFFF
      FF00FFFFFF00EAEAEA00CCCCCC00969696009696960000000000000000000000
      000000000000000000000000000000000000666666004D4D4D00FFFFFF00FFFF
      FF00F8F8F800D7D7D700A4A0A0004D4D4D004D4D4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000969696009696
      9600969696009696960096969600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F000000000000FFC3FFC3FFFFFFFFE381E381FFCFFFCF
      C081C081FF8FFF8F80038003FF07FF0700000000FE07FE0700000000FC07FC07
      00000000FE63FE6300000000FFF3FFF300000000CE71CE7100000000B5A9B5A9
      00010001BDADBDAD003F003FB5ACB5AC003F003FCE70CE70003F003FFFFDFFFD
      007F007FFFFDFFFDC1FFC1FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pMenuMemoReturn: TPopupMenu
    Left = 96
    Top = 296
    object Cut1: TMenuItem
      Caption = 'Cut'
      ShortCut = 16472
      OnClick = Cut1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object Paste1: TMenuItem
      Caption = 'Paste'
      ShortCut = 16470
      OnClick = Paste1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object WordWrap1: TMenuItem
      AutoCheck = True
      Caption = 'WordWrap'
      Checked = True
      OnClick = WordWrap1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select all'
      ShortCut = 16449
      OnClick = SelectAll1Click
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
    end
  end
  object pMenuCurrentAI: TPopupMenu
    OnPopup = pMenuCurrentAIPopup
    Left = 26
    Top = 575
    object Gemini1: TMenuItem
      Caption = 'Gemini'
      OnClick = Gemini1Click
    end
    object ChatGPT1: TMenuItem
      Tag = 1
      Caption = 'ChatGPT'
      OnClick = Gemini1Click
    end
  end
  object pMenuMoreActions: TPopupMenu
    Images = ImageList1
    Left = 824
    Top = 40
    object SaveContentToFile1: TMenuItem
      Caption = 'Save content to file'
      OnClick = SaveContentToFile1Click
    end
    object ClearContent1: TMenuItem
      Caption = 'Clear content'
      OnClick = ClearContent1Click
    end
  end
  object pMenuQuestions: TPopupMenu
    Left = 522
    Top = 563
  end
end