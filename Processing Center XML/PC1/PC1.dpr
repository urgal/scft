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
  PC1_Request in 'PC1_Request.pas',
  request100 in '..\..\XMLComponents\request100.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
