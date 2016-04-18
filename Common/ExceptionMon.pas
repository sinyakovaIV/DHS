unit ExceptionMon;

{ TExceptionMonitor - компонент для перехвата ошибок, необработанных приложением.
  В режиме по умолчанию выводит сообщение об ошибке при помощи динамически создаваемой формы.

  Для успешного использования требуется:
  1. библиотека JCL (Jedi)
  2. в файле проекта должны быть включены опции
  // JCL_DEBUG_EXPERT_GENERATEJDBG ON
  // JCL_DEBUG_EXPERT_INSERTJDBG ON
  3. в настройках проекта должна быть включена опция генерации map-файла
  4. в настройках проекта должна быть включена debug-информация

  Протестировано на Delphi 7 и Delphi XE6.

  Поддерживается несколько методов отображения сообщения об ошибке:
    - smSystem - сообщение, генерируемое операционной системой;
    - smDefault - диалоговое окно генерируется процедурой ShowException(E: Exception);
    - smExternal - "внешняя обработка - вызывается обработчик события OnShowException;
    - smNone - диалоговые окна отключены.

  Для поддержки работы в приложениях-сервисах имеется свойство ApplicationType:
    - atForms (по умолчанию);
    - atServices.

  Информация о перехваченной ошибке содержится в runtime-свойствах:
    - StackList: TStrings;
    - ErrorClassType: TClass;
    - ErrorCode: string;
    - ErrorMessage: string;
    - ErrorMessageEx: string;
    - ErrorTime: TDateTime.

  Содержание отображаемой информации можно регулировать при помощи свойства
    ShowElements: TExceptionElements, которое позволяет ограничивать количество
    выдаваемой информации в диалоговом окне.
    По умолчанию включены все доступные элементы.
  P.S. Справедливо для функции ExceptionToString(AllInfo = false).

  Также доступно свойство ExternalData: TStrings, содержимое которого включается
  "как есть" в текст сообщения об ошибке.

  Компонент подключется к TApplicationEvents.OnException - при этом если
  свойство ApplicationEvents: TApplicationEvents не задано явно, то используется
  внутренний экземпляр TApplicationEvents.

  Компонент обрабатывает два события:
    - OnRegisteredError: TNotifyEvent - сообщает о факте появления ошибки;
    - OnShowException: TOnShowException - используется для вывода сообщения
      об ошибке в режиме ShowMethod = smExternal.
  Методы компонента:
    - procedure RegistrationException(E: Exception);
      позволяет "принудительно" регистрировать ошибку. Например, в блоках
      try except on E: Exception do;
    - procedure SaveToFile(const AFileName: string; const Rewrite: boolean = false);
      позволяет сохранять сообщение об ошибке в файл AFileName. По умолчанию
      выполняется дописывание сообщения в конец файла.
    - function ExceptionToString(const AllInfo: boolean = True; const ShowFirstLineCallStack: integer = 3): string;
      позволяет сформатировать сообщение об ошибке в виде строки.
      Параметр AllInfo указывает необходимость учитывания настроек
      в свойстве ShowElements и параметра ShowFirstLineCallStack}

interface

uses
   {$IFDEF VER150}
   Windows, SysUtils, Classes, AppEvnts, Forms, StdCtrls, ComCtrls, SvcMgr,
   {$ELSE}
   WinAPI.Windows, System.SysUtils, System.Classes, Vcl.AppEvnts, Vcl.Forms,
     Vcl.StdCtrls, Vcl.ComCtrls, Vcl.SvcMgr,
   {$ENDIF}
   JclDebug;

type
  TShowMethod = (smSystem, smDefault, smExternal, smNone);
  TOnShowException = procedure(Sender: TObject; E: Exception) of object;
  TExceptionElement = (eeEventTime, eeApplicationName, eeExternalData,
                       eeClassName, eeMessage, eeErrorCode, eeMessageEx,
                       eeCallStack);
  TExceptionElements = set of TExceptionElement;
  TApplicationType = (atForms, atServices);

  TExceptionMonitor = class(TComponent)
  private
    fInnerAppEvents: TApplicationEvents;
    fApplicationEvents: TApplicationEvents;
    fStackList: TStrings;
    fOnRegisteredError: TNotifyEvent;
    fErrorMessageEx: string;
    fErrorMessage: string;
    fErrorClassType: TClass;
    fShowMethod: TShowMethod;
    fOnShowException: TOnShowException;
    fErrorTime: TDateTime;
    fExternalData: TStrings;
    fErrorCode: string;
    fShowElements: TExceptionElements;
    fApplicationType: TApplicationType;
    procedure DoException(Sender: TObject; E: Exception);
    procedure SetApplicationEvents(const Value: TApplicationEvents);
  protected
    MessageBox: TRichEdit;
    MessageBoxHeight: integer;
    MessageBoxWidth: integer;
    FormHeight : integer;
    FormWidth : integer;
    ButtonTop: integer;
    procedure SetFormBounds;
    procedure TabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure ShowException(E: Exception);
    procedure SaveClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegistrationException(E: Exception);
    procedure SaveToFile(const AFileName: string; const Rewrite: boolean = false);
    function ExceptionToString(const AllInfo: boolean = True; const ShowFirstLineCallStack: integer = 3): string;
    property StackList: TStrings read fStackList;
    property ErrorClassType: TClass read fErrorClassType;
    property ErrorCode: string read fErrorCode;
    property ErrorMessage: string read fErrorMessage;
    property ErrorMessageEx: string read fErrorMessageEx;
    property ErrorTime: TDateTime read fErrorTime;
  published
    property ApplicationEvents: TApplicationEvents read fApplicationEvents write SetApplicationEvents;
    property ApplicationType: TApplicationType read fApplicationType write fApplicationType;
    property ShowElements: TExceptionElements read fShowElements write fShowElements;
    property ExternalData: TStrings read fExternalData;
    property ShowMethod: TShowMethod read fShowMethod write fShowMethod;
    property OnRegisteredError: TNotifyEvent read fOnRegisteredError write fOnRegisteredError;
    property OnShowException: TOnShowException read fOnShowException write fOnShowException;
  end;

var
  ExceptionMonitor: TExceptionMonitor;

implementation

uses
  {$IFDEF VER150}
  Controls, Dialogs, ExtCtrls, Tabs, Graphics
  {$ELSE}
  Vcl.Controls, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Tabs, Vcl.Graphics, System.IOUtils
  {$ENDIF};

{ local methods}

procedure CleanUpStackInfoJCL(Info: Pointer);
begin
  FreeMem(Info);
end;

function GetExceptionStackInfoJCL(P: PExceptionRecord): Pointer;
const
  cDelphiException = $0EEDFADE;
var
  Stack: TJclStackInfoList;
  Str: TStringList;
  Trace: String;
  Sz: Integer;
begin
  {$IFDEF VER150}
  Stack := JclCreateStackList(False, 3, P^.ExceptionAddress);
  {$ELSE}
  if P^.ExceptionCode = cDelphiException then
    Stack := JclCreateStackList(False, 3, P^.ExceptAddr)
  else
    Stack := JclCreateStackList(False, 3, P^.ExceptionAddress);
  {$ENDIF}
  try
    Str := TStringList.Create;
    try
      Str.Add('Exception Code: $'+IntToHex(P^.ExceptionCode,8));
      Stack.AddToStrings(Str, True, True, True, True);
      Trace := Str.Text;
    finally
      FreeAndNil(Str);
    end;
  finally
    FreeAndNil(Stack);
  end;

  if Trace <> '' then
  begin
    Sz := (Length(Trace) + 1) * SizeOf(Char);
    GetMem(Result, Sz);
    Move(Pointer(Trace)^, Result^, Sz);
  end
  else
    Result := nil;
end;

function GetStackInfoStringJCL(Info: Pointer): string;
begin
  Result := PChar(Info);
end;

{ TExceptionMonitor }

constructor TExceptionMonitor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fInnerAppEvents := TApplicationEvents.Create(Self);
  fInnerAppEvents.Name := 'InnerAppEvents';
  fInnerAppEvents.OnException := DoException;
  fApplicationEvents := fInnerAppEvents;
  fStackList := TStringList.Create;
  fExternalData := TStringList.Create;
  fShowMethod := smDefault;
  MessageBox := nil;
  {$IFDEF VER150}
  {$ELSE}
  Exception.GetExceptionStackInfoProc := GetExceptionStackInfoJCL;
  Exception.GetStackInfoStringProc := GetStackInfoStringJCL;
  Exception.CleanUpStackInfoProc := CleanUpStackInfoJCL;
  {$ENDIF}
  FormHeight := 200;
  FormWidth := 400;
  fShowElements := [eeEventTime, eeApplicationName, eeExternalData,
    eeClassName, eeMessage, eeErrorCode, eeMessageEx, eeCallStack];
  fApplicationType := atForms;
end;

destructor TExceptionMonitor.Destroy;
begin
  {$IFDEF VER150}
  {$ELSE}
  Exception.GetExceptionStackInfoProc := nil;
  Exception.GetStackInfoStringProc := nil;
  Exception.CleanUpStackInfoProc := nil;
  {$ENDIF}
  fExternalData.Free;
  fStackList.Free;
  fInnerAppEvents.Free;
  inherited;
end;

procedure TExceptionMonitor.DoException(Sender: TObject; E: Exception);
var
  {$IFDEF VER150}
  Stack: TJclStackInfoList;
  {$ELSE}
  Inner: Exception;
  {$ENDIF}

begin
  fStackList.Clear;
  fErrorTime := Now;
  // Log unhandled exception stack info to ExceptionLogMemo
  fStackList.Add(E.Message);

  {$IFDEF VER150}
  Stack := JclGetExceptStackList(MainThreadID);
  try
    fStackList.Add('Exception Code: $-');
    Stack.AddToStrings(fStackList, True, True, True, True);
  finally
    FreeAndNil(Stack);
  end;
  {$ELSE}
  fStackList.Add(E.StackTrace);
  Inner := E.InnerException;
  while Inner <> nil do
  begin
    fStackList.Add(#13#10+Inner.Message);
    fStackList.Add(Inner.StackTrace);
    Inner := Inner.InnerException;
  end;
  {$ENDIF}
  //JclLastExceptStackListToStrings(fStackList, False, True, False, False);

  fErrorMessage := E.Message;
  {$IFDEF VER150}
  fErrorMessageEx := E.Message;
  {$ELSE}
  fErrorMessageEx := E.ToString;
  {$ENDIF}
  fErrorClassType := E.ClassType;
  fErrorCode := Copy(fStackList[1],pos('$',fStackList[1]),9);

  // Display default VCL unhandled exception dialog
  case fShowMethod of
  smSystem:
    case fApplicationType of
      atForms: {$IFDEF VER150}{$ELSE}Vcl.{$ENDIF}Forms.Application.ShowException(E);
      atServices: ;
    end;
  smDefault:
    ShowException(E);
  smExternal:
    if Assigned(fOnShowException) then
      fOnShowException(Self,E);
  smNone: ;
  end;

  if Assigned(fOnRegisteredError) then
    fOnRegisteredError(Self);
end;

function TExceptionMonitor.ExceptionToString(const AllInfo: boolean;
  const ShowFirstLineCallStack: integer): string;
var
  SL, ST: TStringList;
  i: integer;
  S: string;
begin
  Result := '';
  SL := TStringList.Create;
  try
    if AllInfo or (eeEventTime in fShowElements) then
      SL.Add('Event time: ' + DateTimeToStr(fErrorTime));
    case fApplicationType of
      atForms: S := {$IFDEF VER150}{$ELSE}Vcl.{$ENDIF}Forms.Application.Title;
      atServices: S := {$IFDEF VER150}{$ELSE}Vcl.{$ENDIF}SvcMgr.Application.Title;
    end;
    if AllInfo or (eeApplicationName in fShowElements) then
      SL.Add('Application: ' + S);
    if AllInfo or (eeExternalData in fShowElements) then
      SL.Add(fExternalData.Text);
    if AllInfo or (eeClassName in fShowElements) then
      SL.Add('Error ClassName: ' + fErrorClassType.ClassName);
    if AllInfo or (eeMessage in fShowElements) then
      SL.Add('Error Message: ' + fErrorMessage);
    if AllInfo or (eeErrorCode in fShowElements) then
      SL.Add('Error Code: ' + fErrorCode);
    if AllInfo or (eeMessageEx in fShowElements) then
    begin
      SL.Add('');
      SL.Add('All Messages: ');
      SL.Add(fErrorMessageEx);
    end;
    if AllInfo or (eeCallStack in fShowElements) then
    begin
      SL.Add('');
      SL.Add('Call Stack:');
      if AllInfo then
        SL.AddStrings(fStackList)
      else begin
        ST:=TStringList.Create;
        ST.Text := fStackList.Text;
        for i := 0 to ShowFirstLineCallStack-1 do
          SL.Add(ST[i]);
        ST.Free;
      end;
    end;
    Result := SL.Text;
  finally
    SL.Free;
  end;
end;

procedure TExceptionMonitor.RegistrationException(E: Exception);
begin
  DoException(Self,E);
end;

procedure TExceptionMonitor.SaveClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName := 'report.txt';
  with TSaveDialog.Create(Self) do
  begin
    FileName := sFileName;
    DefaultExt := '.txt';
    Filter := 'Text files|*.txt';
    if Execute then
    begin
      sFileName := FileName;
      SaveToFile(sFileName,True);
    end;
    Free;
  end;
end;

procedure TExceptionMonitor.SaveToFile(const AFileName: string; const Rewrite: boolean);
var
  {$IFDEF VER150}
  Stream: TStream;
  S: string;
  {$ELSE}
  SW: TStreamWriter;
  {$ENDIF}
begin
  {$IFDEF VER150}
  if not Rewrite and FileExists(AFileName) then
    Stream := TFileStream.Create(AFileName,fmOpenReadWrite)
  else
    Stream := TFileStream.Create(AFileName,fmCreate);
  Stream.Seek(0,soFromEnd);
  try
    S := ExceptionToString+#13#10;
    Stream.WriteBuffer(Pointer(S)^, Length(S));
  finally
    Stream.Free;
  end;
  {$ELSE}
  if Rewrite then
    SW := TFile.CreateText(AFileName)
  else
    SW := TFile.AppendText(AFileName);
  try
    SW.AutoFlush := true;
    SW.Write(ExceptionToString+#13#10);
  finally
    SW.Close;
    SW.Free;
  end;
  {$ENDIF}
end;

procedure TExceptionMonitor.SetApplicationEvents(const Value: TApplicationEvents);
begin
  if Value <> nil then
  begin
    fApplicationEvents := Value;
    fApplicationEvents.OnException := DoException;
    fInnerAppEvents.OnException := nil;
  end else begin
    if fApplicationEvents <> nil then
      fApplicationEvents.OnException := nil;
    fApplicationEvents := fInnerAppEvents;
    fInnerAppEvents.OnException := DoException;
  end;
end;

procedure TExceptionMonitor.SetFormBounds;
var
  i, n, cur, max: integer;
begin
  //autosize dialog
  max := 0;
  n := -1;
  for i := 0 to MessageBox.Lines.Count-1 do
  begin
    cur := Length(MessageBox.Lines[i]);
    if cur > max then
    begin
      max := cur;
      n := i;
    end;
  end;
  if n >= 0 then
  {$IFDEF VER150}
    max := round(1.5*(MessageBox.Owner as TForm).Canvas.TextWidth(MessageBox.Lines[n]));
  {$ELSE}
    max := (MessageBox.Owner as TForm).Canvas.TextWidth(MessageBox.Lines[n]);
  {$ENDIF}
  if MessageBoxWidth < max + 32 then
    cur := max + 32
  else
    cur := MessageBoxWidth;
  if Screen.WorkAreaWidth < cur then
    cur := Screen.WorkAreaWidth;
  (MessageBox.Owner as TForm).Width := FormWidth + cur - MessageBoxWidth;
  max := (MessageBox.Lines.Count + 2) * (MessageBox.Owner as TForm).Canvas.TextHeight(MessageBox.Lines[n]);
  if MessageBoxHeight < max  then
    cur := max
  else
    cur := MessageBoxWidth;
  if Screen.WorkAreaHeight < cur then
    cur := Screen.WorkAreaHeight - 2*(FormHeight - ButtonTop);
  (MessageBox.Owner as TForm).Height := FormHeight + cur - MessageBoxHeight;
end;

procedure TExceptionMonitor.ShowException(E: Exception);
const
  cHorizMargin = 12;
var
  Form: TForm;
  Control: TControl;
  Panel: TPanel;
  TabSet: TTabSet;
begin
  if fApplicationType = atServices then
    Exit;

  Form := TForm.Create(Application);
  with Form do
  begin
    BorderStyle := bsSizeable;
    BorderIcons := [biSystemMenu];
    Position := poScreenCenter;
    Width := FormWidth;
    Height := FormHeight;
    Caption := 'Error message - ' + {$IFDEF VER150}{$ELSE}Vcl.{$ENDIF}Forms.Application.Title;
    //button
    Control := TButton.Create(Form);
    Control.Left := (ClientWidth - Control.Width) div 2;
    ButtonTop := ClientHeight - Control.Height - 8;
    Control.Top := ButtonTop;
    (Control as TButton).ModalResult := mrOk;
    (Control as TButton).Caption := 'OK';
    (Control as TButton).Default := True;
    Control.Parent := Form;
    Control.Anchors := [akBottom];
    //save button
    Control := TButton.Create(Form);
    Control.Left := cHorizMargin;
    Control.Top := ButtonTop;
    (Control as TButton).ModalResult := mrNone;
    (Control as TButton).Caption := 'Save as ...';
    (Control as TButton).OnClick := SaveClick;
    Control.Parent := Form;
    Control.Anchors := [akLeft, akBottom];

    //panel
    Panel := TPanel.Create(Form);
    Panel.Parent := Form;
    Panel.Left := 0;
    Panel.Top := 0;
    {$IFDEF VER150}
    Panel.Height := ButtonTop - 30;
    {$ELSE}
    Panel.Height := ButtonTop - 12;
    {$ENDIF}
    Panel.Width := Width;
    Panel.Anchors := [akLeft,akTop,akRight,akBottom];
    //image
    Control := TImage.Create(Form);
    with Control as TImage do
    begin
      Name := 'Image';
      Parent := Panel;
      Picture.Icon.Handle := LoadIcon(0, IDI_HAND);
      Stretch := true;
      SetBounds(cHorizMargin, (Panel.Height - 32) div 2, 32, 32);
    end;
    //tabs
    TabSet := TTabSet.Create(Form);
    TabSet.Parent := Panel;
    TabSet.SetBounds(32+2*cHorizMargin, Panel.Height - TabSet.Height - 16,
                     Panel.ClientWidth - 32 - 2*cHorizMargin - 24, TabSet.Height);
    TabSet.Tabs.Add('Message');
    TabSet.Tabs.Add('Call Stack');
    TabSet.Anchors := [akLeft,akBottom,akRight];
    //message
    MessageBox := TRichEdit.Create(Form);
    MessageBox.Parent := Panel;
    MessageBox.Left := 32+2*cHorizMargin;;
    MessageBox.Top := 12; // TabSet.Top+TabSet.Height;
    MessageBox.Height := TabSet.Top - 12;
    MessageBox.Width := Panel.ClientWidth - 32 - 2*cHorizMargin - 24;
    MessageBox.ScrollBars := ssBoth;
    MessageBox.WordWrap := true;
    MessageBox.Color := clBtnFace;
    MessageBox.ReadOnly := true;
    MessageBox.Anchors := [akLeft,akTop,akRight,akBottom];

    MessageBoxWidth := MessageBox.Width;
    MessageBoxHeight := MessageBox.Height;

    TabSet.OnChange := TabSetChange;
    TabSet.TabIndex := 0;

    SetFormBounds;
    //show dialog
    ShowModal;
    Free;
  end;
end;

procedure TExceptionMonitor.TabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  case NewTab of
  0: begin
       MessageBox.Text := ExceptionToString(false);
     end;
  1: begin
       MessageBox.Text := fStackList.Text;
     end;
  end;
end;

initialization
  // Enable raw mode (default mode uses stack frames which aren't always generated by the compiler)
  Include(JclStackTrackingOptions, stRawMode);
  // Disable stack tracking in dynamically loaded modules (it makes stack tracking code a bit faster)
  Include(JclStackTrackingOptions, stStaticModuleList);
  Include(JclStackTrackingOptions, stExceptFrame);
  // Initialize Exception tracking
  JclStartExceptionTracking;
  ExceptionMonitor := TExceptionMonitor.Create(nil);

finalization
  ExceptionMonitor.Free;
  // Uninitialize Exception tracking
  JclStopExceptionTracking;
end.
