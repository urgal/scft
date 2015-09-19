unit terminal_tools;

interface

uses
  Classes;

function GenerateTerminalID:integer;
function GenerateOperationType:integer;
function GenerateOperationCardPAN:integer;
function GenerateOperationCurrency:integer;
function GenerateOperationSum(aCurrency: integer):double;

function OpenTerminalShift:integer;
procedure InitOperationList(var aList: TStrings);

const
  OPERATION_PAY = 1;
  OPERATION_BALANCE = 2;
  OPERATION_GET_CASH = 3;
  OPERATION_CANCEL = 4;

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

const
  OPERATION_LIST : array [1..4] of string =
    ('Оплата', 'Баланс', 'Выдача наличных', 'Отмена');

function GenerateOperationType:integer;
begin
  Result := random(high(OPERATION_LIST))+1;
end;

const
  PAN_LIST : array [1..3] of integer =
    (670523, 911200, 520195);

function GenerateOperationCardPAN:integer;
begin
  Result := PAN_LIST[random(high(PAN_LIST))+1];
end;

const
  CURRENCY_LIST : array [1..3] of integer =
    (974, 840, 978);

function GenerateOperationCurrency:integer;
begin
  Result := CURRENCY_LIST[random(high(CURRENCY_LIST))+1];
end;

function GenerateOperationSum(aCurrency: integer):double;
begin
  case aCurrency of
    974 : Result := random(1000000) + 10000;
    840, 978 : Result := random(1000) + 10 + random(10)*0.1;
  else
    Result := random(100) + 10;
  end;
end;

function OpenTerminalShift:integer;
begin
  Result := 0;
end;

procedure InitOperationList(var aList: TStrings);
var
  ind: Integer;
begin
  aList.Clear;
  for ind := 1 to high(OPERATION_LIST) do begin
    aList.Add(OPERATION_LIST[ind]);
  end;
end;

end.
