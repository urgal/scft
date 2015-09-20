object TerminalForm: TTerminalForm
  Left = 0
  Top = 0
  Caption = 'Terminal'
  ClientHeight = 421
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTermID: TLabel
    Left = 8
    Top = 45
    Width = 68
    Height = 13
    Caption = 'ID '#1090#1077#1088#1084#1080#1085#1072#1083#1072
  end
  object lbShiftID: TLabel
    Left = 8
    Top = 71
    Width = 45
    Height = 13
    Caption = 'ID '#1089#1084#1077#1085#1099
  end
  object lbPAN: TLabel
    Left = 8
    Top = 125
    Width = 55
    Height = 13
    Caption = 'PAN '#1082#1072#1088#1090#1099
  end
  object lbCurrency: TLabel
    Left = 8
    Top = 176
    Width = 39
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072
  end
  object lbAmount: TLabel
    Left = 8
    Top = 205
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object lbOperType: TLabel
    Left = 8
    Top = 99
    Width = 50
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
  end
  object lbPinBlock: TLabel
    Left = 8
    Top = 152
    Width = 45
    Height = 13
    Caption = 'PIN-'#1073#1083#1086#1082
  end
  object edTermID: TEdit
    Left = 86
    Top = 42
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btPacketMode: TButton
    Left = 552
    Top = 230
    Width = 75
    Height = 25
    Caption = #1040#1074#1090#1086'-'#1088#1077#1078#1080#1084
    Enabled = False
    TabOrder = 1
    OnClick = btPacketModeClick
  end
  object edPan: TEdit
    Left = 86
    Top = 122
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edAmount: TEdit
    Left = 86
    Top = 203
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object btSend: TButton
    Left = 156
    Top = 230
    Width = 75
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1082#1072
    Enabled = False
    TabOrder = 4
    OnClick = btSendClick
  end
  object cbOperType: TComboBox
    Left = 86
    Top = 95
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object edShiftID: TEdit
    Left = 86
    Top = 68
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object btGenerate: TButton
    Left = 8
    Top = 230
    Width = 137
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    Enabled = False
    TabOrder = 7
    OnClick = btGenerateClick
  end
  object btOpenShift: TButton
    Left = 8
    Top = 10
    Width = 223
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
    TabOrder = 8
    OnClick = btOpenShiftClick
  end
  object dbTermOpers: TDBGrid
    Left = 8
    Top = 264
    Width = 619
    Height = 149
    DataSource = dsTermOpers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edCurrency: TEdit
    Left = 86
    Top = 176
    Width = 59
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object edPinBlock: TEdit
    Left = 86
    Top = 149
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object PacketProgress: TProgressBar
    Left = 248
    Top = 230
    Width = 298
    Height = 25
    TabOrder = 12
  end
  object dsTermOpers: TDataSource
    DataSet = OperQuery
    Left = 384
    Top = 272
  end
  object rstClient: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 472
    Top = 24
  end
  object rstReq: TRESTRequest
    Client = rstClient
    Params = <>
    Response = rstResp
    Left = 472
    Top = 72
  end
  object rstResp: TRESTResponse
    Left = 472
    Top = 120
  end
  object OperQuery: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select id, oper_type, pan, oper_currency, oper_time, oper_sum fr' +
        'om tbl_operation where id_shift=:shiftID')
    Left = 296
    Top = 304
  end
end
