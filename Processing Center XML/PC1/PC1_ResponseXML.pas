unit PC1_ResponseXML;

interface

uses PC1_FormUnit, System.SysUtils, System.StrUtils, System.Classes, Xml.XMLDoc,
     response100, response198, response199, Soap.EncdDecd, Data.Win.ADODB;

function GetResponse100(LogId: integer): string;
function GetResponse198(LogId: integer): string;
function GetResponse199(LogId: integer): string;

implementation

function GetResponse100(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
  vLogId: integer;
  vSQLq: TADOQuery;
begin
  vResponse100:= Response100.NewResponse;
  try
    vSQLq := TADOQuery.Create(nil);
    vSQLq.SQL.Text:= 'select ID, '+
                                'IDRequest, '+
                                'TypeRequest, '+
                                'IDTerminal, '+
                                'Left(TextRequest,200) as TextRequest, '+
                                'Left(TextResponse,200) as TextResponse, '+
                                'Direction, '+
                                'ErrorCode,  '+
                                'DateTimeTransaction '+
                                ' from PC1_log where id=:ID order by 1 desc';

    vSQLq.Parameters.ParamByName('ID').Value := LogId;

    try
      vSQLq.Open;

    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vResponse100.Number := vSQLq.FieldByName('IDRequest').Value;
    vResponse100.Poslun  := vSQLq.FieldByName('IDTerminal').Value;
      //Result := Form1.ADOQuery1.Fields[0].AsInteger;
    except
      //Result := 0;
    end;

    vXML:= vResponse100.XML;
    LogId := LogAction(vResponse100.Number,
                      vResponse100.Poslun,
                      '',
                      vXML,
                      '',
                      1,
                      0,
                      vResponse100.Type_);
    Result := EncodeString(vXML);
  finally

 end;
end;

function GetResponse198(LogId: integer): string;
var
  vResponse198: IXMLResponseType198;
  vXML: string;
  vLogId: integer;
begin
  vResponse198:= Response198.NewResponse;
  try
    vResponse198.Type_:= '198';
    vResponse198.Answer.Code:= '000';
    vXML:= vResponse198.XML;
    LogId := LogAction(vResponse198.Number,
                      vResponse198.Poslun,
                      '',
                      vXML,
                      '',
                      1,
                      0,
                      vResponse198.Type_);
    Result := EncodeString(vXML);
  finally

 end;
end;

function GetResponse199(LogId: integer): string;
var
  vResponse199: IXMLResponseType199;
  vXML: string;
  vLogId: integer;
begin
  vResponse199:= Response199.NewResponse;
  try
    vResponse199.Type_:= '199';
    vResponse199.Answer.Code:= '000';
    vXML:= vResponse199.XML;
    LogId := LogAction(vResponse199.Number,
                      vResponse199.Poslun,
                      '',
                      vXML,
                      '',
                      1,
                      0,
                      vResponse199.Type_);
    Result := EncodeString(vXML);
  finally

 end;
end;


end.
