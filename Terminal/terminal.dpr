program terminal;

uses
  Forms,
  frm_terminal in 'frm_terminal.pas' {TerminalForm},
  terminal_tools in 'terminal_tools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTerminalForm, TerminalForm);
  Application.Run;
end.
