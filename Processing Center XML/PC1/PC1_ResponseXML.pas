unit PC1_ResponseXML;

interface

uses System.SysUtils, System.Classes, Xml.XMLDoc, response100;

function GetResponse100(LogId: integer): string;
function GetResponse198(LogId: integer): string;
function GetResponse199(LogId: integer): string;

procedure AddAnswerLog(aXML: string);

implementation

function GetResponse100(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    Result := vXML;
  finally

 end;
end;

function GetResponse198(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    Result := vXML;
  finally

 end;
end;

function GetResponse199(LogId: integer): string;
var
  vResponse100: IXMLResponseType100;
  vXML: string;
begin
  vResponse100:= Response100.NewResponse;
  try
    vResponse100.Type_:= '100';
    vResponse100.Answer.Code:= '000';
    vResponse100.Body.ResponseCode:= '0AA';
    vXML:= vResponse100.XML;
    Result := vXML;
  finally

 end;
end;


{procedure AddAnswerLog(aXML: string);
begin

end; }


end.
