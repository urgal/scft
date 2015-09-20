unit frm_terminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, terminal_tools, Data.Win.ADODB, terminal_db,
  IPPeerClient, REST.Client, REST.Types, Soap.EncdDecd,
  Data.Bind.ObjectScope, Data.Bind.Components;

type
  TTerminalForm = class(TForm)
    edTermID: TEdit;
    btPacketMode: TButton;
    edPan: TEdit;
    edAmount: TEdit;
    btSend: TButton;
    cbOperType: TComboBox;
    lbTermID: TLabel;
    lbShiftID: TLabel;
    lbPAN: TLabel;
    lbCurrency: TLabel;
    lbAmount: TLabel;
    lbOperType: TLabel;
    edShiftID: TEdit;
    dsTermOpers: TDataSource;
    btGenerate: TButton;
    btOpenShift: TButton;
    dbTermOpers: TDBGrid;
    rstClient: TRESTClient;
    rstReq: TRESTRequest;
    rstResp: TRESTResponse;
    edCurrency: TEdit;
    lbPinBlock: TLabel;
    edPinBlock: TEdit;
    OperQuery: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btOpenShiftClick(Sender: TObject);
    procedure btGenerateClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure btPacketModeClick(Sender: TObject);
    procedure SendOperationData(const aFields : TOperationFields);
  private
    FCurrentTerminalID : integer;
    FCurrentShiftID : integer;
    FGenerateFields : TOperationFields;
  public
    { Public declarations }
  end;

var
  TerminalForm: TTerminalForm;

implementation

uses
  xmlrequest, xmlresponse;

{$R *.dfm}

procedure TTerminalForm.btGenerateClick(Sender: TObject);
var
  curr : integer;
  operType : integer;
begin
  GenerateOperationFields(FCurrentTerminalID, FCurrentShiftID, FGenerateFields);
  cbOperType.ItemIndex := FGenerateFields.operationType-1;
  edAmount.Text := FloatToStr(FGenerateFields.sum);
  edCurrency.Text := IntToStr(FGenerateFields.currency);
  edPan.Text := IntToStr(FGenerateFields.pan);
  edPinBlock.Text := IntToHex(FGenerateFields.pin, 0);
end;

procedure TTerminalForm.btOpenShiftClick(Sender: TObject);
begin
  btOpenShift.Tag := (btOpenShift.Tag + 1) mod 2;
  btGenerate.Enabled := (btOpenShift.Tag = 1);
  btSend.Enabled := (btOpenShift.Tag = 1);
  btPacketMode.Enabled := (btOpenShift.Tag = 1);
  case btOpenShift.Tag of
    0 :  begin
      btOpenShift.Caption := 'Открыть смену';
      edShiftID.Text := '';
      CloseTerminalShift(FCurrentShiftID);
    end;
    1 : begin
      btOpenShift.Caption := 'Закрыть смену';
      try
        FCurrentShiftID := OpenTerminalShift(FCurrentTerminalID);
      except
        on E : Exception do begin
          ShowMessage(E.Message);
        end;
      end;
      edShiftID.Text := IntToStr(FCurrentShiftID);
      OperQuery.Parameters.ParamValues['shiftID'] := FCurrentShiftID;
    end;
  end;
end;

procedure TTerminalForm.btPacketModeClick(Sender: TObject);
var
  i : integer;
  vResult, vXML : string;
  vFields : TOperationFields;
begin
  for i := 1 to random(5) + 1 do
  begin
    GenerateOperationFields(FCurrentTerminalID, FCurrentShiftID, vFields);
    try
      LogOperationFields(vFields);
    except
      on E : Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
    OperQuery.Active := false;
    OperQuery.Active := true;
    try
      SendOperationData(vFields);
    except
      on E : Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;

end;

procedure TTerminalForm.btSendClick(Sender: TObject);
begin
  try
    LogOperationFields(FGenerateFields);
  except
    on E : Exception do begin
      ShowMessage(E.Message);
    end;
  end;
  OperQuery.Active := false;
  OperQuery.Active := true;
  try
    SendOperationData(FGenerateFields);
  except
    on E : Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTerminalForm.SendOperationData(const aFields : TOperationFields);
var
  vResult, vXML : string;
begin
  vXML := '';
  vXML := xmlrequest.CreateXMLFile(aFields);
  vXML := '?request=' + EncodeString(vXML);
  vxml := UTF8Encode(vxml);
  rstClient.BaseURL := 'http://10.168.1.236:8081/rest/request100' + vXML;

  try //отправка сообщения
    rstReq.Timeout := 60000;
    rstReq.Method := rmPost;
    rstReq.Execute;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
  if Assigned(rstResp.JSONValue) then
  begin //обработка ответа
    showmessage(rstResp.Content); // заглушка
    //rstResp.GetSimpleValue('result', vResult);
//  vxml := StringReplace(vxml, '+', '%2b', [rfReplaceAll]);
  end;
end;

procedure TTerminalForm.FormCreate(Sender: TObject);
var
  list : TStrings;
  wstr : PWideChar;
begin
  randomize;
  try
    ConnectToDataBase;
  except
    on E : Exception do begin
      ShowMessage(E.Message);
      Application.Terminate;
    end;
  end;
  FCurrentTerminalID := GenerateTerminalID;
  edTermID.Text := IntToStr(FCurrentTerminalID);
  list := cbOperType.Items;
  InitOperationList(list);
  OperQuery.Connection := GetADOConnection;
  OperQuery.Parameters.ParseSQL(OperQuery.SQL.Text, true);
  OperQuery.Parameters.ParamValues['shiftID'] := FCurrentShiftID;
  OperQuery.Active := true;
end;

end.
