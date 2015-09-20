
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 19.09.2015 21:36:52                                }
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
    ['{A0D26EC1-7819-4881-9B90-6D1FEC356089}']
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
    ['{09D38859-0458-4D5C-A173-813572171FB7}']
  end;

{ IXMLResponseHeader }

  IXMLResponseHeader = interface(IXMLRequestHeader)
    ['{848EAF55-5D02-4654-B846-845A0478EC12}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{7B835589-FAFF-49E8-981F-281B4D4B5E8F}']
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
    ['{D2CB77F8-66B6-4B91-A7E3-0A20BF004E3A}']
    { Property Accessors }
    function Get_Body: IXMLResponseType199_body;
    { Methods & Properties }
    property Body: IXMLResponseType199_body read Get_Body;
  end;

{ IXMLResponseType199_body }

  IXMLResponseType199_body = interface(IXMLNode)
    ['{82C7C9A0-6CEA-4814-B4B1-50467AE9F018}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    procedure Set_Code(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{02D7EFF7-7EEB-4675-AD33-1F946B5CC8F0}']
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

{ Global Functions }

function GetUnknown(Doc: IXMLDocument): IXMLMessageHeader;
function LoadUnknown(const FileName: string): IXMLMessageHeader;
function NewUnknown: IXMLMessageHeader;
function Getresponse(Doc: IXMLDocument): IXMLResponseType199;
function Loadresponse(const FileName: string): IXMLResponseType199;
function Newresponse: IXMLResponseType199;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetUnknown(Doc: IXMLDocument): IXMLMessageHeader;
begin
  Result := Doc.GetDocBinding('Unknown', TXMLMessageHeader, TargetNamespace) as IXMLMessageHeader;
end;

function LoadUnknown(const FileName: string): IXMLMessageHeader;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Unknown', TXMLMessageHeader, TargetNamespace) as IXMLMessageHeader;
end;

function NewUnknown: IXMLMessageHeader;
begin
  Result := NewXMLDocument.GetDocBinding('Unknown', TXMLMessageHeader, TargetNamespace) as IXMLMessageHeader;
end;
function Getresponse(Doc: IXMLDocument): IXMLResponseType199;
begin
  Result := Doc.GetDocBinding('response', TXMLResponseType199, TargetNamespace) as IXMLResponseType199;
end;

function Loadresponse(const FileName: string): IXMLResponseType199;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('response', TXMLResponseType199, TargetNamespace) as IXMLResponseType199;
end;

function Newresponse: IXMLResponseType199;
begin
  Result := NewXMLDocument.GetDocBinding('response', TXMLResponseType199, TargetNamespace) as IXMLResponseType199;
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