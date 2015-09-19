unit PC1_Request;

interface

uses PC1_FormUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, request100;

function ParseXML100(aXML :String) : integer;

implementation

function ParseXML100(aXML :String) : integer;
var
  vRequest100 : IXMLRequestType100;
begin
  vRequest100 := Request100.Newrequest;

  Result := LogAction(1,'1','1','1','',1,1,'1');
end;

end.
