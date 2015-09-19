unit terminal_db;

interface

uses
  ADODB;

function GetADOConnection:TADOConnection;
procedure ConnectToDataBase;

implementation

uses
  SysUtils;

var
  _ADOConnection : TADOConnection;

function GetADOConnection:TADOConnection;
begin
  Result := _ADOConnection;
end;

procedure ConnectToDataBase;
begin
  try
    _ADOConnection.Connected := true;
  except
    on E: Exception do begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

initialization
  _ADOConnection := TADOConnection.Create(nil);
  _ADOConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=terminaldb.mdb;Persist Security Info=False';
  _ADOConnection.LoginPrompt := false;
  _ADOConnection.Provider := 'Microsoft.Jet.OLEDB.4.0';

finalization
  FreeAndNil(_ADOConnection);

end.
