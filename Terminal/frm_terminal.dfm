object TerminalForm: TTerminalForm
  Left = 0
  Top = 0
  Caption = 'Terminal'
  ClientHeight = 421
  ClientWidth = 455
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
    Left = 112
    Top = 51
    Width = 68
    Height = 13
    Caption = 'ID '#1090#1077#1088#1084#1080#1085#1072#1083#1072
  end
  object lbShiftID: TLabel
    Left = 112
    Top = 77
    Width = 45
    Height = 13
    Caption = 'ID '#1089#1084#1077#1085#1099
  end
  object lbPAN: TLabel
    Left = 112
    Top = 131
    Width = 55
    Height = 13
    Caption = 'PAN '#1082#1072#1088#1090#1099
  end
  object lbCurrency: TLabel
    Left = 112
    Top = 158
    Width = 39
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072
  end
  object lbAmount: TLabel
    Left = 112
    Top = 187
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object lbOperType: TLabel
    Left = 112
    Top = 105
    Width = 50
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
  end
  object edTermID: TEdit
    Left = 190
    Top = 48
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btPacketMode: TButton
    Left = 372
    Top = 225
    Width = 75
    Height = 25
    Caption = #1040#1074#1090#1086'-'#1088#1077#1078#1080#1084
    Enabled = False
    TabOrder = 1
  end
  object edPan: TEdit
    Left = 190
    Top = 128
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edCurrency: TEdit
    Left = 190
    Top = 158
    Width = 59
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edAmount: TEdit
    Left = 190
    Top = 185
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object btSend: TButton
    Left = 260
    Top = 225
    Width = 75
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1082#1072
    Enabled = False
    TabOrder = 5
  end
  object cbOperType: TComboBox
    Left = 190
    Top = 101
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object edShiftID: TEdit
    Left = 190
    Top = 74
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object dbTermOpers: TDBGrid
    Left = 8
    Top = 264
    Width = 439
    Height = 149
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btGenerate: TButton
    Left = 112
    Top = 225
    Width = 137
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    Enabled = False
    TabOrder = 9
    OnClick = btGenerateClick
  end
  object btOpenShift: TButton
    Left = 112
    Top = 8
    Width = 223
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
    TabOrder = 10
    OnClick = btOpenShiftClick
  end
  object dsTermOpers: TDataSource
    Left = 384
    Top = 272
  end
end