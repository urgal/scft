unit terminal_tools;

interface

uses
  Classes;

type
TOperationFields = record
  terminal : integer;
  shift : integer;
  operationType : integer;
  pan : integer;
  currency : integer;
  sum : double;
end;

function GenerateTerminalID: integer;
function GenerateOperationType: integer;
function GenerateOperationCardPAN: integer;
function GenerateOperationCurrency: integer;
function GenerateOperationSum(aCurrency: integer): double;
procedure GenerateOperationFields(aTerminalID, aShiftID: integer; var aFields: TOperationFields);

function OpenTerminalShift(aTerminalID: integer): integer;
procedure CloseTerminalShift(aShiftID: integer);

procedure LogOperationFields(const aFields: TOperationFields);

procedure InitOperationList(var aList: TStrings);

const
  OPERATION_PAY = 1;
  OPERATION_BALANCE = 2;
  OPERATION_GET_CASH = 3;
  OPERATION_CANCEL = 4;

implementation

uses
  SysUtils, ADODB, terminal_db, db;

function GenerateTerminalID: integer;
var
  guid: TGUID;
  guidString: string;
begin
  CreateGUID(guid);
  guidString := GUIDToString(guid);
  guidString := '$' + copy(guidString, 2, 7);
  Result := StrToInt(guidString);
end;

const
  OPERATION_LIST: array [1 .. 4] of string = ('Оплата', 'Баланс',
    'Выдача наличных', 'Отмена');

function GenerateOperationType: integer;
begin
  Result := random(high(OPERATION_LIST)) + 1;
end;

const
  PAN_LIST: array [1 .. 3] of integer = (670523, 911200, 520195);

function GenerateOperationCardPAN: integer;
begin
  Result := PAN_LIST[random(high(PAN_LIST)) + 1];
end;

const
  CURRENCY_LIST: array [1 .. 3] of integer = (974, 840, 978);

function GenerateOperationCurrency: integer;
begin
  Result := CURRENCY_LIST[random(high(CURRENCY_LIST)) + 1];
end;

function GenerateOperationSum(aCurrency: integer): double;
begin
  case aCurrency of
    974:
      Result := random(1000000) + 10000;
    840, 978:
      Result := random(1000) + 10 + random(10) * 0.1;
  else
    Result := random(100) + 10;
  end;
end;

procedure GenerateOperationFields(aTerminalID, aShiftID:integer; var aFields: TOperationFields);
begin
  fillchar(aFields,sizeof(aFields),0);
  aFields.terminal := aTerminalID;
  aFields.shift := aShiftID;
  aFields.operationType := GenerateOperationType;
  aFields.currency := GenerateOperationCurrency;
  case aFields.operationType of
    OPERATION_PAY, OPERATION_GET_CASH : begin
      aFields.sum := GenerateOperationSum(aFields.currency);
    end;
  end;
  aFields.pan := GenerateOperationCardPAN;
end;

function OpenTerminalShift(aTerminalID: integer): integer;
var
  query: TADOQuery;
begin
  query := TADOQuery.Create(nil);
  try
    try
      query.Connection := GetADOConnection;
      query.SQL.Text :=
        'insert into tbl_shift (id_terminal,time_open) values (:TerminalID,:OpenTime);';
      query.Parameters.ParseSQL(query.SQL.Text, true);
      query.Parameters.ParamValues['TerminalID'] := aTerminalID;
      query.Parameters.ParamValues['OpenTime'] := DateTimeToStr(now);
      query.ExecSQL;
      query.Close;
      query.SQL.Text := 'select top 1 id from tbl_shift order by id desc;';
      query.Open;
      Result := query.FieldByName('id').AsInteger;
    except
      on E: Exception do
      begin
        Result := -1;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(query);
  end;
end;

procedure CloseTerminalShift(aShiftID: integer);
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  try
    try
      query.Connection := GetADOConnection;
      query.SQL.Text :=
        'update tbl_shift set time_close=:CloseTime where id = :ShiftID;';
      query.Parameters.ParseSQL(query.SQL.Text, true);
      query.Parameters.ParamValues['ShiftID'] := aShiftID;
      query.Parameters.ParamValues['CloseTime'] := now;
      query.ExecSQL;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(query);
  end;
end;

procedure LogOperationFields(const aFields: TOperationFields);
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  try
    try
      query.Connection := GetADOConnection;
      query.SQL.Text :=
        'insert into tbl_operation (id_terminal, id_shift, oper_type, pan, oper_currency, oper_time, oper_sum) ' +
        'values (:terminalID, :shiftID, :type, :pan, :currency, :time, :sum);';
      query.Parameters.ParseSQL(query.SQL.Text, true);
      query.Parameters.ParamValues['terminalID'] := aFields.terminal;
      query.Parameters.ParamValues['shiftID'] := aFields.shift;
      query.Parameters.ParamValues['type'] := aFields.operationType;
      query.Parameters.ParamValues['pan'] := aFields.pan;
      query.Parameters.ParamValues['currency'] := aFields.currency;
      query.Parameters.ParamValues['sum'] := aFields.sum;
      query.Parameters.ParamValues['time'] := now;
      query.ExecSQL;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(query);
  end;
end;

procedure InitOperationList(var aList: TStrings);
var
  ind: integer;
begin
  aList.Clear;
  for ind := 1 to high(OPERATION_LIST) do
  begin
    aList.Add(OPERATION_LIST[ind]);
  end;
end;

end.
