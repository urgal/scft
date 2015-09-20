unit xmlrequest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, terminal_tools, Data.Win.ADODB,
  terminal_db, IPPeerClient, REST.Client, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope;

function CreateXMLFile(aOperId : integer; aTermID, aShiftID, aCurr, aOperType, aPan, aPinBlock, aAmount : string): string;

implementation

uses
  request100;

function CreateXMLFile(aOperId : integer; aTermID, aShiftID, aCurr, aOperType, aPan, aPinBlock, aAmount : string): string;
var
  vRequest : IXMLRequestType100;
  vXML : string;
begin
  vRequest := request100.Newrequest;

  vRequest.Type_ := '100';
  vRequest.Number := aOperId;
  vRequest.Poslun := aTermID;
  vRequest.Batch := strtoint(aShiftID);
  vRequest.Body.Code := aOperType;
  vRequest.Body.PAN := aPan;
  vRequest.Body.Currency := strtoint(aCurr);
  vRequest.Body.Amount := StrToFloat(aAmount);
  vRequest.Body.PINblock := aPinBlock;
  vXML := vRequest.XML;
  Result := vXML;
end;


end.
