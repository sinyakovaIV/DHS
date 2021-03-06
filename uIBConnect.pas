unit uIBConnect;

interface

uses Classes, Forms, SysUtils, DB, IBX.IBDatabase, IBX.IBQuery, IBX.IBTable,
  IBX.IBStoredProc, IBX.IBCustomDataSet, IBX.IBScript, IBX.IBServices;

type
  TOnLogEvent = procedure(Sender: TObject; const Msg: string) of object;
  TIBConnect = class;

  TIBConnect = class(TPersistent)
  private
    fDatabase: TIBDatabase;
    fQuery: TIBQuery;
    fTransaction: TIBTransaction;
    fStoredProc: TIBStoredProc;
    // fTable: TIBTable;
    fOnConnect: TNotifyEvent; // ����������� ��� ��� ��� ����������� �������
    fOnDisconnect: TNotifyEvent;
    fIDUser: integer;
    fOnLog: TOnLogEvent;
    function GetConnected: boolean;
    procedure DoOnConnect;
    procedure DoOnDisconnect;
    procedure DoOnLog(const Msg: string);
  public
    constructor Create;
    destructor Destroy; override;
    function Connect(const aDatabaseName: string;
      const aLoginPrompt: boolean = false;
      const DefaultCharSet: string = 'WIN1251'; const User: string = 'SYSDBA';
      const Password: string = 'masterkey'; const Role: string = ''): boolean;
    procedure Disconnect;
    property Connected: boolean read GetConnected;
    property IDUser: integer read fIDUser write fIDUser;
    property Database: TIBDatabase read fDatabase;
    property Query: TIBQuery read fQuery;
    // property Table: TIBTable read fTable;
    property Transaction: TIBTransaction read fTransaction;
    property StoredProc: TIBStoredProc read fStoredProc;
    property OnConnect: TNotifyEvent read fOnConnect write fOnConnect;
    property OnDisconnect: TNotifyEvent read fOnDisconnect write fOnDisconnect;
    property OnLog: TOnLogEvent read fOnLog write fOnLog;
  end;

implementation

{ TIBConnect }

function TIBConnect.Connect(const aDatabaseName: string;
  const aLoginPrompt: boolean; const DefaultCharSet: string;
  const User, Password, Role: string): boolean;
begin
  Result := false;
  try

    with fDatabase do
    begin
      DatabaseName := aDatabaseName;
      LoginPrompt := aLoginPrompt;
      Params.Clear;
      Params.Add('lc_ctype=' + DefaultCharSet);
      Params.Add('user_name=' + User);
      Params.Add('Password=' + Password);
      if Role <> '' then
        Params.Add('sql_role_name=' + Role);
      Connected := true;
    end;

    with fQuery do
    begin
      Database := fDatabase;
      Transaction := fTransaction;
      SQL.Clear;
    end;

    with fStoredProc do
    begin
      Database := fDatabase;
      Transaction := fTransaction;
      Params.Clear;
    end;

    Result := fDatabase.Connected;
    if Result then
      DoOnConnect;

  except
    on E: Exception do
      OnLog(Self,E.Message);
  end;
end;

constructor TIBConnect.Create;
begin
  fDatabase := TIBDatabase.Create(nil);
  fQuery := TIBQuery.Create(nil);
  fQuery.Database := fDatabase;
  fStoredProc := TIBStoredProc.Create(nil);
  fStoredProc.Database := fDatabase;
  fTransaction := TIBTransaction.Create(nil);
  fTransaction.AutoStopAction := saCommit;  //��������, ������� ����������� ���� ���������� �� ������� �������������
  fTransaction.AddDatabase(fDatabase);
  fTransaction.DefaultDatabase := fDatabase;
  { fTable := TIBTable.Create(nil);
    fTable.Database := fDatabase;
    fTable.Transaction := fTransaction; }
end;

destructor TIBConnect.Destroy;
begin
  Disconnect;
  fStoredProc.Free;
  fQuery.Free;
  // fTable.Free;
  fDatabase.Free;
  fTransaction.Free;
  inherited;
end;

procedure TIBConnect.Disconnect;
begin
  if fDatabase.Connected then
  begin
    fDatabase.Connected := false;
    DoOnDisconnect;
  end;
end;

procedure TIBConnect.DoOnConnect;
begin
  if Assigned(fOnConnect) then
    fOnConnect(Self);
// Assigned - �������, ����������� ��������� �� nil - ���� �� nil, �� ���������� true
end;

procedure TIBConnect.DoOnDisconnect;
begin
  if Assigned(fOnDisconnect) then
    fOnDisconnect(Self);
end;

procedure TIBConnect.DoOnLog(const Msg: string);
begin
  if Assigned(fOnLog) then
    fOnLog(Self,Msg);
end;

function TIBConnect.GetConnected: boolean;
begin
  Result := fDatabase.Connected;
end;

end.
