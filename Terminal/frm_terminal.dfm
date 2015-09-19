object TerminalForm: TTerminalForm
  Left = 0
  Top = 0
  Caption = 'Terminal'
  ClientHeight = 400
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
    Left = 8
    Top = 11
    Width = 68
    Height = 13
    Caption = 'ID '#1090#1077#1088#1084#1080#1085#1072#1083#1072
  end
  object lbShiftID: TLabel
    Left = 8
    Top = 37
    Width = 45
    Height = 13
    Caption = 'ID '#1089#1084#1077#1085#1099
  end
  object lbPAN: TLabel
    Left = 8
    Top = 91
    Width = 55
    Height = 13
    Caption = 'PAN '#1082#1072#1088#1090#1099
  end
  object lbCurrency: TLabel
    Left = 8
    Top = 118
    Width = 39
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072
  end
  object lbAmount: TLabel
    Left = 8
    Top = 147
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object lbOperType: TLabel
    Left = 8
    Top = 65
    Width = 50
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
  end
  object edTermID: TEdit
    Left = 86
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object btPacketMode: TButton
    Left = 8
    Top = 367
    Width = 75
    Height = 25
    Caption = #1040#1074#1090#1086'-'#1088#1077#1078#1080#1084
    TabOrder = 1
  end
  object edPan: TEdit
    Left = 86
    Top = 88
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object edCurrency: TEdit
    Left = 86
    Top = 115
    Width = 59
    Height = 21
    TabOrder = 3
  end
  object edAmount: TEdit
    Left = 86
    Top = 142
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object btSend: TButton
    Left = 8
    Top = 169
    Width = 75
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1082#1072
    TabOrder = 5
  end
  object cbOperType: TComboBox
    Left = 86
    Top = 61
    Width = 145
    Height = 21
    TabOrder = 6
  end
  object edShiftID: TEdit
    Left = 86
    Top = 34
    Width = 145
    Height = 21
    TabOrder = 7
  end
  object dbTermOpers: TDBGrid
    Left = 8
    Top = 200
    Width = 439
    Height = 145
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btGenerate: TButton
    Left = 372
    Top = 8
    Width = 75
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    TabOrder = 9
  end
  object dsTermOpers: TDataSource
    Left = 224
    Top = 208
  end
end
