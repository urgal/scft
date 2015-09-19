unit terminal_tools;

interface

function GenerateTerminalID:longint;

implementation

uses
  SysUtils;

function GenerateTerminalID:integer;
var
  guid : TGUID;
  guidString : string;
begin
  CreateGUID(guid);
  guidString := GUIDToString(guid);
  guidString := '$'+copy(guidString,2,7);
  Result := StrToInt(guidString);
end;

end.
