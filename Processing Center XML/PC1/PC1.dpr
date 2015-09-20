program PC1;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  PC1_FormUnit in 'PC1_FormUnit.pas' {Form1},
  PC1_ServerMethodsUnit in 'PC1_ServerMethodsUnit.pas',
  PC1_ServerContainerUnit in 'PC1_ServerContainerUnit.pas' {ServerContainer1: TDataModule},
  PC1_WebModuleUnit in 'PC1_WebModuleUnit.pas' {WebModule1: TWebModule},
  PC1_RequestXML in 'PC1_RequestXML.pas',
  request100 in '..\..\XMLComponents\request100.pas',
  PC1_ResponseXML in 'PC1_ResponseXML.pas',
  response100 in '..\..\XMLComponents\response100.pas',
  response198 in '..\..\XMLComponents\response198.pas',
  response199 in '..\..\XMLComponents\response199.pas',
  request198 in '..\..\XMLComponents\request198.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
