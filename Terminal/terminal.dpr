program terminal;

uses
  Forms,
  frm_terminal in 'frm_terminal.pas' {TerminalForm},
  terminal_tools in 'terminal_tools.pas',
  terminal_sql in 'terminal_sql.pas',
  terminal_db in 'terminal_db.pas',
  request100 in '..\XMLComponents\request100.pas',
  request198 in '..\XMLComponents\request198.pas',
  request199 in '..\XMLComponents\request199.pas',
  response100 in '..\XMLComponents\response100.pas',
  response198 in '..\XMLComponents\response198.pas',
  response199 in '..\XMLComponents\response199.pas',
  xmlrequest in 'xmlrequest.pas',
  xmlresponse in 'xmlresponse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTerminalForm, TerminalForm);
  Application.Run;
end.
