unit PC1_ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
     Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, PC1_Request;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Add(a,b :integer): integer;
    function CommunicationInterface100(aXML :string) : string;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils, PC1_FormUnit;



function TServerMethods1.Add(a, b: integer): integer;
begin
  result := a + b;
end;

function TServerMethods1.CommunicationInterface100(
  aXML: string): string;
var
  vLogId : integer;
begin
  vLogId := ParseXML100(aXML);
  Result := inttostr(vLogId);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  LogAction(1,1,'1','1','',1,1);
  Result := System.StrUtils.ReverseString(Value);
end;
end.

