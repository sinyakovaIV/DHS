unit Logger;

interface

uses
  System.Classes, System.SyncObjs, System.SysUtils;

type
  TLogDetailLevel = (ldlNone, ldlFatalError, ldlError, ldlNormal, ldlDebug, ldlTrace);
  TLogFileMode = (lfmAppend, lfmClear, lfmNewFile);
  TLogFileNameGeneratingPart = (gpDate, gpTime, gpIndex);
  TLogFileNameGeneratingParts = set of TLogFileNameGeneratingPart;
  TLogFileNameGeneratingReason = (grChangeDate, grCheckFileSize);
  TLogFileNameGeneratingReasons = set of TLogFileNameGeneratingReason;
  TOnLogAddEvent = procedure (Sender: TObject; EventLevel: TLogDetailLevel; LogMessage: string) of object;


  TLogger = class(TComponent)
  private
    fLogLevel: TLogDetailLevel;
    fCriticalSection: TCriticalSection;
    fLogFileMode: TLogFileMode;
    fProjectName: string;
    fActive: boolean;
    fEncoding: TEncoding;
    fEncodingName: string;
    fFileName: string;
    fCurrentFileName: string;
    fLogFileSize: int64;
    fStartTime: TDateTime;
    fStartDate: TDate;
    fGenFileNameReasons: TLogFileNameGeneratingReasons;
    fGenFileNameParts: TLogFileNameGeneratingParts;
    fGenFileNameEnable: boolean;
    fLogBufferSize: integer;
    fOnInitialize: TNotifyEvent;
    fOnStartLog: TNotifyEvent;
    fOnStopLog: TNotifyEvent;
    fOnAddEvent: TOnLogAddEvent;
    fOnChangeFile: TNotifyEvent;
    procedure SetActive(const Value: boolean);
    function GetEncoding: string;
    procedure SetEncoding(const Value: string);
    function GetVersion: string;
    function GetCurrentFileName: string;
    procedure SetFileName(const Value: string);
  protected
    fLogFile: TStreamWriter;
    function GenerateFileName(const AFileName: string; const AParts: TLogFileNameGeneratingParts): string;
    function CheckFileName(const AContinueWrite: boolean = true): boolean;
    procedure SetCaptionLogFile;
    procedure StartLog(const Continue: boolean = false);
    procedure StopLog;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddEvent(const ADetailLevel: TLogDetailLevel; const AEvent: string; const AParams: array of const);
    property StartTime: TDateTime read fStartTime;
  published
    property Active: boolean read fActive write SetActive default false;
    property CurrentFileName: string read fCurrentFileName;
    property Encoding: string read GetEncoding write SetEncoding;
    property FileName: string read fFileName write SetFileName;
    property GeneratingEnable: boolean read fGenFileNameEnable write fGenFileNameEnable default false;
    property GeneratingParts: TLogFileNameGeneratingParts read fGenFileNameParts write fGenFileNameParts;
    property GeneratingReasons: TLogFileNameGeneratingReasons read fGenFileNameReasons write fGenFileNameReasons;
    property LogBufferSize: integer read fLogBufferSize write fLogBufferSize default 4096;
    property LogLevel: TLogDetailLevel read fLogLevel write fLogLevel default ldlNormal;
    property LogFileMode: TLogFileMode read fLogFileMode write fLogFileMode default lfmAppend;
    property LogFileSize: int64 read fLogFileSize write fLogFileSize default 524288;
    property ProjectName: string read fProjectName write fProjectName;
    property Version: string read GetVersion;
    property OnAddEvent: TOnLogAddEvent read fOnAddEvent write fOnAddEvent;
    property OnChangeFile: TNotifyEvent read fOnChangeFile write fOnChangeFile;
    property OnInitialize: TNotifyEvent read fOnInitialize write fOnInitialize;
    property OnStartLog: TNotifyEvent read fOnStartLog write fOnStartLog;
    property OnStopLog: TNotifyEvent read fOnStopLog write fOnStopLog;
  end;



implementation

uses System.IOUtils, System.Types;

{ TLogger }

procedure TLogger.AddEvent(const ADetailLevel: TLogDetailLevel; const AEvent: string; const AParams: array of const);
var
  s: string;
begin
  if not fActive then
  begin
    raise Exception.Create('Logger not active!');
    Exit;
  end;

  if ADetailLevel <= fLogLevel then
  begin
    fCriticalSection.Enter;
    CheckFileName;
    s := FormatDateTime('hh:nn:ss.zzz',Time)+#9+format(AEvent,AParams);
    fLogFile.WriteLine(s);
    fCriticalSection.Leave;
    if Assigned(fOnAddEvent) then
      fOnAddEvent(Self,ADetailLevel,s);
  end;
end;

function TLogger.CheckFileName(const AContinueWrite: boolean = true): boolean;
var
  TempName: string;
begin
  Result := true;
  if not fGenFileNameEnable or (fGenFileNameReasons = []) then
    Exit;

  TempName := '';
  if (grChangeDate in fGenFileNameReasons) and (fStartDate < Date) then
    TempName := GenerateFileName(fCurrentFileName,fGenFileNameParts);
  if (grCheckFileSize in fGenFileNameReasons) and (fLogFile.BaseStream.Size >= fLogFileSize - 64) then
    TempName := GenerateFileName(fCurrentFileName,fGenFileNameParts + [gpIndex]);
  if (TempName <> '') and (TempName > fCurrentFileName) then
  begin
    if AContinueWrite then
    begin
      fLogFile.WriteLine('*********************************************');
      fLogFile.WriteLine('Continue in file '+TempName+'...');
    end else
      Result := False;
    fLogFile.Free;
    fCurrentFileName := TempName;
    if Assigned(fOnChangeFile) then
      fOnChangeFile(Self);
    StartLog(True);
  end;
end;

constructor TLogger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCriticalSection := TCriticalSection.Create;
  fEncoding := TEncoding.ANSI;
  fLogLevel := ldlNormal;
  fLogFileMode := lfmAppend;
  fLogFileSize := 524288;
  fLogBufferSize := 4096;
  fGenFileNameParts := [gpDate, gpTime, gpIndex];
  fGenFileNameReasons := [grChangeDate, grCheckFileSize];
  fGenFileNameEnable := false;
end;

destructor TLogger.Destroy;
begin
  if fActive then
    StopLog;
  fCriticalSection.Free;
  inherited;
end;

function TLogger.GenerateFileName(const AFileName: string;
  const AParts: TLogFileNameGeneratingParts): string;
var
  n, Index: integer;
  FirstPart, Temp: string;
begin
  FirstPart := ExtractFileName(AFileName);
  n := Pos('_',FirstPart);
  if n > 0 then
  begin
    Temp := Copy(FirstPart,n+1,length(FirstPart));
    FirstPart := Copy(FirstPart,1,n-1);
  end else begin
    Temp := ExtractFileExt(FirstPart);
    FirstPart := Copy(FirstPart,1,Length(FirstPart) - Length(Temp));
    Temp := '';
  end;

  if Temp = '' then
    Index := 0
  else begin
    n := Pos('_',Temp);
    if n>0 then
    begin
      Temp := Copy(Temp,n+1,length(Temp));
      Temp := Copy(Temp,1,Length(Temp) - Length(ExtractFileExt(Temp)));
      Index := StrToIntDef(Temp,0);
    end;
  end;
  Temp := '';
  if gpDate in AParts then
    Temp := FormatDateTime('yyyymmdd',Date);
  if gpTime in AParts then
    Temp := Temp + '_' + FormatDateTime('hhmmss',Time);
  if gpIndex in AParts then
    Temp := Temp + '_' + IntToStr(Index+1);
  if Temp[1] <> '_' then
    Temp := '_' + Temp;
  Result := FirstPart + Temp + ExtractFileExt(AFileName);
  Temp := ExtractFilePath(AFileName);
  if Temp = '' then
    Temp := ExtractFilePath(ParamStr(0));
  Result := Temp + Result;
end;

function TLogger.GetCurrentFileName: string;
begin
  Result := GenerateFileName(fFileName,fGenFileNameParts);
end;

function TLogger.GetEncoding: string;
begin
  Result := fEncodingName;
  if Result = '' then
    Result := fEncoding.EncodingName;
end;

function TLogger.GetVersion: string;
begin
  Result:='version 2.0 (18.07.2014)';
end;

procedure TLogger.SetActive(const Value: boolean);
begin
  if fActive=Value then
    Exit;
  fActive := Value;
  case fActive of
  True: StartLog;
  False: StopLog;
  end;
end;

procedure TLogger.SetCaptionLogFile;
var
  s: string;
  i,n1: integer;
begin
  fLogFile.WriteLine('************  (c)Nik RON, 2014  *************');
  fLogFile.WriteLine('***    TLogger '+Version+'   ***');
  fLogFile.WriteLine('*********************************************');
  if length(fProjectName)<45 then
    n1:=(45-length(fProjectName)) div 2-1
  else
    n1:=3;
  s:='*';
  for i:=1 to n1 do
    s:=s+' ';
  s:=s+fProjectName+' ';
  for i:=1 to n1-1 do
    s:=s+' ';
  fLogFile.WriteLine(s+'*');
  fLogFile.WriteLine('*********************************************');
end;

procedure TLogger.SetEncoding(const Value: string);
begin
  fEncodingName := Value;
  fEncoding := TEncoding.GetEncoding(Value);
end;

procedure TLogger.SetFileName(const Value: string);
begin
  fFileName := Value;
end;

procedure TLogger.StartLog(const Continue: boolean);
var
  FlagAppend: boolean;
  FStream: TFileStream;
  FileList: TStringDynArray;
  s: string;
begin
  if Assigned(fOnInitialize) then
    fOnInitialize(Self);

  case fLogFileMode of
    lfmAppend: begin
      FlagAppend := True;
      if not Continue then
        fCurrentFileName := fFileName;
    end;
    lfmClear: begin
      FlagAppend := False;
      if not Continue then
        fCurrentFileName := fFileName;
    end;
    lfmNewFile: begin
      FlagAppend := False;
      if not Continue then
        fCurrentFileName := GenerateFileName(fFileName,fGenFileNameParts + [gpDate,gpTime]);
    end;
  end;

  if (not Continue) and (not (fLogFileMode = lfmNewFile)) then
    fCurrentFileName := GenerateFileName(fCurrentFileName,fGenFileNameParts);


  if (not FileExists(fCurrentFileName)) or (not FlagAppend) then
    FStream := TFileStream.Create(fCurrentFileName, fmCreate or fmShareDenyWrite)
  else begin
    s := ChangeFileExt(ExtractFileName(fFileName),'*'+ExtractFileExt(fFileName));
    FileList := TDirectory.GetFiles(ExtractFilePath(fCurrentFileName),s);
    fCurrentFileName := FileList[High(FileList)];
    SetLength(FileList,0);
    FStream := TFileStream.Create(fCurrentFileName, fmOpenWrite or fmShareDenyWrite);
    FStream.Seek(0, soEnd);
  end;
  fLogFile := TStreamWriter.Create(FStream, fEncoding, fLogFileSize);
  fLogFile.OwnStream;
  fStartTime := Now;
  fStartDate := Date;
  if fLogFile.BaseStream.Size = 0 then
    SetCaptionLogFile;

  if not CheckFileName(false) then
    Exit;
  if not Continue then
    fLogFile.WriteLine(DateTimeToStr(Now)+'> Start log...')
  else
    fLogFile.WriteLine(DateTimeToStr(Now)+'> Continue log...');

  if Assigned(fOnStartLog) then
    fOnStartLog(Self);
end;

procedure TLogger.StopLog;
begin
  fLogFile.WriteLine(DateTimeToStr(Now)+'> Stop log.');
  fLogFile.WriteLine('*********************************************');
  fLogFile.Free;
  if Assigned(fOnStopLog) then
    fOnStopLog(Self);
end;

end.
