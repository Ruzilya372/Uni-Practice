unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Data.SqlExpr, 
  Data.DBXMSQL, System.JSON;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject; 
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1GetEmployeesAction(Sender: TObject; 
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    function GetDBConnectionString: string;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TWebModule1.GetDBConnectionString: string;
begin
  // Параметры подключения к MS SQL Server
  // ВНИМАНИЕ: измените на свои данные!
  Result := 'Driver={ODBC Driver 17 for SQL Server};' +
            'Server=localhost\SQLEXPRESS;' +   // SQL-сервер
            'Database=WebCompanyDB;' +         // БД
            'UID=sa;' +                        // ллогин
            'PWD=YourStrongPassword;';         // пароль
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<!DOCTYPE html>' +
    '<html lang="ru">' +
    '<head><meta charset="UTF-8"><title>Delphi Web App</title></head>' +
    '<body style="font-family: Arial; padding: 20px;">' +
    '<h1>Delphi Web-приложение работает</h1>' +
    '<p>Архитектура: <b>ISAPI + IIS + MS SQL Server</b></p>' +
    '<p><a href="/get_employees" style="font-size: 18px;">Посмотреть список сотрудников (JSON)</a></p>' +
    '<hr>' +
    '<p><small>Разработано в Delphi 10.2 Seattle</small></p>' +
    '</body></html>';
end;

procedure TWebModule1.WebModule1GetEmployeesAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  SQLConnection: TSQLConnection;
  Query: TSQLQuery;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
begin
  SQLConnection := TSQLConnection.Create(nil);
  Query := TSQLQuery.Create(nil);
  JSONArray := TJSONArray.Create;
  try
    SQLConnection.DriverName := 'MSSQL';
    SQLConnection.Params.Text := GetDBConnectionString;
    SQLConnection.LoginPrompt := False;
    SQLConnection.Connected := True;

    Query.SQLConnection := SQLConnection;
    Query.SQL.Text := 'SELECT ID, FullName, Position, HireDate, Salary FROM Employees';
    Query.Open;

    while not Query.Eof do
    begin
      JSONObject := TJSONObject.Create;
      JSONObject.AddPair('id', TJSONNumber.Create(Query.FieldByName('ID').AsInteger));
      JSONObject.AddPair('name', Query.FieldByName('FullName').AsString);
      JSONObject.AddPair('position', Query.FieldByName('Position').AsString);
      JSONObject.AddPair('hireDate', Query.FieldByName('HireDate').AsString);
      JSONObject.AddPair('salary', TJSONNumber.Create(Query.FieldByName('Salary').AsFloat));
      JSONArray.AddElement(JSONObject);
      Query.Next;
    end;

    Response.ContentType := 'application/json; charset=utf-8';
    Response.Content := JSONArray.ToString;
    Response.StatusCode := 200;

  finally
    Query.Free;
    SQLConnection.Free;
    JSONArray.Free;
  end;
  Handled := True;
end;

initialization
  with TWebModule1.Actions.Add do
  begin
    Name := 'Default';
    PathPattern := '/';
    OnAction := TWebModule1.WebModule1DefaultHandlerAction;
  end;

  with TWebModule1.Actions.Add do
  begin
    Name := 'GetEmployees';
    PathPattern := '/get_employees';
    OnAction := TWebModule1.WebModule1GetEmployeesAction;
  end;

end.
