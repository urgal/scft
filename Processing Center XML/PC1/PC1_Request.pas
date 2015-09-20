unit PC1_Request;

interface

uses PC1_FormUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, request100;

function ParseXML100(aXML :String) : integer;

implementation

function ParseXML100(aXML :String) : integer;
var
  temp : unicodestring;
  vXMLDocument : TXMLDocument;
  vRequest100 : IXMLRequestType100;
begin
  temp := unicodeString(aXML);
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
