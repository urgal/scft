
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 19.09.2015 20:10:32                               }
{       Generated from: D:\SVN\HACATON\trunk\Docs\Scheme\request199.xsd   }
{   Settings stored in: D:\SVN\HACATON\trunk\Docs\Scheme\request199.xdb   }
{                                                                         }
{*************************************************************************}

unit request199;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMessageHeader = interface;
  IXMLRequestHeader = interface;
  IXMLRequestType199 = interface;
  IXMLOperation = interface;
  IXMLResponseHeader = interface;
  IXMLAnswer = interface;

{ IXMLMessageHeader }

  IXMLMessageHeader = interface(IXMLNode)
    ['{6B02AED9-19CA-44E5-B228-00AB1DA0FD1D}']
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
    ['{1C92676B-3EC1-4CB4-A6AF-F80EAAEE7D0E}']
  end;

{ IXMLRequestType199 }

  IXMLRequestType199 = interface(IXMLRequestHeader)
    ['{E0019CA6-E3F2-4A65-804E-16AAA723262F}']
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{C1A967F8-45C3-4C39-A947-0CE3F5794EB3}']
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

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{C9B38391-EBE0-449F-8DD7-1E2A21789147}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{2BBA2BD5-9A3D-4A13-9B60-087BE2DC562D}']
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

{ Forward Decls }

  TXMLMessageHeader = class;
  TXMLRequestHeader = class;
  TXMLRequestType199 = class;
  TXMLOperation = class;
  TXMLResponseHeader = class;
  TXMLAnswer = class;

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

{ TXMLRequestType199 }

  TXMLRequestType199 = class(TXMLRequestHeader, IXMLRequestType199)
  protected
    { IXMLRequestType199 }
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

{ TXMLRequestType199 }

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

end.