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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TerminalForm: TTerminalForm;

implementation

{$R *.dfm}

procedure TTerminalForm.FormCreate(Sender: TObject);
begin
  edTermID.Text := IntToStr(GenerateTerminalID);
end;

end.
