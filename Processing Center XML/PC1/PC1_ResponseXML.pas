unit PC1_ResponseXML;

interface

uses PC1_FormUnit, System.SysUtils, System.Classes, Xml.XMLDoc, response100;

function GetResponse100(LogId: integer): string;
function GetResponse198(LogId: integer): string;
function GetResponse199(LogId: integer): string;

implementation

function GetResponse100(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
  vLogId: integer;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    LogId := LogAction(1,'1','1','1','',1,1,'1');
    Result := vXML;
  finally

 end;
end;

function GetResponse198(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
  vLogId: integer;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    LogId := LogAction(1,'1','1','1','',1,1,'1');
    Result := vXML;
  finally

 end;
end;

function GetResponse199(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
  vLogId: integer;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    LogId := LogAction(1,'1','1','1','',1,1,'1');
    Result := vXML;
  finally

 end;
end;


end.
