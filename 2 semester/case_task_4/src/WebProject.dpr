program WebProject;

uses
  Web.WebBroker,
  WebModuleUnit1;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
