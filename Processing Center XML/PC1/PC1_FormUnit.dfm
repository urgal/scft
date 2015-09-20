object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'Form1'
  ClientHeight = 390
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    766
    390)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 24
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 143
    Width = 746
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 137
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 218
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 200
    Top = 8
    Width = 529
    Height = 89
    TabOrder = 7
  end
  object Button3: TButton
    Left = 552
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 8
    OnClick = Button3Click
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 288
    Top = 24
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=\\ADM' +
      'INISTRATOR\base\PCBase.mdb;Mode=Share Deny None;Persist Security' +
      ' Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path' +
      '="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet O' +
      'LEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2' +
      ';Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Pas' +
      'sword="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encryp' +
      't Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Je' +
      't OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 384
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from PC1_log')
    Left = 480
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 480
    Top = 64
  end
end
