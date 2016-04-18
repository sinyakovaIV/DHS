unit uKernel;

interface

uses uIBConnect, {NRC_Logger,} Forms, SysUtils, dbfunc, IBX.IBDatabase,
  Vcl.ComCtrls, System.Classes, Vcl.StdCtrls, Variants,
  Winapi.ActiveX, ComObj, Vcl.OleServer;

type
  TKernel = class
  private
    fIBConnect: TIBConnect;
    // fLogger: TNRC_Logger;
    function Accompanist: TResultTable; // �, � �� ��� ��� ������...
  protected
    function CreateIBTransaction: TIBTransaction;
  public
    constructor Create;
    destructor Destroy; override;
    procedure FillingComboBox(const cmbName: TComboBox;
      const RTName: TResultTable; const FieldName: string;
      const Line_All: Boolean { true, ���� ����� ������ '���' } );
    procedure ChooseComboBoxItemIndex(const cmbName: TComboBox;
      const RTName: TResultTable; const FieldIsInteger: Boolean;
      { true, ���� ����� ������������� ������������� ���������� }
      const FieldIntOrStr: string; ExampleInt: integer = 0;
      ExampleStr: string = '');
    function MonthStr(NumMonth: integer): string;
    function CheckExcelInstalled(AValue: String): Boolean;
    function CheckExcelRun(AValue: String; var ADest: Variant): Boolean;

    { frmMain }
    function GetCurAcademicYear: TResultTable;
    function GetTimesheetMini(const in_weekday, in_pedagogue, in_academic_year,
      in_status: integer; state_on_day: string): TResultTable;
    procedure GetLVDetailTimesheet(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVClassicTS(const ListView: TListView; const RT: TResultTable);
    procedure GetLVByProgram(const ListView: TListView; const RT: TResultTable);
    procedure GetLVByLevel(const ListView: TListView; const RT: TResultTable); // �� ��� ��� ���! ���� ���������� ���
    procedure GetLVByGroupChild(const ListView: TListView;
      const RT: TResultTable);

    { frmChild }
    function SaveLearningChild(const Args: array of Variant): Boolean;
    function SaveChildAdditional(const Args: array of Variant): Boolean;
    function SaveChildStatistic(const Args: array of Variant): Boolean;
    function SaveParentAll(const Args: array of Variant): Boolean;
    function SaveParentContact(const Args: array of Variant): Boolean;
    function DeleteParentConact(const Args: array of Variant): Boolean;
    function GetStatusList(const aGroup: integer): TResultTable;
    function GetChildList(const inStatus: integer; const Mode: integer = -1;
      const aSearchText: string = ''): TResultTable;
    function GetEducationalOrgType: TResultTable;
    function GetChildAdditional(const inID: integer): TResultTable;
    function GetParentList(const inID: integer): TResultTable;
    function GetParentStatus(const aGroup: integer): TResultTable;
    function GetParentKind: TResultTable;
    function GetContactType: TResultTable;
    function GetParentContList(const inID: integer): TResultTable;
    procedure GetLVLearningChild(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVParent(const ListView: TListView; const RT: TResultTable);
    procedure GetLVContact(const ListView: TListView; const RT: TResultTable);
    function GetNewIDLearningChild(const IDChild, IDEducationalOrgType,
      LearningChildStatus: integer; Birthday, Surname, Name, Patronomic,
      Gender: string): TResultTable;

    { frmLearningGroupList � �������� }
    function SaveLearningGroup(const Args: array of Variant): Boolean;
    function SaveLearningGroupMembers(const Args: array of Variant): Boolean;
    function GetAcademicYear: TResultTable;
    function GetEducationProgram: TResultTable;
    function GetPedagogueSurnameNP: TResultTable;
    function GetStatusLearningGroup(const aGroup: integer): TResultTable;
    // �������� ������ ����� (����������� ���.) �� ���� �����������
    function GetLearningGroupList(const education_program, pedagogue,
      academic_year, learning_group_type, status: integer): TResultTable;
    function GetLearningForm: TResultTable;
    function GetLearningLevel: TResultTable;
    function GetAmountHours: TResultTable;
    procedure GetLVLearningGroup(const ListView: TListView;
      const RT: TResultTable);
    function GetYearBirth: TResultTable;
    function GetLearningGroupName(const education_program, pedagogue,
      academic_year, learning_group_type, status: integer): TResultTable;
    function GetChildListForGroupMember(const choose_mode, in_id_learning_group,
      year_birth: integer): TResultTable;
    function GetDistinctLGroupName(const learning_group_type, education_program
      : integer): TResultTable;
    // ������ ������� ���������� ������ ��� lvGroupMemberList � lvChildList
    procedure GetLVChildListForGroupMember(const ListView: TListView;
      const RT: TResultTable);
    function GetInOutOrderList(const in_id_academic_year, in_type: integer)
      : TResultTable; // ������� �� ����������/����������
    function DeleteGroupMember(const Args: array of Variant): Boolean;
    function DeleteGroup(const Args: array of Variant): Boolean;
    procedure GetLVGroupMember(const ListView: TListView;
      const RT: TResultTable);
    function GetIDSmallLearnGroup(const IDLearningGroup, idLearningForm,
      idEducationProgram, idPedagogue, idLearningLevel, idAcademicYear,
      idStatusLearningGroup, AmountHours: integer; Gname: string): TResultTable;
    function GetSmallGroupMember(const in_id_education_program, in_id_pedagogue,
      in_id_academic_year: integer): TResultTable;
    procedure GetLVSmallLearningGroup(const ListView: TListView;
      const RT: TResultTable);
    function UpdateSmallGroupName(const Args: array of Variant): Boolean;
    function GetSmallLearnGrName(const in_id_learning_group: integer)
      : TResultTable { ���� ���������� �������� ������, ����� �� ��������: (����� ����� ���� ������)
      GET_SMALL_GROUP_NAME - �� ��������� ��������� GROUP_NAME (������� - IN_ID ������) };
    function GetSurnameNLearningChild(const in_id_learning_child: integer)
      : TResultTable { ����� ����� ����� ���� ������, ������� ������ �� ��������:
      GET_SURNAME_N_LEARNING_CHILD
      �������_� ������� ����� ������ � �������� ��������� SURNAME_N, (������� - ID �������) };
    function GetSurnameNLearningChildsFromSmallLearningGroup
      (const in_id_learning_group: integer): TResultTable;

    { frmPedagogueClass }
    function GetChildListForClassMemberByAcademicYear
      (const in_id_education_program, in_id_pedagogue, in_id_academic_year
      : integer): TResultTable;
    function GetChildListForClassMemberByYearBirth(const year_birth: integer)
      : TResultTable;
    function GetChildListClassMember(const in_id_education_program,
      in_id_pedagogue, in_id_academic_year: integer): TResultTable;
    procedure GetLVChildListClassMember(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVChildListClassMemberForEdit(const ListView: TListView;
      const RT: TResultTable);
    // procedure GetLVChildListForClassMemberByYearBirth (const ListView: TListView;
    // const RT: TResultTable); ��� ������� ���������� procedure GetLVChildListForGroupMember
    function SavePedagogueClassMember(const Args: array of Variant): Boolean;

    { frmTimesheet }
    function GetWeekday: TResultTable;
    // �������� RTGroupChildList �� function GetLearningGroupList
    procedure GetLVGroupChildListForTimesheet(const ListView: TListView;
      const RT: TResultTable);
    function GetOrderListForTimesheet(const in_id_academic_year: integer)
      : TResultTable; // ������ �� ���������/����������� ����
    function GetTimesheetGrid(const tag, hour_day: integer): TResultTable;
    function GetStudyRoom: TResultTable;
    function GetAccompanist: TResultTable;
    // �������� ��������� ���������� �� ��� ������ �����
    function GetTimeSheetList(const in_weekday, in_learning_group,
      in_study_room, in_pedagogue, in_academic_year, in_status: integer;
      state_on_day: string): TResultTable;
    procedure GetLVTimesheetList(const ListView: TListView;
      const RT: TResultTable);
    function SaveTimesheet(const Args: array of Variant): Boolean;
    function UpdateTimesheet(const Args: array of Variant): Boolean;
    function DeleteTimesheet(const Args: array of Variant): Boolean;

    { fOrders }
    function SaveOrder(const Args: array of Variant): Boolean;
    function GetOrders(const in_type, academic_year, status: integer)
      : TResultTable;
    function GetStatusOrders(const aGroup: integer): TResultTable;
    function GetOrderType: TResultTable;
    procedure GetLVOrders(const ListView: TListView; const RT: TResultTable);

    { fSickLeave }
    function GetSickLeave(const id_pedagogue, id_academic_year: integer)
      : TResultTable;
    procedure GetLVSickLeave(const ListView: TListView; const RT: TResultTable);
    function SaveSickLeave(const Args: array of Variant): Boolean;
    function DeleteSickLeave(const Args: array of Variant): Boolean;

    { Trips }
    function GetOrdersTrip(const id_academic_year: integer): TResultTable;
    procedure GetLVPedagogue(const ListView: TListView; const RT: TResultTable);
    procedure GetLVPedagogueTrips(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVChildTrips(const ListView: TListView;
      const RT: TResultTable);
    function SavePedagogueTrip(const Args: array of Variant): Boolean;
    function SaveChildTrip(const Args: array of Variant): Boolean;
    function GetPedagogueTrips(const id_order: integer): TResultTable;
    function GetChildTrips(const id_order: integer): TResultTable;
    function DeletePedagogueTrip(const Args: array of Variant): Boolean;
    function DeleteChildTrip(const Args: array of Variant): Boolean;

    { Journal }
    function GetLGNameLastLesson(const id_pedagogue, id_academic_year: integer)
      : TResultTable;
    procedure GetLVGropeNameLastLesson(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVPedagogueList(const ListView: TListView;
      const RT: TResultTable);
    function GetLessonStatus(const aGroup: integer): TResultTable;
    function GetTimesheetForGroup(const id_learning_group, id_academic_year
      : integer): TResultTable;
    function SaveJournalForPeriod(const Args: array of Variant): Boolean;
    function GetCollectiveJournal(const id_pedagogue, id_academic_year,
      number_mouth: integer): TResultTable;
    procedure GetLVCollectiveJournal(const ListView: TListView;
      const RT: TResultTable);
    function GetIndividualJournal(const id_learning_group,
      number_mouth: integer): TResultTable;
    procedure GetLVIndividualJournal(const ListView: TListView;
      const RT: TResultTable);
    function UpdateJournal(const Args: array of Variant): Boolean;

    { ������ }
    // ����� �������� REPORTING_DATE - ������� ���� ������
    function GetAge(const id_pedagogue, id_academic_year,
      in_id_program: integer; const reporting_day: string): TResultTable;
    function GetCountProgram(const in_id_pedagogue, in_id_academic_year
      : integer): TResultTable;
    function GetAgeStructure(const in_id_pedagogue, in_id_academic_year,
      in_id_program: integer; const reporting_date, in_gender: string)
      : TResultTable;
    procedure GetLVGroupNames(const ListView: TListView;
      const RT: TResultTable);
    { ����� ���������� }
    function GetVolumeRealByMonthPed(const in_id_pedagogue, in_id_academic_year,
      in_id_program, month_number: integer): TResultTable;
    procedure GetLVPedagogueByMonth1(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealByProgrMonthPed(const in_id_pedagogue,
      in_id_academic_year, month_number: integer): TResultTable;
    procedure GetLVPedagogueByMonth2(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealDhsByMonth(const in_id_academic_year, in_id_program,
      month_number: integer): TResultTable;
    procedure GetLVdhsByMonth1(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealDhsByProgrMonth(const in_id_academic_year,
      month_number: integer): TResultTable;
    procedure GetLVdhsByProgrMonth2(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealBySemesterPed(const in_id_pedagogue, in_id_academic_year,
      in_id_program, last_month_semester: integer): TResultTable;
    procedure GetLVPedagogueBySemester1(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVPedagogueBySemesterII1(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealByProgrSemesterPed(const in_id_pedagogue, in_id_academic_year,
      last_month_semester: integer): TResultTable;
    procedure GetLVPedagogueBySemester2(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVPedagogueBySemesterII2(const ListView: TListView;
      const RT: TResultTable);
    function GetVolumeRealByPedSemesterDHS(const in_id_pedagogue, in_id_academic_year,
      last_month_semester: integer): TResultTable;
    procedure GetLVByPedSemesterDHS(const ListView: TListView;
      const RT: TResultTable);
    procedure GetLVByPedSemesterIIDHS(const ListView: TListView;
      const RT: TResultTable);

    function GetChildData(const in_id_program, in_id_pedagogue,
      in_id_academic_year, in_id_learning_group: integer): TResultTable;
    procedure GetLVChildData(const ListView: TListView; const RT: TResultTable);
    procedure GetLVDetailTimesheetList(const ListView: TListView; const RT: TResultTable);

    {ContingentSafety}
    function GetChildListForContingent(const in_id_pedagogue,
      in_id_academic_year, in_id_education_program, in_id_learning_level,
      in_status: integer): TResultTable;
    procedure GetLVContingentInList(const ListView: TListView; const RT: TResultTable);
    procedure GetLVContingentOut(const ListView: TListView; const RT: TResultTable);
    function GetActualContingent(const in_id_pedagogue, in_id_academic_year,
    in_id_education_program: integer): TResultTable;
    procedure GetLVActualContingent(const ListView: TListView; const RT: TResultTable);
    function GetActualContingentOut(const in_id_pedagogue, in_id_academic_year,
    in_id_education_program: integer): TResultTable;
    procedure GetLVActualContingentOut(const ListView: TListView; const RT: TResultTable);

    function GetPsnpForAutorization: TResultTable;
    function GetNonWorkDay(const id_academic_year: integer): TResultTable;
    procedure GetLVNonWorkDay(const ListView: TListView;
      const RT: TResultTable);
    function SaveNonWorkDay(const Args: array of Variant): Boolean;
    function DeleteNonWorkDay(const Args: array of Variant): Boolean;
    // procedure OnLog(Sender: TObject; const Msg: string);
    property IBConnect: TIBConnect read fIBConnect;
    // property Logger: TNRC_Logger read fLogger;
  end;

var
  Kernel: TKernel;

implementation

{ TKernel }

function TKernel.Accompanist: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_ACCOMPANIST', []);
end;

function TKernel.CheckExcelInstalled(AValue: String): Boolean;
var
  FCLSID: TCLSID;
begin
  Result := (CLSIDFromProgID(PChar(AValue), FCLSID) = S_OK);
end;

function TKernel.CheckExcelRun(AValue: String; var ADest: Variant): Boolean;
begin
  try
    ADest := GetActiveOleObject(AValue);
    Result := true;
  except
    Result := false;
  end;
end;

procedure TKernel.ChooseComboBoxItemIndex(const cmbName: TComboBox;
  const RTName: TResultTable;
  // ������: ��������� cb ����� �� ��������� ����, ������� �������� ��������� ��� ������������� ��������
  const FieldIsInteger: Boolean;
  // ����� ���������� �������� ����, �� �������� ��������� cb
  const FieldIntOrStr: string;
  // �������� ����-�������: ������������� ��� ������� (���� ����� ������ ������ �������������� ��������, ������ ��� �� �������� �������, ����� ������ ��������� 0)
  ExampleInt: integer; ExampleStr: string);
var
  i, n: integer;
begin
  n := 0;
  if cmbName.Items[0] = '���' then
    n := 1;
  for i := 0 to RTName.Count - 1 do
    case FieldIsInteger of
      true:
        if RTName[i].ValueByName(FieldIntOrStr) = ExampleInt then
          cmbName.ItemIndex := i + n;
      false:
        if RTName[i].ValueStrByName(FieldIntOrStr) = ExampleStr then
          cmbName.ItemIndex := i + n;
    end;
end;

constructor TKernel.Create;
begin
  fIBConnect := TIBConnect.Create;
  // fLogger := TNRC_Logger.Create(nil);
  // with fLogger do
  // begin
  // ProgramName := '������� ������� ������';
  // LogFileMode := lmClear;
  // MaxCount := 3;
  // FileName := ChangeFileExt(Application.ExeName, '.log');
  // Active := True;
  // end;
  // fIBConnect.OnLog := OnLog;
end;

function TKernel.CreateIBTransaction: TIBTransaction;
begin
  Result := TIBTransaction.Create(nil);
  with Result do
  begin
    AutoStopAction := saCommit;
    AddDatabase(fIBConnect.Database);
    DefaultDatabase := fIBConnect.Database;
  end;
end;

function TKernel.DeleteChildTrip(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from LST_TRIP_LEARNING_GHILD where ID = :1', Args);
  finally
    IBTrans.Free;
  end;

end;

function TKernel.DeleteGroup(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  // TODO: ��������� �������� ������, ���� � ��� ����� ���� ��������� ���� � ��������� ����������
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from WT_LEARNING_GROUP where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeleteGroupMember(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from LST_LEARNING_GROUP_MEMBERS where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeleteNonWorkDay(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from LST_NON_WORKING_DAY where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeleteParentConact(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from lst_parent_contact where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeletePedagogueTrip(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from LST_TRIP_PEDAGOGUE where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeleteSickLeave(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from LST_SICK_LEAVE where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.DeleteTimesheet(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'delete from WT_TIMESHEET where ID = :1', Args);
  finally
    IBTrans.Free;
  end;
end;

destructor TKernel.Destroy;
begin
  fIBConnect.Free;
  // fLogger.Free;
  inherited;
end;

procedure TKernel.FillingComboBox(const cmbName: TComboBox;
  const RTName: TResultTable; const FieldName: string; const Line_All: Boolean);
var
  i, n: integer;
begin
  n := 0;
  with cmbName do
  begin
    Clear;
    if Line_All then
    begin
      Items.Add('���');
      n := 1;
    end;
    if Assigned(RTName) then
      for i := 0 to RTName.Count - 1 do
        Items.Add(RTName[i].ValueStrByName(FieldName));
    if Assigned(RTName) then
    begin
      n := n + RTName.Count;
    end;
    DropDownCount := n;
  end;
end;

// ��������� ������� �������� TResultTable � ������� �� ������� WT_LEARNING_CHILD
function TKernel.GetAcademicYear: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from wt_academic_year', []);
end;

function TKernel.GetAccompanist: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_ACCOMPANIST', []);
end;

function TKernel.GetActualContingent(const in_id_pedagogue, in_id_academic_year,
  in_id_education_program: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CONTINGENT_ACTUAL(:1,:2,:3) order by DATE_IN, SURNAME_N_',
    [in_id_pedagogue, in_id_academic_year, in_id_education_program]);
end;

function TKernel.GetActualContingentOut(const in_id_pedagogue,
  in_id_academic_year, in_id_education_program: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CONTINGENT_ACTUAL_OUT(:1,:2,:3) order by DATE_OUT, SURNAME_N_',
    [in_id_pedagogue, in_id_academic_year, in_id_education_program]);
end;

function TKernel.GetAge(const id_pedagogue, id_academic_year,
  in_id_program: integer; const reporting_day: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_AGE(:1,:2,:3, :4) order by AGE',
    [id_pedagogue, id_academic_year, in_id_program, reporting_day]);
  // � ���� � ����������� RT �� ��������� ��� ����, ��� ��� ��� ����?....
end;

function TKernel.GetAgeStructure(const in_id_pedagogue, in_id_academic_year,
  in_id_program: integer; const reporting_date, in_gender: string)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_AGE_STRUCTURE(:1,:2,:3,:4,:5)',
    [in_id_pedagogue, in_id_academic_year, in_id_program, reporting_date,
    in_gender]);
end;

function TKernel.GetAmountHours: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_amount_learning_hours order by week_amount', []);
end;

function TKernel.GetChildAdditional(const inID: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_learning_child_additional(:in_id)', [inID]);
end;

function TKernel.GetChildData(const in_id_program, in_id_pedagogue,
  in_id_academic_year, in_id_learning_group: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CHILD_DATA_FOR_JOURNAL (:1,:2,:3,:4) order by SURNAME_NAME_',
    [in_id_program, in_id_pedagogue, in_id_academic_year,
    in_id_learning_group]);
end;

function TKernel.GetChildList(const inStatus: integer; const Mode: integer;
  const aSearchText: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_learning_child(:in_status,:mode,:search_text) order by surname, name, birthday',
    [inStatus, Mode, aSearchText]);
end;

function TKernel.GetChildListClassMember(const in_id_education_program,
  in_id_pedagogue, in_id_academic_year: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CHILD_LIST_CLASS_MEMBER (:1,:2,:3) order by ACADEMIC_YEAR, EDUCATION_PROGRAM, LEARNING_LEVEL, SURNAME_NAME, DATE_IN',
    [in_id_education_program, in_id_pedagogue, in_id_academic_year]);
end;

function TKernel.GetChildListForClassMemberByAcademicYear
  (const in_id_education_program, in_id_pedagogue, in_id_academic_year: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_LIST_CLASS_BY_ACADEMIC_YEAR (:1,:2,:3) order by SURNAME_NAME, BIRTHDAY',
    [in_id_education_program, in_id_pedagogue, in_id_academic_year]);
end;

function TKernel.GetChildListForClassMemberByYearBirth(const year_birth
  : integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_LIST_CLASS_BY_YEAR_BIRTH (:1) order by SURNAME_NAME, BIRTHDAY',
    [year_birth]);
end;

function TKernel.GetChildListForContingent(const in_id_pedagogue,
  in_id_academic_year, in_id_education_program, in_id_learning_level,
  in_status: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CONTINGENT_CHILD_LIST (:1,:2,:3,:4,:5) order by EDUCATION_PROGRAM, LEARNING_LEVEL, SURNAME_N_',
    [in_id_pedagogue, in_id_academic_year, in_id_education_program,
    in_id_learning_level, in_status]);
end;

function TKernel.GetChildListForGroupMember(const choose_mode,
  in_id_learning_group, year_birth: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_child_list_for_group_member (:1,:2,:3) order by SURNAME_NAME, DATE_IN',
    [choose_mode, in_id_learning_group, year_birth]);
  // choose_mode - ���� 0, �� ������ ����� ����������� �� ������������ ������
  // ����� ������ ����������� �� ���� ��������
end;

function TKernel.GetChildTrips(const id_order: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CHILD_TRIP (:1) order by ID_OUT', [id_order]);
end;

function TKernel.GetCollectiveJournal(const id_pedagogue, id_academic_year,
  number_mouth: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_COLLECTIVE_JOURNAL (:1, :2, :3) order by PROGRAM_SHORT_NAME, NAME_LG', // ��������� ������� ����������!!!!!!!!
    [id_pedagogue, id_academic_year, number_mouth]);
end;

function TKernel.GetContactType: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_contact_type', []);
end;

function TKernel.GetCountProgram(const in_id_pedagogue, in_id_academic_year
  : integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_DISTINCT_PROGR_BY_YEAR_PED (:1, :2)',
    [in_id_pedagogue, in_id_academic_year]);
end;

function TKernel.GetCurAcademicYear: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_CURRENT_ACADEMIC_YEAR', []);
end;

function TKernel.GetDistinctLGroupName(const learning_group_type,
  education_program: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_DISTINCT_LGROUP_NAME (:1, :2)',
    [learning_group_type, education_program]);
end;

function TKernel.GetEducationalOrgType: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_educational_org_type', []);
end;

function TKernel.GetEducationProgram: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_education_program', []);
end;

function TKernel.GetIDSmallLearnGroup(const IDLearningGroup, idLearningForm,
  idEducationProgram, idPedagogue, idLearningLevel, idAcademicYear,
  idStatusLearningGroup, AmountHours: integer; Gname: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from SAVE_LEARNING_GROUP (:1,:2,:3,:4,:5,:6,:7,:8,:9)',
    [IDLearningGroup, idLearningForm, idEducationProgram, idPedagogue,
    idLearningLevel, idAcademicYear, idStatusLearningGroup,
    AmountHours, Gname]);
end;

function TKernel.GetIndividualJournal(const id_learning_group,
  number_mouth: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_INDIVIDUAL_JOURNAL (:1, :2) order by LESSON_DATE',
    [id_learning_group, number_mouth]);
end;

function TKernel.GetInOutOrderList(const in_id_academic_year, in_type: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_ORDERS_LIST_IN_OUT (:1, :2) order by date_ord desc ',
    [in_id_academic_year, in_type]);
  // in_type - 1, �� ���������� � ����������/����������
  // in_type - 2, �� ���������� � ����������/����������
end;

// ��������� �������� ������ �� TResultTable � ListView
procedure TKernel.GetLVLearningChild(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear; // � ��� ���� ������ ������?
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('surname');
      // ������������ ����� ValueByName, �� ��� � ��������� � string ��������: ���� � ���� ����� Null, �� ��������� ������ �����������, ������� �������� ���� variant �������������� "��������" � string
      SubItems.Add(RT[i].ValueStrByName('name'));
      SubItems.Add(RT[i].ValueStrByName('birthday'));
      // ������� ��� SubItems �� ��������, ����� �� ���� ���������� �����������
      SubItems.Add(RT[i].ValueStrByName('STATUS'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVLearningGroup(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('NAME');
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('ACADEMIC_YEAR'));
      // SubItems.Add(RT[i].ValueStrByName('LEARNING_GROUP_TYPE'));
      SubItems.Add(RT[i].ValueStrByName('STATUS_GROUP'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVNonWorkDay(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('DATE_NON_WORK_DAY'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVOrders(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('ACADEMIC_YEAR');
      SubItems.Add(RT[i].ValueStrByName('NAMBER_ORDER'));
      SubItems.Add(RT[i].ValueStrByName('DATE_ORDER'));
      SubItems.Add(RT[i].ValueStrByName('TYPE_ORDER'));
      SubItems.Add(RT[i].ValueStrByName('DATE_EVENT'));
      SubItems.Add(RT[i].ValueStrByName('DATE_ENDING'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVParent(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('surname');
      SubItems.Add(RT[i].ValueStrByName('name'));
      SubItems.Add(RT[i].ValueStrByName('patronomic'));
      SubItems.Add(RT[i].ValueStrByName('parent_status_name'));
      // if RT[i].ValueByName('parent_kind') = 1 then
      // SubItems.Add; // ����� ����������� ��� ��������� ������ �������������� �������� � ������...
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogue(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueByMonth1(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('GROUP_NAME'));
      SubItems.Add(RT[i].ValueStrByName('SHORT_NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('AMOUNT_WEEK'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueByMonth2(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
  // count_hours: integer;
  // percent: single;
  count_hours: Variant;
  percent: Variant;
begin
  count_hours := 0;
  percent := 0;
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('NAME_PROGRAM_'));
      SubItems.Add(RT[i].ValueStrByName('AMOUNT_WEEK_'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_HOURS_'));  // ��� ���� �� ��������� �� �����
      SubItems.Add(RT[i].ValueStrByName('PERCENT_'));
      // if not VarIsNull(RT[i].ValueByName('COUNT_HOURS_')) then
      // count_hours := count_hours + RT[i].ValueByName('COUNT_HOURS_');
      // if not VarIsNull(RT[i].ValueByName('PERCENT_')) then
      // percent := percent + RT[i].ValueByName('PERCENT_')
    end;
  // percent := percent * 100 / RT.Count;
  // with ListView.Items.Add do
  // begin
  // SubItems.Add('��� ���������');
  // SubItems.Add(IntToStr(count_hours));
  // SubItems.Add(FloatToStrF(percent, ffFixed, 5, 2));
  // end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueBySemester1(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('GROUP_NAME'));
      SubItems.Add(RT[i].ValueStrByName('SHORT_NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_09'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_09'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_10'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_10'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_11'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_11'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_12'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_12'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_1'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_1'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueBySemester2(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_09_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_09_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_10_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_10_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_11_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_11_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_12_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_12_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_1_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_1_ALL_GR'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueBySemesterII1(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('GROUP_NAME'));
      SubItems.Add(RT[i].ValueStrByName('SHORT_NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_01'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_01'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_02'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_02'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_03'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_03'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_04'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_04'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_05'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_05'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_2'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_2'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueBySemesterII2(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_01_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_01_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_02_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_02_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_03_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_03_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_04_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_04_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_05_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_05_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_2_ALL_GR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_2_ALL_GR'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueList(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVPedagogueTrips(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVSickLeave(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('ACADEMIC_YEAR');
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('DATE_BEGINING'));
      SubItems.Add(RT[i].ValueStrByName('DATE_ENDING'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVSmallLearningGroup(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('NAME');
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('ACADEMIC_YEAR'));
      // SubItems.Add(RT[i].ValueStrByName('LEARNING_GROUP_TYPE'));
      SubItems.Add(RT[i].ValueStrByName('STATUS_GROUP'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVTimesheetList(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('WEEKDAY_NAME');
      SubItems.Add(RT[i].ValueStrByName('LESSON_BEGIN_END'));
      SubItems.Add(RT[i].ValueStrByName('NAME_GROUP_CHILD'));
      SubItems.Add(RT[i].ValueStrByName('date_event'));
      SubItems.Add(RT[i].ValueStrByName('DATE_END'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('PROGRAM_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('STATUS_STR'));
      SubItems.Add(RT[i].ValueStrByName('NUMBER_STUDY_ROOM'));
      SubItems.Add(RT[i].ValueStrByName('ACCOMPANIST'));
    end;
  ListView.Items.EndUpdate;
end;

function TKernel.GetNewIDLearningChild(const IDChild, IDEducationalOrgType,
  LearningChildStatus: integer; Birthday, Surname, Name, Patronomic,
  Gender: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from SAVE_LEARNING_CHILD(:1,:2,:3,:4,:5,:6,:7,:8)',
    [IDChild, IDEducationalOrgType, LearningChildStatus, Birthday, Surname,
    Name, Patronomic, Gender]);
end;

function TKernel.GetNonWorkDay(const id_academic_year: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from LST_NON_WORKING_DAY where ID_ACADEMIC_YEAR = :1 order by DATE_NON_WORK_DAY',
    [id_academic_year]);
end;

// function TKernel.GetIDSmallLearnGroup(const IDLearningGroup, idLearningForm,
// idEducationProgram, idPedagogue, idLearningLevel, idAcademicYear,
// idStatusLearningGroup, AmountHours: integer; Gname: string): TResultTable;
// begin
// Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
// 'select * from SAVE_LEARNING_GROUP (:1,:2,:3,:4,:5,:6,:7,:8,:9)',
// [IDLearningGroup, idLearningForm, idEducationProgram, idPedagogue,
// idLearningLevel, idAcademicYear, idStatusLearningGroup,
// AmountHours, Gname]);
// end;

function TKernel.GetOrderListForTimesheet(const in_id_academic_year: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_ORDERS_LIST_TIMESHEET (:1) order by date_event',
    [in_id_academic_year]);
end;

function TKernel.GetOrders(const in_type, academic_year, status: integer)
  : TResultTable;
begin
  // TODO: �������� ����� ����������� ���������� �� ����, ����, �������
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select *from get_orders (:1, :2, :3) order by academic_year, date_order',
    [in_type, academic_year, status]);
end;

function TKernel.GetOrdersTrip(const id_academic_year: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_ORDERS_TRIP (:1) order by NUMBER_DATE',
    [id_academic_year]);
end;

function TKernel.GetOrderType: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from CT_ORDERS_TYPE', []);
end;

function TKernel.GetLearningForm: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_learning_group_type', []);
end;

function TKernel.GetLearningGroupList(const education_program, pedagogue,
  academic_year, learning_group_type, status: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_learning_group (:1, :2, :3, :4, :5 ) order by academic_year, education_program, surnamenp',//, learning_level',
    [education_program, pedagogue, academic_year, learning_group_type, status]);
end;

function TKernel.GetLearningGroupName(const education_program, pedagogue,
  academic_year, learning_group_type, status: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_learning_group_name (:1, :2, :3, :4, :5 ) order by L_G_NAME',
    [education_program, pedagogue, academic_year, learning_group_type, status]);
end;

function TKernel.GetLearningLevel: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_learning_level', []);
end;

function TKernel.GetLessonStatus(const aGroup: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_status where group_code = :1', [aGroup]);
end;

function TKernel.GetLGNameLastLesson(const id_pedagogue, id_academic_year
  : integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_LG_NAME_LAST_LESSON (:1, :2) order by PROGRAM_SHORT_NAME, L_G_NAME',
    [id_pedagogue, id_academic_year]);
end;

procedure TKernel.GetLVActualContingent(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_N_'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVActualContingentOut(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_N_'));
      SubItems.Add(RT[i].ValueStrByName('DATE_OUT'));
      SubItems.Add(RT[i].ValueStrByName('education_program_short_name'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVByGroupChild(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('NAME');
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_GROUP_TYPE'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVByLevel(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('����');
      SubItems.Add(RT[i].ValueStrByName('����'));

    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVByPedSemesterDHS(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('OUT_PED_SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_09_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_09_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_10_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_10_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_11_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_11_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_12_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_12_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_1_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_1_ALL_PR'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVByPedSemesterIIDHS(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('OUT_PED_SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_01_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_01_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_02_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_02_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_03_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_03_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_04_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_04_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_MONTH_05_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_MONTH_05_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_SEMESTER_2_ALL_PR'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_SEMESTER_2_ALL_PR'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVByProgram(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('����');
      SubItems.Add(RT[i].ValueStrByName('����'));

    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVChildData(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NAME_'));
      SubItems.Add(RT[i].ValueStrByName('AGE'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVChildListClassMember(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NAME'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NP'));
      SubItems.Add(RT[i].ValueStrByName('ACADEMIC_YEAR'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
      SubItems.Add(RT[i].ValueStrByName('DATE_OUT'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVChildListClassMemberForEdit(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NAME'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
      SubItems.Add(RT[i].ValueStrByName('DATE_OUT'));
    end;
  ListView.Items.EndUpdate;

end;

procedure TKernel.GetLVChildListForGroupMember(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NAME'));
      SubItems.Add(RT[i].ValueStrByName('BIRTHDAY'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVChildTrips(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_N'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVClassicTS(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('TIME_LESSON');
      SubItems.Add(RT[i].ValueStrByName('NAME_GROUP_CHILD'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('SHORT_NAME_PROG'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVCollectiveJournal(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('NAME_LG'));
      SubItems.Add(RT[i].ValueStrByName('PROGRAM_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('L_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('D_1'));
      SubItems.Add(RT[i].ValueStrByName('D_2'));
      SubItems.Add(RT[i].ValueStrByName('D_3'));
      SubItems.Add(RT[i].ValueStrByName('D_4'));
      SubItems.Add(RT[i].ValueStrByName('D_5'));
      SubItems.Add(RT[i].ValueStrByName('D_6'));
      SubItems.Add(RT[i].ValueStrByName('D_7'));
      SubItems.Add(RT[i].ValueStrByName('D_8'));
      SubItems.Add(RT[i].ValueStrByName('D_9'));
      SubItems.Add(RT[i].ValueStrByName('D_10'));
      SubItems.Add(RT[i].ValueStrByName('D_11'));
      SubItems.Add(RT[i].ValueStrByName('D_12'));
      SubItems.Add(RT[i].ValueStrByName('D_13'));
      SubItems.Add(RT[i].ValueStrByName('D_14'));
      SubItems.Add(RT[i].ValueStrByName('D_15'));
      SubItems.Add(RT[i].ValueStrByName('D_16'));
      SubItems.Add(RT[i].ValueStrByName('D_17'));
      SubItems.Add(RT[i].ValueStrByName('D_18'));
      SubItems.Add(RT[i].ValueStrByName('D_19'));
      SubItems.Add(RT[i].ValueStrByName('D_20'));
      SubItems.Add(RT[i].ValueStrByName('D_21'));
      SubItems.Add(RT[i].ValueStrByName('D_22'));
      SubItems.Add(RT[i].ValueStrByName('D_23'));
      SubItems.Add(RT[i].ValueStrByName('D_24'));
      SubItems.Add(RT[i].ValueStrByName('D_25'));
      SubItems.Add(RT[i].ValueStrByName('D_26'));
      SubItems.Add(RT[i].ValueStrByName('D_27'));
      SubItems.Add(RT[i].ValueStrByName('D_28'));
      SubItems.Add(RT[i].ValueStrByName('D_29'));
      SubItems.Add(RT[i].ValueStrByName('D_30'));
      SubItems.Add(RT[i].ValueStrByName('D_31'));
      SubItems.Add(RT[i].ValueStrByName('SUM_'));
      // if RT[i].ValueByName('parent_kind') = 1 then
      // SubItems.Add; // ����� ����������� ��� ��������� �������� � ������...
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVContact(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('contact_value');
      SubItems.Add(RT[i].ValueStrByName('contact_type'));
      // if RT[i].ValueByName('parent_kind') = 1 then
      // SubItems.Add; // ����� ����������� ��� ��������� �������� � ������...
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVContingentInList(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_N_'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVContingentOut(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_N_'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
      SubItems.Add(RT[i].ValueStrByName('DATE_OUT'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVDetailTimesheet(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('WEEKDAY_NAME');
      SubItems.Add(RT[i].ValueStrByName('LESSON_BEGIN_END'));
      SubItems.Add(RT[i].ValueStrByName('NAME_GROUP_CHILD'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('NUMBER_STUDY_ROOM'));
      SubItems.Add(RT[i].ValueStrByName('EDUCATION_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('ACCOMPANIST'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVDetailTimesheetList(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('WEEKDAY_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('LESSON_BEGIN_END'));
      SubItems.Add(RT[i].ValueStrByName('NAME_GROUP_CHILD'));
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('PROGRAM_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('date_event'));
      SubItems.Add(RT[i].ValueStrByName('DATE_END'));
      SubItems.Add(RT[i].ValueStrByName('NUMBER_STUDY_ROOM'));
      SubItems.Add(RT[i].ValueStrByName('ACCOMPANIST'));
      SubItems.Add(RT[i].ValueStrByName('STATUS_STR'));

    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVdhsByMonth1(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAMENP'));
      SubItems.Add(RT[i].ValueStrByName('SHORT_NAME_PROGRAM'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_HOURS'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVdhsByProgrMonth2(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('NAME_PROGRAM_'));
      SubItems.Add(RT[i].ValueStrByName('COUNT_HOURS_'));
      SubItems.Add(RT[i].ValueStrByName('PERCENT_'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVGropeNameLastLesson(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('L_G_NAME'));
      SubItems.Add(RT[i].ValueStrByName('PROGRAM_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('DATE_LAST_LESSON'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVGroupChildListForTimesheet(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := RT[i].ValueStrByName('NAME');
      SubItems.Add(RT[i].ValueStrByName('LEARNING_LEVEL'));
      SubItems.Add(RT[i].ValueStrByName('PROGRAM_SHORT_NAME'));
      SubItems.Add(RT[i].ValueStrByName('WEEK_AMOUNT_HOURS'));
    end;
  ListView.Items.EndUpdate;

end;

procedure TKernel.GetLVGroupMember(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('SURNAME_NAME'));
      SubItems.Add(RT[i].ValueStrByName('DATE_IN'));
      SubItems.Add(RT[i].ValueStrByName('DATE_OUT'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVGroupNames(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(RT[i].ValueStrByName('L_G_NAME'));
      // SubItems.Add(RT[i].ValueStrByName('HOUR_AMOUNT'));
      // SubItems.Add(RT[i].ValueStrByName('NUMBER_THEME'));
      // SubItems.Add(RT[i].ValueStrByName('NOTE_THEME'));
    end;
  ListView.Items.EndUpdate;
end;

procedure TKernel.GetLVIndividualJournal(const ListView: TListView;
  const RT: TResultTable);
var
  i: integer;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  for i := 0 to RT.Count - 1 do
    with ListView.Items.Add do
    begin
      // Caption := IntToStr(i + 1);
      Caption := RT[i].ValueStrByName('LESSON_DATE');
      SubItems.Add(RT[i].ValueStrByName('DAY_WEEK'));
      SubItems.Add(RT[i].ValueStrByName('HOUR_AMOUNT'));
      SubItems.Add(RT[i].ValueStrByName('NUMBER_THEME'));
      SubItems.Add(RT[i].ValueStrByName('NOTE_THEME'));
    end;
  ListView.Items.EndUpdate;

end;

function TKernel.GetParentList(const inID: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_parent (:in_id) order by parent_kind', [inID]);
end;

function TKernel.GetParentContList(const inID: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_parent_contact (:in_id) order by id_contact_type', [inID]
    );
end;

function TKernel.GetParentKind: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_parent_status', []);
end;

function TKernel.GetParentStatus(const aGroup: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_status where group_code = :1', [aGroup]);
end;

function TKernel.GetPedagogueSurnameNP: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from get_pedagogue_surname_np order by SURNAMENP', []);
end;

function TKernel.GetPedagogueTrips(const id_order: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_PEDAGOGUE_TRIP (:1) order by ID_OUT', [id_order]);
end;

function TKernel.GetPsnpForAutorization: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_PSNP_FOR_AUTORIZATION order by SURNAMENP', []);
end;

function TKernel.GetSickLeave(const id_pedagogue, id_academic_year: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_SICK_LEAVE (:1,:2) order by DATE_BEGINING',
    [id_pedagogue, id_academic_year]);
end;

function TKernel.GetSmallGroupMember(const in_id_education_program,
  in_id_pedagogue, in_id_academic_year: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_SMALL_GROUP_MEMBER (:1,:2,:3) order by SURNAME_NAME, BIRTHDAY',
    [in_id_education_program, in_id_pedagogue, in_id_academic_year]);
end;

function TKernel.GetSmallLearnGrName(const in_id_learning_group: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_SMALL_GROUP_NAME(:1)', [in_id_learning_group]);
end;

// ��������� ������� �������� TResultTable � ������� �� ������� CT_STATUS �� ��������� �����������
function TKernel.GetStatusLearningGroup(const aGroup: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_status where group_code = :1', [aGroup]);
end;

function TKernel.GetStatusList(const aGroup: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_status where group_code = :1', [aGroup]);
end;

function TKernel.GetStatusOrders(const aGroup: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from ct_status where group_code = :1', [aGroup]);
end;

function TKernel.GetTimesheetForGroup(const id_learning_group, id_academic_year
  : integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_TIMESEET_FOR_GROUP(:1,:2)',
    [id_learning_group, id_academic_year]);
end;

function TKernel.GetTimesheetGrid(const tag, hour_day: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_TIMESHEET_GRID(:1,:2)', [tag, hour_day]);
  // ��� ��� �������� ����� - 1! ��� �������������� 0 ��� null
  // ���� ��� 0, ������ ������� �������������� �����
  // ��� ��������!!
end;

function TKernel.GetTimeSheetList(const in_weekday, in_learning_group,
  in_study_room, in_pedagogue, in_academic_year, in_status: integer;
  state_on_day: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    // ��������� �� �����
    // 'select * from GET_TIMESHEET (:1,:2,:3,:4,:5,:6,:7) order by NAME_GROUP_CHILD, STATUS, ID_WEEKDAY, ID_TIMESHEET_GRID',
    // �������� �� ���� ������
    'select * from GET_TIMESHEET (:1,:2,:3,:4,:5,:6,:7) order by ID_WEEKDAY, ID_TIMESHEET_GRID, NAME_GROUP_CHILD, STATUS',
    [in_weekday, in_learning_group, in_study_room, in_pedagogue,
    in_academic_year, in_status, state_on_day]);
end;

function TKernel.GetTimesheetMini(const in_weekday, in_pedagogue,
  in_academic_year, in_status: integer; state_on_day: string): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_TIMESHEET_MINI (:1,:2,:3,:4,:5) order by ID_TIMESHEET_GRID',
    [in_weekday, in_pedagogue, in_academic_year, in_status, state_on_day]);
end;

function TKernel.GetVolumeRealByMonthPed(const in_id_pedagogue,
  in_id_academic_year, in_id_program, month_number: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_RV_PED_MONTH (:1,:2,:3,:4) order by SHORT_NAME_PROGRAM, GROUP_NAME',
    [in_id_pedagogue, in_id_academic_year, in_id_program, month_number]);
end;

function TKernel.GetVolumeRealByProgrMonthPed(const in_id_pedagogue,
  in_id_academic_year, month_number: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
//    'select * from GET_RV_PED_PROGR_MONTH (:1,:2,:3) order by NAME_PROGRAM_',
    'select * from GET_RV_PED_PROGR_MONTH (:1,:2,:3)',
    [in_id_pedagogue, in_id_academic_year, month_number]);
end;

// ��� ���� ������� ��� �� ������� �������� - �� ������� �������� ������� �� ��������� �� ������ ���� ���
function TKernel.GetVolumeRealByPedSemesterDHS(const in_id_pedagogue,
  in_id_academic_year, last_month_semester: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
//    'select * from GET_RV_PED_SEMESTER_BY_PROGR (:1,:2,:3) order by NAME_PROGRAM',
    'select * from GET_RV_DHS_BY_PED (:1,:2,:3)',
    [in_id_pedagogue, in_id_academic_year, last_month_semester]);
end;

function TKernel.GetVolumeRealByProgrSemesterPed(const in_id_pedagogue,
  in_id_academic_year, last_month_semester: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
//    'select * from GET_RV_PED_SEMESTER_BY_PROGR (:1,:2,:3) order by NAME_PROGRAM',
    'select * from GET_RV_PED_SEMESTER_BY_PROGR (:1,:2,:3)',
    [in_id_pedagogue, in_id_academic_year, last_month_semester]);
end;

function TKernel.GetVolumeRealBySemesterPed(const in_id_pedagogue,
  in_id_academic_year, in_id_program, last_month_semester: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_RV_PED_SEMESTER (:1,:2,:3,:4) order by SHORT_NAME_PROGRAM',
    [in_id_pedagogue, in_id_academic_year, in_id_program, last_month_semester]);
end;

function TKernel.GetVolumeRealDhsByMonth(const in_id_academic_year,
  in_id_program, month_number: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_RV_DHS_MONTH (:1,:2,:3)',
    [in_id_academic_year, in_id_program, month_number]);
end;

function TKernel.GetVolumeRealDhsByProgrMonth(const in_id_academic_year,
  month_number: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_RV_DHS_PROGR_MONTH (:1,:2)',
    [in_id_academic_year, month_number]);
end;

function TKernel.GetWeekday: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from CT_WEEKDAY', []);
end;

function TKernel.GetYearBirth: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select distinct(extract(year from BIRTHDAY)) as YearBirth from WT_LEARNING_CHILD where status = 1',
    []);
end;

function TKernel.MonthStr(NumMonth: integer): string;
const
  Month: array [1 .. 12] of string = ('������', '�������', '����', '������',
    '���', '����', '����', '������', '��������', '�������', '������',
    '�������');
begin
  Result := Month[NumMonth];
end;

function TKernel.SaveLearningGroup(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LEARNING_GROUP(:1,:2,:3,:4,:5,:6,:7,:8,:9);',
      Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveLearningGroupMembers(const Args: array of Variant)
  : Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LST_LEARNING_GROUP_MEMBERS(:1,:2,:3,:4,:5,:6);',
      Args);
  finally
    IBTrans.Free;
  end;
  // ���������:
  // ID type of column LST_LEARNING_GROUP_MEMBERS.ID,
  // ID_LEARNING_GROUP type of column LST_LEARNING_GROUP_MEMBERS.ID_LEARNING_GROUP,
  // ID_LEARNING_CHILD type of column LST_LEARNING_GROUP_MEMBERS.ID_LEARNING_CHILD,
  // STATUS type of column LST_LEARNING_GROUP_MEMBERS.STATUS,
  // ID_ORDER_IN type of column LST_LEARNING_GROUP_MEMBERS.ID_ORDER_IN,
  // ID_ORDER_OUT type of column LST_LEARNING_GROUP_MEMBERS.ID_ORDER_OUT)
end;

function TKernel.SaveNonWorkDay(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_NON_WORK_DAY(:1,:2);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveOrder(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_ORDER(:1,:2,:3,:4,:5,:6,:7,:8,:9);', Args);
  finally
    IBTrans.Free;
  end;
end;

// procedure TKernel.OnLog(Sender: TObject; const Msg: string);
// begin
// if Assigned(fLogger) and fLogger.Active then
// fLogger.AddLine(TimeToStr(Time) + '> Object: <' + Sender.ClassName +
// '> Msg: ' + Msg);
// end;

// ������� ��������� ������ � ������� WT_LEARNING_CHILD
function TKernel.SaveChildAdditional(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LEARNING_CHILD_ADDITIONAL(:1,:2,:3,:4,:5,:6,:7,:8);',
      Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveChildStatistic(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LEARNING_CHILD_STATISTIC(:1,:2,:3,:4,:5);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveChildTrip(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_TRIP_CHILD(:1,:2);', Args);
  finally
    IBTrans.Free;
  end;

end;

function TKernel.SaveJournalForPeriod(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_JOURNAL_FOR_PERIOD(:1,:2);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveLearningChild(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LEARNING_CHILD(:1,:2,:3,:4,:5,:6,:7,:8);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveParentAll(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_PARENT_ALL(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10);',
      Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveParentContact(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_LST_PARENT_CONTACT(:1,:2,:3,:4);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SavePedagogueClassMember(const Args: array of Variant)
  : Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_PEDAGOGUE_CLASS_MEMBER(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14);',
      Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SavePedagogueTrip(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_TRIP_PEDAGOGUE(:1,:2);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveSickLeave(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_SICK_LEAVE(:1,:2,:3,:4,:5);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.SaveTimesheet(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure SAVE_TIMESHEET(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10);',
      Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.UpdateJournal(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure UPDATE_JOURNAL(:1,:2,:3,:4);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.UpdateSmallGroupName(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure UPDATE_SMALL_GROUP_NAME(:1,:2);', Args);
  finally
    IBTrans.Free;
  end;

end;

function TKernel.UpdateTimesheet(const Args: array of Variant): Boolean;
var
  IBTrans: TIBTransaction;
begin
  IBTrans := CreateIBTransaction;
  try
    Result := ExecSQL(fIBConnect.Database, IBTrans,
      'execute procedure UPDATE_TIMESHEET(:1,:2,:3);', Args);
  finally
    IBTrans.Free;
  end;
end;

function TKernel.GetStudyRoom: TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from CT_STUDY_ROOM', []);
end;

function TKernel.GetSurnameNLearningChild(const in_id_learning_child: integer)
  : TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_SURNAME_N_LEARNING_CHILD(:1)', [in_id_learning_child]);
end;

function TKernel.GetSurnameNLearningChildsFromSmallLearningGroup
  (const in_id_learning_group: integer): TResultTable;
begin
  Result := OpenSQL(fIBConnect.Database, fIBConnect.Transaction,
    'select * from GET_SMGR_MEMBER_FOR_NAME_LG(:1) order by SURNAME_N',
    [in_id_learning_group]);
end;

end.
