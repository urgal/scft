unit PC1_RequestXML;

interface

uses PC1_FormUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, request100, Soap.EncdDecd, request198;

function ParseXML100(aXML :String) : integer;
function ParseXML198(aXML :String) : integer;

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

function ParseXML198(aXML :String) : integer;
var
  temp : AnsiString;
  vXMLDocument : TXMLDocument;
  vRequest198 : IXMLRequestType198;
begin
  temp := DecodeString(aXML);
  vXMLDocument := TXMLDocument.Create(nil);
  vXMLDocument.LoadFromXML(temp);
  vRequest198 := Request198.Getrequest(vXMLDocument);
  Result := LogAction(vRequest198.Number,
                      vRequest198.Poslun,
                      aXML,
                      '',
                      '',
                      0,
                      0,
                      vRequest198.Type_);
end;
end.
