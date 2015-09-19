
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 19.09.2015 20:11:15                                }
{       Generated from: D:\SVN\HACATON\trunk\Docs\Scheme\response198.xsd   }
{   Settings stored in: D:\SVN\HACATON\trunk\Docs\Scheme\response198.xdb   }
{                                                                          }
{**************************************************************************}

unit response198;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMessageHeader = interface;
  IXMLRequestHeader = interface;
  IXMLResponseHeader = interface;
  IXMLAnswer = interface;
  IXMLResponseType198 = interface;
  IXMLResponseType198_body = interface;
  IXMLOperation = interface;

{ IXMLMessageHeader }

  IXMLMessageHeader = interface(IXMLNode)
    ['{3FEDE1CE-0A9C-4123-9B3A-B7185DC0C922}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    function Get_Poslun: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
    procedure Set_Poslun(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Number: Integer read Get_Number write Set_Number;
    property Date: UnicodeString read Get_Date write Set_Date;
    property Poslun: UnicodeString read Get_Poslun write Set_Poslun;
  end;

{ IXMLRequestHeader }

  IXMLRequestHeader = interface(IXMLMessageHeader)
    ['{33BCAF76-D97D-40ED-9DDD-DDEE1A0BA0B8}']
  end;

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{79ED6125-C70F-4870-8CC3-6E7C838BF02A}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{936EABF9-0303-471B-8197-036260B66C97}']
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

{ IXMLResponseType198 }

  IXMLResponseType198 = interface(IXMLResponseHeader)
    ['{363AAC72-2521-4694-BDC0-9C5CB79214F5}']
    { Property Accessors }
    function Get_Body: IXMLResponseType198_body;
    { Methods & Properties }
    property Body: IXMLResponseType198_body read Get_Body;
  end;

{ IXMLResponseType198_body }

  IXMLResponseType198_body = interface(IXMLNode)
    ['{B3166753-1858-47C9-BB53-C803057B2A09}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    function Get_PublicKey: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_PublicKey(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
    property PublicKey: UnicodeString read Get_PublicKey write Set_PublicKey;
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{76E33159-0E03-4B27-A67C-CE062442CFE7}']
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
  TXMLResponseType198 = class;
  TXMLResponseType198_body = class;
  TXMLOperation = class;

{ TXMLMessageHeader }

  TXMLMessageHeader = class(TXMLNode, IXMLMessageHeader)
  protected
    { IXMLMessageHeader }
    function Get_Type_: UnicodeString;
    function Get_Number: Integer;
    function Get_Date: UnicodeString;
    function Get_Poslun: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Number(Value: Integer);
    procedure Set_Date(Value: UnicodeString);
    procedure Set_Poslun(Value: UnicodeString);
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

{ TXMLResponseType198 }

  TXMLResponseType198 = class(TXMLResponseHeader, IXMLResponseType198)
  protected
    { IXMLResponseType198 }
    function Get_Body: IXMLResponseType198_body;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLResponseType198_body }

  TXMLResponseType198_body = class(TXMLNode, IXMLResponseType198_body)
  protected
    { IXMLResponseType198_body }
    function Get_Code: UnicodeString;
    function Get_PublicKey: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    procedure Set_PublicKey(Value: UnicodeString);
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

implementation

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

{ TXMLResponseType198 }

procedure TXMLResponseType198.AfterConstruction;
begin
  RegisterChildNode('body', TXMLResponseType198_body);
  inherited;
end;

function TXMLResponseType198.Get_Body: IXMLResponseType198_body;
begin
  Result := ChildNodes['body'] as IXMLResponseType198_body;
end;

{ TXMLResponseType198_body }

function TXMLResponseType198_body.Get_Code: UnicodeString;
begin
  Result := AttributeNodes['code'].Text;
end;

procedure TXMLResponseType198_body.Set_Code(Value: UnicodeString);
begin
  SetAttribute('code', Value);
end;

function TXMLResponseType198_body.Get_PublicKey: UnicodeString;
begin
  Result := AttributeNodes['publicKey'].Text;
end;

procedure TXMLResponseType198_body.Set_PublicKey(Value: UnicodeString);
begin
  SetAttribute('publicKey', Value);
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