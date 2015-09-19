
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 19.09.2015 21:39:58                               }
{       Generated from: D:\SVN\HACATON\trunk\Docs\Scheme\request100.xsd   }
{   Settings stored in: D:\SVN\HACATON\trunk\Docs\Scheme\request100.xdb   }
{                                                                         }
{*************************************************************************}

unit request100;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMessageHeader = interface;
  IXMLRequestHeader = interface;
  IXMLRequestType100 = interface;
  IXMLOperation = interface;
  IXMLResponseHeader = interface;
  IXMLAnswer = interface;

{ IXMLMessageHeader }

  IXMLMessageHeader = interface(IXMLNode)
    ['{6F570BD0-6AE2-462D-A3F9-9BB9FDDAE5F6}']
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
    ['{47737239-BC0D-4824-B28A-C6962143FF4A}']
  end;

{ IXMLRequestType100 }

  IXMLRequestType100 = interface(IXMLRequestHeader)
    ['{318045EE-6EAF-448D-8920-73A73F9064A6}']
    { Property Accessors }
    function Get_Body: IXMLOperation;
    { Methods & Properties }
    property Body: IXMLOperation read Get_Body;
  end;

{ IXMLOperation }

  IXMLOperation = interface(IXMLNode)
    ['{03CF1ACC-9E28-45A3-8D5B-1202A5F00AF3}']
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
    ['{68FCD935-53EE-4209-A90A-FE73E45234B3}']
    { Property Accessors }
    function Get_Answer: IXMLAnswer;
    { Methods & Properties }
    property Answer: IXMLAnswer read Get_Answer;
  end;

{ IXMLAnswer }

  IXMLAnswer = interface(IXMLNode)
    ['{3C73B5BB-5008-4C98-8E97-0DC461F534FB}']
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
  TXMLRequestType100 = class;
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

{ TXMLRequestType100 }

  TXMLRequestType100 = class(TXMLRequestHeader, IXMLRequestType100)
  protected
    { IXMLRequestType100 }
    function Get_Body: IXMLOperation;
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

{ Global Functions }

function Getrequest(Doc: IXMLDocument): IXMLRequestType100;
function Loadrequest(const FileName: string): IXMLRequestType100;
function Newrequest: IXMLRequestType100;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getrequest(Doc: IXMLDocument): IXMLRequestType100;
begin
  Result := Doc.GetDocBinding('request', TXMLRequestType100, TargetNamespace) as IXMLRequestType100;
end;

function Loadrequest(const FileName: string): IXMLRequestType100;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('request', TXMLRequestType100, TargetNamespace) as IXMLRequestType100;
end;

function Newrequest: IXMLRequestType100;
begin
  Result := NewXMLDocument.GetDocBinding('request', TXMLRequestType100, TargetNamespace) as IXMLRequestType100;
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

{ TXMLRequestType100 }

procedure TXMLRequestType100.AfterConstruction;
begin
  RegisterChildNode('body', TXMLOperation);
  inherited;
end;

function TXMLRequestType100.Get_Body: IXMLOperation;
begin
  Result := ChildNodes['body'] as IXMLOperation;
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