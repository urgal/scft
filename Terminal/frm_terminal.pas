unit frm_terminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, terminal_tools;

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
    dbTermOpers: TDBGrid;
    dsTermOpers: TDataSource;
    btGenerate: TButton;
    btOpenShift: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btOpenShiftClick(Sender: TObject);
    procedure btGenerateClick(Sender: TObject);
  private
    { Private declarations }
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
  operType := GenerateOperationType;
  cbOperType.ItemIndex := operType-1;
  edAmount.Text := '';
  case operType of
    OPERATION_PAY, OPERATION_GET_CASH : begin
      edAmount.Text := FloatToStr(GenerateOperationSum(curr));
    end;
  end;
  curr := GenerateOperationCurrency;
  edCurrency.Text := IntToStr(curr);
  edPan.Text := IntToStr(GenerateOperationCardPAN);
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
    end;
    1 : begin
      btOpenShift.Caption := 'Закрыть смену';
    end;
  end;
  edShiftID.Text := IntToStr(OpenTerminalShift);
end;

procedure TTerminalForm.FormCreate(Sender: TObject);
var
  list : TStrings;
begin
  randomize;
  edTermID.Text := IntToStr(GenerateTerminalID);
  list := cbOperType.Items;
  InitOperationList(list);
end;

end.
