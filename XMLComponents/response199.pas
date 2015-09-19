
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 19.09.2015 20:11:38                                }
{       Generated from: D:\SVN\HACATON\trunk\Docs\Scheme\response199.xsd   }
{   Settings stored in: D:\SVN\HACATON\trunk\Docs\Scheme\response199.xdb   }
{                                                                          }
{**************************************************************************}

unit response199;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMessageHeader = interface;
  IXMLRequestHeader = interface;
  IXMLResponseHeader = interface;
  IXMLAnswer = interface;
  IXMLResponseType199 = interface;
  IXMLResponseType199_body = interface;
  IXMLOperation = interface;

{ IXMLMessageHeader }

  IXMLMessageHeader = interface(IXMLNode)
    ['{DE3F11BF-9F5B-4A4D-AAE1-FD7FBCE1B00F}']
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
    ['{946C254A-9A1E-4785-8C40-8F558F9645FA}']
  end;

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{084B34B9-C376-4FCD-9DE6-09A86F21E528}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{23A053AD-6FDF-4F2D-B610-83F90D7168F0}']
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

{ IXMLResponseType199 }

  IXMLResponseType199 = interface(IXMLResponseHeader)
    ['{DE5F3F7F-5661-41D2-A03C-FC28F79D9C76}']
    { Property Accessors }
    function Get_Body: IXMLResponseType199_body;
    { Methods & Properties }
    property Body: IXMLResponseType199_body read Get_Body;
  end;

{ IXMLResponseType199_body }

  IXMLResponseType199_body = interface(IXMLNode)
    ['{23BC9D2F-ADC8-4CE5-803D-5A3709797664}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{62862A8E-5A04-4538-9FD0-00ED80E00917}']
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
  TXMLResponseType199 = class;
  TXMLResponseType199_body = class;
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

{ TXMLResponseType199 }

  TXMLResponseType199 = class(TXMLResponseHeader, IXMLResponseType199)
  protected
    { IXMLResponseType199 }
    function Get_Body: IXMLResponseType199_body;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLResponseType199_body }

  TXMLResponseType199_body = class(TXMLNode, IXMLResponseType199_body)
  protected
    { IXMLResponseType199_body }
    function Get_Code: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
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

{ TXMLResponseType199 }

procedure TXMLResponseType199.AfterConstruction;
begin
  RegisterChildNode('body', TXMLResponseType199_body);
  inherited;
end;

function TXMLResponseType199.Get_Body: IXMLResponseType199_body;
begin
  Result := ChildNodes['body'] as IXMLResponseType199_body;
end;

{ TXMLResponseType199_body }

function TXMLResponseType199_body.Get_Code: UnicodeString;
begin
  Result := AttributeNodes['code'].Text;
end;

procedure TXMLResponseType199_body.Set_Code(Value: UnicodeString);
begin
  SetAttribute('code', Value);
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