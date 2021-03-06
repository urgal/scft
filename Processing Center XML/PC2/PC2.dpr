program PC2;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  PC2_FormUnit in 'PC2_FormUnit.pas' {Form1},
  PC2_ServerMethodsUnit in 'PC2_ServerMethodsUnit.pas',
  PC2_ServerContainerUnit in 'PC2_ServerContainerUnit.pas' {ServerContainer1: TDataModule},
  PC2_WebModuleUnit in 'PC2_WebModuleUnit.pas' {WebModule1: TWebModule},
  PC2_RequestXML in 'PC2_RequestXML.pas',
  request100 in '..\..\XMLComponents\request100.pas',
  PC2_ResponseXML in 'PC2_ResponseXML.pas',
  response100 in '..\..\XMLComponents\response100.pas',
  response198 in '..\..\XMLComponents\response198.pas',
  response199 in '..\..\XMLComponents\response199.pas',
  request198 in '..\..\XMLComponents\request198.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
