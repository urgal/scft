unit PC1_FormUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Data.Win.ADODB, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, Soap.EncdDecd;

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

function LogAction(aIDRequest: integer;
                   aIDTerminal, aTextRequest, aTextResponse, aIpAddress : String;
                   aDirection, aErrorCode: Integer;
                   aTypeRequest :String) : integer;


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

procedure WidthCol;
begin
 Form1.DBgrid1.Columns[0].Width := 25;
 Form1.DBgrid1.Columns[1].Width := 75;
 Form1.DBgrid1.Columns[2].Width := 75;
 Form1.DBgrid1.Columns[3].Width := 100;
 Form1.DBgrid1.Columns[4].Width := 125;
 Form1.DBgrid1.Columns[5].Width := 150;
 Form1.DBgrid1.Columns[6].Width := 100;
 Form1.DBgrid1.Columns[7].Width := 100;
 Form1.DBgrid1.Columns[8].Width := 125;
 end;

Procedure TForm1.Refresh;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'select ID, '+
                                'IDRequest, '+
                                'TypeRequest, '+
                                'IDTerminal, '+
                                'Left(TextRequest,25) as TextRequest, '+
                                'Left(TextResponse,25) as TextResponse, '+
                                'Direction, '+
                                'ErrorCode,  '+
                                'DateTimeTransaction '+
                                ' from PC1_log order by 1 desc';
  ADOQuery1.Open;
  WidthCol;
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


function LogAction(aIDRequest: integer;
                   aIDTerminal, aTextRequest, aTextResponse, aIpAddress : String;
                   aDirection, aErrorCode: Integer;
                   aTypeRequest :String) : integer;
begin
  Form1.ADOQuery1.SQL.Text := 'insert into PC1_Log (IDRequest, '+
                                                   'IDTerminal, '+
                                                   'TextRequest, '+
                                                   'TextResponse, '+
                                                   'Direction, '+
                                                   'ErrorCode,  '+
                                                   'DateTimeTransaction, '+
                                                   'ipAdress, '+
                                                   'TypeRequest)  '+
                                ' values ( '+
                                                     ' :IDRequest, '+
                                                     ' :IDTerminal, '+
                                                     ' :TextRequest, '+
                                                     ' :TextResponse, '+
                                                     ' :Direction, '+
                                                     ' :ErrorCode, '+
                                                     ' :DateTimeTransaction, '+
                                                     ' :ipAdress, '+
                                                     ' :TypeRequest) ';
  Form1.ADOQuery1.Parameters.ParamByName('IDRequest').Value := aIDRequest;
  Form1.ADOQuery1.Parameters.ParamByName('IDTerminal').Value := aIDTerminal;
  Form1.ADOQuery1.Parameters.ParamByName('TextRequest').Value := aTextRequest;
  Form1.ADOQuery1.Parameters.ParamByName('TextResponse').Value := EncodeString(aTextResponse);
  Form1.ADOQuery1.Parameters.ParamByName('Direction').Value := aDirection;
  Form1.ADOQuery1.Parameters.ParamByName('ErrorCode').Value := aErrorCode;
  Form1.ADOQuery1.Parameters.ParamByName('DateTimeTransaction').Value := Now;
  Form1.ADOQuery1.Parameters.ParamByName('ipAdress').Value := aIpAddress;
  Form1.ADOQuery1.Parameters.ParamByName('TypeRequest').Value := aTypeRequest;
  try
    Form1.ADOQuery1.ExecSQL;
    Form1.Refresh;
    Result := Form1.ADOQuery1.FieldByName('ID').AsInteger;
  except
    Result := 0;
  end;
end;


end.
