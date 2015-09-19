unit PC1_Request;

interface

uses PC1_FormUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, request100;

function ParseXML100(aXML :String) : integer;

implementation

function ParseXML100(aXML :String) : integer;
var
  vXMLDocument : IXMLDocument;
  vRequest100 : IXMLRequestType100;
begin
  vXMLDocument.LoadFromXML(aXML);
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
