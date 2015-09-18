program terminal;

uses
  Forms,
  frm_terminal in 'frm_terminal.pas' {TerminalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTerminalForm, TerminalForm);
  Application.Run;
end.
