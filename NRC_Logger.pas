unit NRC_Logger;

interface

uses
  SysUtils, Classes, Registry;

const
  ErLog_LoadOptions = 1;
  ErLog_SaveOptions = 2;
  ErLog_CreateFile = 3;
  ErLog_OpenFile = 4;

type
  TLogFileMode = (lmAppend, lmClear, lmNewFile);
  {класс - объект, обеспечивающий ведение лог-файла работы программы
  Свойства класса:
    - Active - активность ведения лога (установка в true запускает ведение лога,
               установка в false останавливает ведение лога)
    - FileName - имя (шаблон имени) файла лога
    - LastError - код ошибки выполнения последней операции
    - LogFileMode - режим работы с лог-файлом
                    lmAppend - добавление в существующий файл
                              (при отсутствии будет создан)
                    lmClear - перезаписывание лог-файла
                    lmNewFile - создание каждый раз нового лог-файла
                                (FileName используется в качестве шаблона имени)
    - MaxCount - максимальное количество строк, хранимых в буфере
    - RegKey - ключ реестра, в котором будут хранится настройки
    - Version - версия компонента
  Методы класса:
    - AddLine - добавление строки в лог
    - GetActiveFileName - получение имени файла активного лога (актуально при
                          режиме lmNewFile)
    - OptionsLoadFromRegistry - чтение настроек из реестра
    - OptionsSaveToRegistry - сохранение настроек в реестр
    - SaveLine - сохранение строк из буфера в файл и очистка буфера
    - SetCaptionLogFile - запись заголовка лог-файла}
  TNRC_Logger = class(TComponent)
  private
    { Private declarations }
    fLine: TStringList;
    fLog: TFileStream;
    fActive: boolean;
    fMaxCount: integer;
    fLastError: integer;
    fFileName: TFileName;
    fActiveFileName: TFileName;
    fLogFileMode: TLogFileMode;
    fChangeActiveFileName: boolean;
    fRegKey: string;
    fProgramName: string;
    procedure SetActive(const Value: boolean);
    procedure SetMaxCount(const Value: integer);
    function GetLastError: integer;
    function GetVersion: string;
  protected
    { Protected declarations }
    procedure SetCaptionLogFile;
    procedure SaveLine;
    procedure StartLog;
    procedure StopLog;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddLine(const aLine: string);
    procedure ChangeActiveFileName(const Suffix: string);
    function GetActiveFileName: TFileName;
    function LoadOptionsFromRegistry(const RootKey: cardinal): boolean;
    function SaveOptionsToRegistry(const RootKey: cardinal): boolean;
    property LastError: integer read GetLastError;
  published
    { Published declarations }
    property Active: boolean read fActive write SetActive default false;
    property FileName: TFileName read fFileName write fFileName;
    property LogFileMode: TLogFileMode read fLogFileMode write fLogFileMode default lmAppend;
    property MaxCount: integer read fMaxCount write SetMaxCount default 500;
    property ProgramName: string read fProgramName write fProgramName;
    property RegKey: string read fRegKey write fRegKey;
    property Version: string read GetVersion;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('NRC', [TNRC_Logger]);
end;

{ TNRC_Logger }

procedure TNRC_Logger.AddLine(const aLine: string);
begin
  if fLine=nil then
    Exit;
  if fLine.Count=fMaxCount then
    SaveLine;
  fLine.Add(aLine);
end;

procedure TNRC_Logger.ChangeActiveFileName(const Suffix: string);
var
  n: integer;
begin
  n:=Length(ExtractFileExt(fFileName));
  fActiveFileName:=Copy(fFileName,1,length(fFileName)-n)+'_'+Suffix+ExtractFileExt(fFileName);
  fChangeActiveFileName:=true;
end;

constructor TNRC_Logger.Create(AOwner: TComponent);
begin
  inherited;
  fLine:=nil;
  fLog:=nil;
  fActive:=false;
  fFileName:='';
  fActiveFileName:='';
  fLogFileMode:=lmAppend;
  fMaxCount:=500;
  fLastError:=0;
  fRegKey:='';
  fChangeActiveFileName:=false;
  fProgramName:='';
end;

destructor TNRC_Logger.Destroy;
begin
  Active:=false;
  inherited;
end;

function TNRC_Logger.GetActiveFileName: TFileName;
begin
  Result:=fActiveFileName;
end;

function TNRC_Logger.GetLastError: integer;
begin
  Result:=fLastError;
  fLastError:=0;
end;

function TNRC_Logger.GetVersion: string;
begin
  Result:='version 1.0 (30.11.2007)';
end;

function TNRC_Logger.LoadOptionsFromRegistry(const RootKey: cardinal): boolean;
var
  Reg: TRegistry;
begin
  fLastError:=0;
  Result:=false;
  Reg:=TRegistry.Create;
  Reg.RootKey:=RootKey;
  try
    if Reg.OpenKeyReadOnly(fRegKey) then
      begin
        fFileName:=Reg.ReadString('LogFile');
        fLogFileMode:=TLogFileMode(Reg.ReadInteger('LogFileMode'));
        fMaxCount:=Reg.ReadInteger('MaxCount');
        Reg.CloseKey;
        Result:=true;
      end;
  except
    fLastError:=ErLog_LoadOptions;
  end;
  Reg.Free;
end;

function TNRC_Logger.SaveOptionsToRegistry(const RootKey: cardinal): boolean;
var
  Reg: TRegistry;
begin
  fLastError:=0;
  Result:=true;
  Reg:=TRegistry.Create;
  Reg.RootKey:=RootKey;
  try
    if Reg.OpenKey(fRegKey,true) then
      begin
        Reg.WriteString('LogFile',fFileName);
        Reg.WriteInteger('LogFileMode',ord(fLogFileMode));
        Reg.WriteInteger('MaxCount',fMaxCount);
        Reg.CloseKey;
      end;
  except
    Result:=false;
    fLastError:=ErLog_SaveOptions;
  end;
  Reg.Free;
end;

procedure TNRC_Logger.SaveLine;
begin
  fLog.Seek(0,soFromEnd);
  fLine.SaveToStream(fLog);
  fLine.Clear;
end;

procedure TNRC_Logger.SetActive(const Value: boolean);
var
  SR: TSearchRec;
  n: integer;
begin
  if fActive=Value then
    Exit;
  fLastError:=0;
  if Value then
    try
      fLine:=TStringList.Create;
      case fLogFileMode of
        lmAppend:
        begin
          if not fChangeActiveFileName then          
            fActiveFileName:=FileName;
          if FindFirst(fActiveFileName,faAnyFile,SR)=0 then
            try
              fLog:=TFileStream.Create(fActiveFileName,fmOpenReadWrite,fmShareExclusive);
              StartLog;
            except
              fLastError:=ErLog_OpenFile;
            end
          else
            begin
              fLog:=TFileStream.Create(fActiveFileName,fmCreate,fmShareExclusive);
              SetCaptionLogFile;
              StartLog;
            end;
          SysUtils.FindClose(SR);
        end;
        lmClear:
        begin
          if not fChangeActiveFileName then          
            fActiveFileName:=fFileName;
          fLog:=TFileStream.Create(fActiveFileName,fmCreate,fmShareExclusive);
          SetCaptionLogFile;
          StartLog;
        end;
        lmNewFile:
        begin
          n:=Length(ExtractFileExt(fFileName));
          fActiveFileName:=Copy(fFileName,1,length(fFileName)-n)+'_'+FormatDateTime('yyyy-mm-dd_hh-mm-ss',Now)+ExtractFileExt(fFileName);
          fLog:=TFileStream.Create(fActiveFileName,fmCreate,fmShareExclusive);
          SetCaptionLogFile;
          StartLog;
        end;
      end;
    except
      fLastError:=ErLog_CreateFile;
    end
  else
    begin
      StopLog;
//      if fLine.Count>0 then
        SaveLine;
      FreeAndNil(fLine);
      FreeAndNil(fLog);
    end;
  fActive:=Value and (fLastError=0);
end;

procedure TNRC_Logger.SetCaptionLogFile;
var
  s: string;
  i,n1: integer;
begin
  AddLine('*********  (c)NRCom Software, 2007  *********');
  AddLine('***  TNRC_Logger '+Version+' ***');
  AddLine('*********************************************');
  if length(fProgramName)<45 then
    n1:=(45-length(fProgramName)) div 2-1
  else
    n1:=3;
  s:='*';
  for i:=1 to n1 do
    s:=s+' ';
  s:=s+fProgramName+' ';
  for i:=1 to n1-1 do
    s:=s+' ';
  AddLine(s+'*');
  AddLine('*********************************************');
end;

procedure TNRC_Logger.SetMaxCount(const Value: integer);
begin
  if (Active) and (fLine.Count>=Value) then
    SaveLine;
  fMaxCount:=Value;
end;

procedure TNRC_Logger.StartLog;
begin
  AddLine(DateTimeToStr(Now)+'> Start log...');
end;

procedure TNRC_Logger.StopLog;
begin
  AddLine(DateTimeToStr(Now)+'> Stop log.');
  AddLine('*********************************************');
end;

end.
