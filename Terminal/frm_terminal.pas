unit frm_terminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, terminal_tools, Data.Win.ADODB, terminal_db,
  IPPeerClient,
  REST.Client, REST.Types, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TTerminalForm = class(TForm)
    edTermID: TEdit;
    btPacketMode: TButton;
    edPan: TEdit;
    edCurrency: TEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure btOpenShiftClick(Sender: TObject);
    procedure btGenerateClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure CreateXMLFile;
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
    end;
  end;
end;

procedure TTerminalForm.btSendClick(Sender: TObject);
var
  vPageName : string;
begin
  try
    LogOperationFields(FGenerateFields);
  except
    on E : Exception do begin
      ShowMessage(E.Message);
    end;
  end;
  rstClient.BaseURL := 'http://10.168.1.236:8080/rest/authorizeTransaction?transactionToken=dsalghsdgc';
  CreateXMLFile;
  //rstReq.Timeout := 5000;
  try //отправка сообщения
    //rstReq.Method := rmGET;
    rstReq.Execute;
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;
  if Assigned(rstResp.JSONValue) then
  begin  //обработка ответа
    rstResp.GetSimpleValue('title', vPageName);
    ShowMessage(vPageName);
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

procedure TTerminalForm.CreateXMLFile;
begin //создание xml-файла запроса
//
end;

end.
