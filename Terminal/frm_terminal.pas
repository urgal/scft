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
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btOpenShiftClick(Sender: TObject);
    procedure btGenerateClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure ViewDBChanges(aOperId : integer);
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
end;

procedure TTerminalForm.btOpenShiftClick(Sender: TObject);
begin
  btOpenShift.Tag := (btOpenShift.Tag + 1) mod 2;
  btGenerate.Enabled := (btOpenShift.Tag = 1);
  btSend.Enabled := (btOpenShift.Tag = 1);
  btPacketMode.Enabled := (btOpenShift.Tag = 1);
  case btOpenShift.Tag of
    0 :  begin
      btOpenShift.Caption := '������� �����';
      edShiftID.Text := '';
      CloseTerminalShift(FCurrentShiftID);
    end;
    1 : begin
      btOpenShift.Caption := '������� �����';
      try
        FCurrentShiftID := OpenTerminalShift(FCurrentTerminalID);
      except
        on E : Exception do begin
          ShowMessage(E.Message);
        end;
      end;
      edShiftID.Text := IntToStr(FCurrentShiftID);
    end;
  end;
end;

procedure TTerminalForm.btSendClick(Sender: TObject);
var
  vResult, vXML : string;
begin
  try
    LogOperationFields(FGenerateFields);
  except
    on E : Exception do begin
      ShowMessage(E.Message);
    end;
  end;
//  ViewDBChanges(FGenerateFields.id);
  vxml := '';
    vXML := xmlrequest.CreateXMLFile(FGenerateFields.id, edTermID.Text, edShiftID.Text,
            edCurrency.Text, inttostr(GenerateOperationType), edPan.Text,
            edPinBlock.Text, edAmount.Text);
  vXML := '?request=' + EncodeString(vXML);
  //vxml := UTF8Encode(vxml);
  vxml := StringReplace(vxml, '+', '%2b', [rfReplaceAll]);
  Memo1.Text := vXml;
  rstClient.BaseURL := 'http://10.168.1.236:8081/rest/request100' + vXML;

  //Memo1.Text := vXML;
  //exit;
//  rstReq.AddBody(vXML, ctAPPLICATION_XML);
//  rstReq.Timeout := 5000;
  try //�������� ���������
    rstReq.Method := rmPost;
    rstReq.Execute;
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;
  if Assigned(rstResp.JSONValue) then
  begin //��������� ������

    //rstResp.GetSimpleValue('result', vResult);
    Memo1.Text := rstResp.Content;
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
end;

procedure TTerminalForm.ViewDBChanges(aOperId : integer);
var
  vQuery : TADOQuery;
begin
  vQuery := TADOQuery.Create(nil);
  vQuery.Connection := GetADOConnection;
  vQuery.SQL.Text := 'select id_terminal, id_shift, oper_type, pan, ' +
                     '       oper_currency, oper_time, oper_sum ' +
                     '  from tbl_operation ' +
                     ' where id = :id';
  vQuery.Parameters.ParamValues['id'] := aOperID;
  dsTermOpers.DataSet := vQuery;
  vQuery.ExecSQL;
end;

end.
