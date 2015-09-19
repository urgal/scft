
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 19.09.2015 21:38:15                                }
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
    ['{2ECF1EA1-EC75-4CEE-8962-B85B4DAB79D1}']
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
    ['{D7C31166-0118-4A0A-9BA5-0BE9120FFB79}']
  end;

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{5CBB11EE-4C01-499C-80F9-1CD219C9AB8E}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{E3C788D4-2A68-4DAC-A018-C4D9AB595D8E}']
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
    ['{EC31EFAB-F956-4FEB-A94A-0D335F4BAA1B}']
    { Property Accessors }
    function Get_Body: IXMLResponseType198_body;
    { Methods & Properties }
    property Body: IXMLResponseType198_body read Get_Body;
  end;

{ IXMLResponseType198_body }

  IXMLResponseType198_body = interface(IXMLNode)
    ['{6DC0A3B4-A22A-4EB2-A813-036008EF2078}']
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
    ['{7DA2B73B-765F-4BEE-A2C4-2923241832CD}']
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

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType198;
function Loadresponse(const FileName: string): IXMLResponseType198;
function Newresponse: IXMLResponseType198;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType198;
begin
  Result := Doc.GetDocBinding('response', TXMLResponseType198, TargetNamespace) as IXMLResponseType198;
end;

function Loadresponse(const FileName: string): IXMLResponseType198;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('response', TXMLResponseType198, TargetNamespace) as IXMLResponseType198;
end;

function Newresponse: IXMLResponseType198;
begin
  Result := NewXMLDocument.GetDocBinding('response', TXMLResponseType198, TargetNamespace) as IXMLResponseType198;
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