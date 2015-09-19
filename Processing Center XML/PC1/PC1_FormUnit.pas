unit PC1_FormUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Data.Win.ADODB, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc;

type
  TForm1 = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    Procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

function LogAction(aIDRequest, aIDTerminal : integer;
                    aTextRequest, aTextResponse,aIpAddress : String;
                    aDirection, aErrorCode: Integer) : integer;


var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Winapi.ShellApi, Datasnap.DSSession;

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

Procedure TForm1.Refresh;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'select ID, '+
                                'IDRequest, '+
                                'IDTerminal, '+
                                'Left(TextRequest,200) as TextRequest, '+
                                'Left(TextResponse,200) as TextResponse, '+
                                'Direction, '+
                                'ErrorCode,  '+
                                'DateTimeTransaction '+
                                ' from PC1_log order by 1 desc';
  ADOQuery1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Refresh;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'delete * from PC1_Log';
  ADOQuery1.ExecSQL;
  Refresh;
end;

procedure TForm1.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
  Refresh;
end;

procedure TForm1.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;


function LogAction(aIDRequest, aIDTerminal : integer;
                    aTextRequest, aTextResponse, aIpAddress : String;
                    aDirection, aErrorCode: Integer) : integer;
begin
  Form1.ADOQuery1.SQL.Text := 'insert into PC1_Log (IDRequest, '+
                                                   'IDTerminal, '+
                                                   'TextRequest, '+
                                                   'TextResponse, '+
                                                   'Direction, '+
                                                   'ErrorCode,  '+
                                                   'DateTimeTransaction, '+
                                                   'ipAdress)  '+
                                ' values ( '+
                                                     ' :IDRequest, '+
                                                     ' :IDTerminal, '+
                                                     ' :TextRequest, '+
                                                     ' :TextResponse, '+
                                                     ' :Direction, '+
                                                     ' :ErrorCode, '+
                                                     ' :DateTimeTransaction, '+
                                                     ' :ipAdress) ';
  Form1.ADOQuery1.Parameters.ParamByName('IDRequest').Value := aIDRequest;
  Form1.ADOQuery1.Parameters.ParamByName('IDTerminal').Value := aIDTerminal;
  Form1.ADOQuery1.Parameters.ParamByName('TextRequest').Value := aTextRequest;
  Form1.ADOQuery1.Parameters.ParamByName('TextResponse').Value := aTextResponse;
  Form1.ADOQuery1.Parameters.ParamByName('Direction').Value := aDirection;
  Form1.ADOQuery1.Parameters.ParamByName('ErrorCode').Value := aErrorCode;
  Form1.ADOQuery1.Parameters.ParamByName('DateTimeTransaction').Value := Now;
  Form1.ADOQuery1.Parameters.ParamByName('ipAdress').Value := aIpAddress;
  try
    Form1.ADOQuery1.ExecSQL;
    Form1.Refresh;
    Result := Form1.ADOQuery1.Fields[0].AsInteger;
  except
    Result := 0;
  end;
end;


end.
