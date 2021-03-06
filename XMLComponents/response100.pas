
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 19.09.2015 21:28:31                                }
{       Generated from: D:\SVN\HACATON\trunk\Docs\Scheme\response100.xsd   }
{                                                                          }
{**************************************************************************}

unit response100;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMessageHeader = interface;
  IXMLRequestHeader = interface;
  IXMLResponseHeader = interface;
  IXMLAnswer = interface;
  IXMLResponseType100 = interface;
  IXMLResponseType100_body = interface;
  IXMLOperation = interface;

{ IXMLMessageHeader }

  IXMLMessageHeader = interface(IXMLNode)
    ['{55AA3544-7770-444A-B0BE-75C6438187B0}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    function Get_Poslun: UnicodeString;
    function Get_Batch: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
    procedure Set_Poslun(Value: UnicodeString);
    procedure Set_Batch(Value: Integer);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Number: Integer read Get_Number write Set_Number;
    property Date: UnicodeString read Get_Date write Set_Date;
    property Poslun: UnicodeString read Get_Poslun write Set_Poslun;
    property Batch: Integer read Get_Batch write Set_Batch;
  end;

{ IXMLRequestHeader }

  IXMLRequestHeader = interface(IXMLMessageHeader)
    ['{EA9A060B-B0EC-40D6-8FF3-34E3C4F93088}']
  end;

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{D8631B56-EB39-4F27-ABF3-FD5B3CD0E7A6}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{F26F0CC8-2125-47A4-B88F-DAB6E93FB54D}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
    property Number: Integer read Get_Number write Set_Number;
    property Date: UnicodeString read Get_Date write Set_Date;
  end;

{ IXMLResponseType100 }

  IXMLResponseType100 = interface(IXMLResponseHeader)
    ['{E6495709-FEC2-4794-9D7A-85EB1E163897}']
    { Property Accessors }
    function Get_Body: IXMLResponseType100_body;
    { Methods & Properties }
    property Body: IXMLResponseType100_body read Get_Body;
  end;

{ IXMLResponseType100_body }

  IXMLResponseType100_body = interface(IXMLNode)
    ['{E0250E2D-1130-430D-BE39-3728199E5E4B}']
    { Property Accessors }
    function Get_ResponseCode: UnicodeString;
    function Get_AuthorizationCode: UnicodeString;
    function Get_Operation: IXMLOperation;
    procedure Set_ResponseCode(Value: UnicodeString);
    procedure Set_AuthorizationCode(Value: UnicodeString);
    { Methods & Properties }
    property ResponseCode: UnicodeString read Get_ResponseCode write Set_ResponseCode;
    property AuthorizationCode: UnicodeString read Get_AuthorizationCode write Set_AuthorizationCode;
    property Operation: IXMLOperation read Get_Operation;
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{2E42CC92-A84C-4524-8D25-CDF8A3227A8C}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    function Get_PAN: UnicodeString;
    function Get_Currency: Integer;
    function Get_Amount: Single;
    function Get_PINblock: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_PAN(Value: UnicodeString);
    procedure Set_Currency(Value: Integer);
    procedure Set_Amount(Value: Single);
    procedure Set_PINblock(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
    property PAN: UnicodeString read Get_PAN write Set_PAN;
    property Currency: Integer read Get_Currency write Set_Currency;
    property Amount: Single read Get_Amount write Set_Amount;
    property PINblock: UnicodeString read Get_PINblock write Set_PINblock;
  end;

{ Forward Decls }

  TXMLMessageHeader = class;
  TXMLRequestHeader = class;
  TXMLResponseHeader = class;
  TXMLAnswer = class;
  TXMLResponseType100 = class;
  TXMLResponseType100_body = class;
  TXMLOperation = class;

{ TXMLMessageHeader }

  TXMLMessageHeader = class(TXMLNode, IXMLMessageHeader)
  protected
    { IXMLMessageHeader }
    function Get_Type_: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    function Get_Poslun: UnicodeString;
    function Get_Batch: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
    procedure Set_Poslun(Value: UnicodeString);
    procedure Set_Batch(Value: Integer);
  end;

{ TXMLRequestHeader }

  TXMLRequestHeader = class(TXMLMessageHeader, IXMLRequestHeader)
  protected
    { IXMLRequestHeader }
  end;

{ TXMLResponseHeader }

  TXMLResponseHeader = class(TXMLRequestHeader, IXMLResponseHeader)
  protected
    { IXMLResponseHeader }
    function Get_Answer: IXMLAnswer;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAnswer }

  TXMLAnswer = class(TXMLNode, IXMLAnswer)
  protected
    { IXMLAnswer }
    function Get_Code: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
  end;

{ TXMLResponseType100 }

  TXMLResponseType100 = class(TXMLResponseHeader, IXMLResponseType100)
  protected
    { IXMLResponseType100 }
    function Get_Body: IXMLResponseType100_body;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLResponseType100_body }

  TXMLResponseType100_body = class(TXMLNode, IXMLResponseType100_body)
  protected
    { IXMLResponseType100_body }
    function Get_ResponseCode: UnicodeString;
    function Get_AuthorizationCode: UnicodeString;
    function Get_Operation: IXMLOperation;
    procedure Set_ResponseCode(Value: UnicodeString);
    procedure Set_AuthorizationCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLOperation }

  TXMLOperation = class(TXMLNode, IXMLOperation)
  protected
    { IXMLOperation }
    function Get_Code: UnicodeString;
    function Get_PAN: UnicodeString;
    function Get_Currency: Integer;
    function Get_Amount: Single;
    function Get_PINblock: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_PAN(Value: UnicodeString);
    procedure Set_Currency(Value: Integer);
    procedure Set_Amount(Value: Single);
    procedure Set_PINblock(Value: UnicodeString);
  end;

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType100;
function Loadresponse(const FileName: string): IXMLResponseType100;
function Newresponse: IXMLResponseType100;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType100;
begin
  Result := Doc.GetDocBinding('response', TXMLResponseType100, TargetNamespace) as IXMLResponseType100;
end;

function Loadresponse(const FileName: string): IXMLResponseType100;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('response', TXMLResponseType100, TargetNamespace) as IXMLResponseType100;
end;

function Newresponse: IXMLResponseType100;
begin
  Result := NewXMLDocument.GetDocBinding('response', TXMLResponseType100, TargetNamespace) as IXMLResponseType100;
end;

{ TXMLMessageHeader }

function TXMLMessageHeader.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLMessageHeader.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLMessageHeader.Get_Number: Integer;
begin
  Result := AttributeNodes['number'].NodeValue;
end;

procedure TXMLMessageHeader.Set_Number(Value: Integer);
begin
  SetAttribute('number', Value);
end;

function TXMLMessageHeader.Get_Date: UnicodeString;
begin
  Result := AttributeNodes['date'].Text;
end;

procedure TXMLMessageHeader.Set_Date(Value: UnicodeString);
begin
  SetAttribute('date', Value);
end;

function TXMLMessageHeader.Get_Poslun: UnicodeString;
begin
  Result := AttributeNodes['poslun'].Text;
end;

procedure TXMLMessageHeader.Set_Poslun(Value: UnicodeString);
begin
  SetAttribute('poslun', Value);
end;

function TXMLMessageHeader.Get_Batch: Integer;
begin
  Result := AttributeNodes['batch'].NodeValue;
end;

procedure TXMLMessageHeader.Set_Batch(Value: Integer);
begin
  SetAttribute('batch', Value);
end;

{ TXMLRequestHeader }

{ TXMLResponseHeader }

procedure TXMLResponseHeader.AfterConstruction;
begin
  RegisterChildNode('answer', TXMLAnswer);
  inherited;
end;

function TXMLResponseHeader.Get_Answer: IXMLAnswer;
begin
  Result := ChildNodes['answer'] as IXMLAnswer;
end;

{ TXMLAnswer }

function TXMLAnswer.Get_Code: UnicodeString;
begin
  Result := AttributeNodes['code'].Text;
end;

procedure TXMLAnswer.Set_Code(Value: UnicodeString);
begin
  SetAttribute('code', Value);
end;

function TXMLAnswer.Get_Number: Integer;
begin
  Result := AttributeNodes['number'].NodeValue;
end;

procedure TXMLAnswer.Set_Number(Value: Integer);
begin
  SetAttribute('number', Value);
end;

function TXMLAnswer.Get_Date: UnicodeString;
begin
  Result := AttributeNodes['date'].Text;
end;

procedure TXMLAnswer.Set_Date(Value: UnicodeString);
begin
  SetAttribute('date', Value);
end;

{ TXMLResponseType100 }

procedure TXMLResponseType100.AfterConstruction;
begin
  RegisterChildNode('body', TXMLResponseType100_body);
  inherited;
end;

function TXMLResponseType100.Get_Body: IXMLResponseType100_body;
begin
  Result := ChildNodes['body'] as IXMLResponseType100_body;
end;

{ TXMLResponseType100_body }

procedure TXMLResponseType100_body.AfterConstruction;
begin
  RegisterChildNode('operation', TXMLOperation);
  inherited;
end;

function TXMLResponseType100_body.Get_ResponseCode: UnicodeString;
begin
  Result := AttributeNodes['responseCode'].Text;
end;

procedure TXMLResponseType100_body.Set_ResponseCode(Value: UnicodeString);
begin
  SetAttribute('responseCode', Value);
end;

function TXMLResponseType100_body.Get_AuthorizationCode: UnicodeString;
begin
  Result := AttributeNodes['authorizationCode'].Text;
end;

procedure TXMLResponseType100_body.Set_AuthorizationCode(Value: UnicodeString);
begin
  SetAttribute('authorizationCode', Value);
end;

function TXMLResponseType100_body.Get_Operation: IXMLOperation;
begin
  Result := ChildNodes['operation'] as IXMLOperation;
end;

{ TXMLOperation }

function TXMLOperation.Get_Code: UnicodeString;
begin
  Result := AttributeNodes['code'].Text;
end;

procedure TXMLOperation.Set_Code(Value: UnicodeString);
begin
  SetAttribute('code', Value);
end;

function TXMLOperation.Get_PAN: UnicodeString;
begin
  Result := AttributeNodes['PAN'].Text;
end;

procedure TXMLOperation.Set_PAN(Value: UnicodeString);
begin
  SetAttribute('PAN', Value);
end;

function TXMLOperation.Get_Currency: Integer;
begin
  Result := AttributeNodes['currency'].NodeValue;
end;

procedure TXMLOperation.Set_Currency(Value: Integer);
begin
  SetAttribute('currency', Value);
end;

function TXMLOperation.Get_Amount: Single;
begin
  Result := AttributeNodes['amount'].NodeValue;
end;

procedure TXMLOperation.Set_Amount(Value: Single);
begin
  SetAttribute('amount', Value);
end;

function TXMLOperation.Get_PINblock: UnicodeString;
begin
  Result := AttributeNodes['PINblock'].Text;
end;

procedure TXMLOperation.Set_PINblock(Value: UnicodeString);
begin
  SetAttribute('PINblock', Value);
end;

end.