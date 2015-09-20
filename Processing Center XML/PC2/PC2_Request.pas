unit PC2_Request;

interface

uses PC2_FormUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, request100, Soap.EncdDecd;

function ParseXML100(aXML :String) : integer;

implementation

function ParseXML100(aXML :String) : integer;
var
  temp : AnsiString;
  vXMLDocument : TXMLDocument;
  vRequest100 : IXMLRequestType100;
begin
  temp := DecodeString(aXML);
  vXMLDocument := TXMLDocument.Create(nil);
  vXMLDocument.LoadFromXML(temp);
  vRequest100 := Request100.Getrequest(vXMLDocument);
  Result := LogAction(vRequest100.Number,
                      vRequest100.Poslun,
                      aXML,
                      '',
                      '',
                      0,
                      0,
                      vRequest100.Type_);
end;

end.
