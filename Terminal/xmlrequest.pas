unit xmlrequest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, terminal_tools, Data.Win.ADODB,
  terminal_db, IPPeerClient, REST.Client, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope;

function CreateXMLFile(const aFields : TOperationFields): string;

implementation

uses
  request100;

function CreateXMLFile(const aFields : TOperationFields): string;
var
  vRequest : IXMLRequestType100;
  vXML : string;
begin
  vRequest := request100.Newrequest;

  vRequest.Type_ := '100';
  vRequest.Number := aFields.id;
  vRequest.Poslun := inttostr(aFields.terminal);
  vRequest.Batch := aFields.shift;
  vRequest.Body.Code :=inttostr(aFields.operationType);
  vRequest.Body.PAN := inttostr(aFields.pan);
  vRequest.Body.Currency := aFields.currency;
  vRequest.Body.Amount := aFields.sum;
  vRequest.Body.PINblock := IntToHex(aFields.pin, 0);
  vXML := vRequest.XML;
  Result := vXML;
end;


end.
