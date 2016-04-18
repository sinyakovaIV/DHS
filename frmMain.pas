unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.ButtonGroup, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.XPMan, dbfunc,
  uKernel, Vcl.Buttons, ComObj;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Data2: TMenuItem;
    EducationalPart3: TMenuItem;
    MethodicalWork4: TMenuItem;
    Reports5: TMenuItem;
    Settings1_1: TMenuItem;
    Exit1_2: TMenuItem;
    Directory6: TMenuItem;
    SMK7: TMenuItem;
    Pedagogue2_1: TMenuItem;
    LearningChild2_2: TMenuItem;
    StatusBar1: TStatusBar;
    N8: TMenuItem;
    N9: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    pPedagogueDate: TPanel;
    N1_LeaningGroup: TMenuItem;
    PedagogueClassList_N2: TMenuItem;
    TimeSheet_N3: TMenuItem;
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    lvByGroupChild: TListView;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    lvByLevel: TListView;
    lvByProgram: TListView;
    RadioGroup1: TRadioGroup;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel10: TPanel;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    lvDetailTimesheet: TListView;
    TabSheet8: TTabSheet;
    lvClassicTimesheet1: TListView;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    RealizationVolume_N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    BitBtn1: TBitBtn;
    N17: TMenuItem;
    TimeSheetReport: TMenuItem;
    Button1: TButton;
    LearningGropeList_N23: TMenuItem;
    LearningGroupFilling_N24: TMenuItem;
    Individual_N2: TMenuItem;
    SmalGroup_N3: TMenuItem;
    N1: TMenuItem;
    JournalPedagogue_N2: TMenuItem;
    N2: TMenuItem;
    Orders_N3: TMenuItem;
    N10: TMenuItem;
    SickLeave_N23: TMenuItem;
    TripPedagogue_N24: TMenuItem;
    TripLearningChild_N25: TMenuItem;
    N3_CollectiveJournal: TMenuItem;
    N23_NavigateStatisticsPage: TMenuItem;
    HolidayWorkOff_N24: TMenuItem;
    N24_IndividualPageJournal: TMenuItem;
    N3_OpenJournal: TMenuItem;
    GroupComposition_N3: TMenuItem;
    ChildDataForJournal_N3: TMenuItem;
    Panel3: TPanel;
    lvClassicTimesheet2: TListView;
    lvClassicTimesheet3: TListView;
    lvClassicTimesheet4: TListView;
    lvClassicTimesheet5: TListView;
    lvClassicTimesheet6: TListView;
    MonitoringSUN_N3: TMenuItem;
    procedure LearningChild2_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1_2Click(Sender: TObject);
    procedure TimeSheet_N3Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LearningGropeList_N23Click(Sender: TObject);
    procedure Orders_N10Click(Sender: TObject);
    procedure Individual_N2Click(Sender: TObject);
    procedure SmalGroup_N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Orders_N3Click(Sender: TObject);
    procedure SickLeave_N23Click(Sender: TObject);
    procedure TripPedagogue_N24Click(Sender: TObject);
    procedure TripLearningChild_N25Click(Sender: TObject);
    procedure N23_NavigateStatisticsPageClick(Sender: TObject);
    procedure HolidayWorkOff_N24Click(Sender: TObject);
    procedure N3_CollectiveJournalClick(Sender: TObject);
    procedure N24_IndividualPageJournalClick(Sender: TObject);
    procedure N3_OpenJournalClick(Sender: TObject);
    procedure RealizationVolume_N11Click(Sender: TObject);
    procedure GroupComposition_N3Click(Sender: TObject);
    procedure ChildDataForJournal_N3Click(Sender: TObject);
    procedure TimeSheetReportClick(Sender: TObject);
    procedure MonitoringSUN_N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
  private
    CurAcademicYear: TResultTable;
    DetailTimesheet: TResultTable;
    ClassicTS1: TResultTable;
    ClassicTS2: TResultTable;
    ClassicTS3: TResultTable;
    ClassicTS4: TResultTable;
    ClassicTS5: TResultTable;
    ClassicTS6: TResultTable;
    { �������� }
    ByProgram: TResultTable;
    ByLevel: TResultTable;
    ByGroupChild: TResultTable;
    FStatusBarText: string;
    FStrPedagogue: string;
    CurAY: string;
    FIDPedagogue: integer;
    IDCurAY: integer;

    procedure ShowDetailTimesheet;
    procedure ShowClassicTS;
    procedure ShowByProgram;
    procedure ShowByLevel;
    procedure ShowByGroupChild;

    procedure SetStatusBarText(const Value: string);
    procedure SetStrPedagogue(const Value: string);
    procedure SetIDPedagogue(const Value: integer);
  public
    property StatusBarText: String read FStatusBarText write SetStatusBarText;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses frmPedagogue, frmChild, frmLearningGroupList,
  frmPedagogueClass, frmAutorization, frmTimesheet, frmExcelExperiment,
  frmReport_PedWorkLoad, frmOrders, frmSmallLearningGroup, frmExperiment,
  frmAgeStructure, frmJournalPedagogue, frmSickLeave,
  frmPedagogueTrips, frmChildTrips, frmNonWorkingDays,
  frmJournalPedagogueByCollectiveGroupChild,
  frmJournalPedagogueByIndividualGroupChild, frmJournalOpening,
  frmGroupComposition, frmRealisationVolume, frmChildDataForJournal,
  frmTimeSheetReport, frmMonitoringZUN, frmContingentSafety;
// , IniFiles {����� ������ IniFiles};

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
  if not Assigned(fExcelExperiment) then
    fExcelExperiment := TfExcelExperiment.Create(Self);
  fExcelExperiment.ShowModal;

end;

procedure TfMain.Button1Click(Sender: TObject); // �������� ������
begin
  ShowDetailTimesheet;
  ShowClassicTS;
  ShowByProgram;
  ShowByLevel;
  ShowByGroupChild;
end;

procedure TfMain.ChildDataForJournal_N3Click(Sender: TObject);
begin
  if (not Assigned(fChildDataForJournal)) then
    fChildDataForJournal := TfChildDataForJournal.Create(Self);
  fChildDataForJournal.IDPedagogue := IDPedagogue;
  fChildDataForJournal.IDAcademicYear := IDCurAY;
  fChildDataForJournal.Show;
end;

procedure TfMain.Exit1_2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  // ����� ������ �������, �� ������? �� ������ �� ��� ����������� ����� "�������" ������� �����, � ����������� �� �����������, � ����������...
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Kernel := TKernel.Create;
  CurAcademicYear := nil;
  DetailTimesheet := nil;
  ClassicTS1 := nil;
  ClassicTS2 := nil;
  ClassicTS3 := nil;
  ClassicTS4 := nil;
  ClassicTS5 := nil;
  ClassicTS6 := nil;
  ByProgram := nil;
  ByLevel := nil;
  ByGroupChild := nil;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  Kernel.Free;
  if Assigned(CurAcademicYear) then
    FreeAndNil(CurAcademicYear);
  if Assigned(DetailTimesheet) then
    FreeAndNil(DetailTimesheet);
  if Assigned(ClassicTS1) then
    FreeAndNil(ClassicTS1);
  if Assigned(ClassicTS2) then
    FreeAndNil(ClassicTS2);
  if Assigned(ClassicTS3) then
    FreeAndNil(ClassicTS3);
  if Assigned(ClassicTS4) then
    FreeAndNil(ClassicTS4);
  if Assigned(ClassicTS5) then
    FreeAndNil(ClassicTS5);
  if Assigned(ClassicTS6) then
    FreeAndNil(ClassicTS6);
  if Assigned(ByProgram) then
    FreeAndNil(ByProgram);
  if Assigned(ByLevel) then
    FreeAndNil(ByLevel);
  if Assigned(ByGroupChild) then
    FreeAndNil(ByGroupChild);
end;

procedure TfMain.FormShow(Sender: TObject);
// var

// var
// fIniFile: TIniFile;
begin
  // try
  // if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then
  // try
  // fIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +
  // 'config.ini');
  // if Kernel.IBConnect.Connect(fIniFile.ReadString('Dhs', 'Path', '')) then
  // StatusBar1.SimpleText := '����������� ���������. ��: ' +
  // Kernel.IBConnect.Database.DatabaseName // ������� ��� ����
  // else
  // StatusBar1.SimpleText := '������ ��� ����������� � �� ' +
  // Kernel.IBConnect.Database.DatabaseName;
  // finally
  // fIniFile.Free;
  // end
  // else
  // raise Exception.Create('�� ������ ���� config.ini');
  // if Kernel.IBConnect.Connected then
  // Kernel.OnLog(Kernel.IBConnect, '����������� ���������. ��: ' +
  // Kernel.IBConnect.Database.DatabaseName);
  // except
  // on E: Exception do
  // Kernel.OnLog(Self, E.Message);
  // end;
  StatusBar1.SimpleText := StatusBarText;
  if not Assigned(CurAcademicYear) then
    CurAcademicYear := Kernel.GetCurAcademicYear;
  if CurAcademicYear.Count > 0 then
    CurAY := CurAcademicYear[0].ValueStrByName('NAME');
  IDCurAY := CurAcademicYear[0].ValueByName('ID_OUT');
  pPedagogueDate.Caption := '    �������:  ' + StrPedagogue +
    '          �������:  ' + DateToStr(Date); // + '   ������� ���:  ' + CurAY;

  ShowDetailTimesheet;
  ShowClassicTS;
  ShowByGroupChild;

end;

procedure TfMain.GroupComposition_N3Click(Sender: TObject);
begin
  if (not Assigned(fGroupComposition)) then
    fGroupComposition := TfGroupComposition.Create(Self);
  fGroupComposition.IDPedagogue := IDPedagogue;
  fGroupComposition.IDAcademicYear := IDCurAY;
  fGroupComposition.Show;
end;

procedure TfMain.Individual_N2Click(Sender: TObject);
begin
  // �������� ������������� �����
  if (not Assigned(fPedagogueClass)) then
    // ���� ����� �� �������, �� ������� ��
    fPedagogueClass := TfPedagogueClass.Create(Self);
  fPedagogueClass.IDPedagogue := IDPedagogue;
  fPedagogueClass.IDCurAcademicYear := IDCurAY;
  fPedagogueClass.Show; // ����� �����
end;

procedure TfMain.LearningChild2_2Click(Sender: TObject);
begin
  if (not Assigned(fChild)) then
    fChild := TfChild.Create(Self);
  fChild.Show;
end;

procedure TfMain.LearningGropeList_N23Click(Sender: TObject);
begin
  if (not Assigned(flearningGroupList)) then
    flearningGroupList := TfLearningGroupList.Create(Self);
  flearningGroupList.IDPedagogue := IDPedagogue;
  flearningGroupList.IDCurAcademicYear := IDCurAY;
  flearningGroupList.Show;
end;

procedure TfMain.RealizationVolume_N11Click(Sender: TObject);
begin
  if (not Assigned(fRealisationVolume)) then
    fRealisationVolume := TfRealisationVolume.Create(Self);
  fRealisationVolume.IDPedagogue := IDPedagogue;
  fRealisationVolume.IDAcademicYear := IDCurAY;
  fRealisationVolume.Show;
end;

procedure TfMain.N12Click(Sender: TObject);
begin
  if (not Assigned(fMonitoringSUN)) then
    fMonitoringSUN := TfMonitoringSUN.Create(Self);
  fMonitoringSUN.IDPedagogue := IDPedagogue;
  fMonitoringSUN.IDCurAcademicYear := IDCurAY;
  fMonitoringSUN.Show;
end;

procedure TfMain.N13Click(Sender: TObject);
begin
  if (not Assigned(fContingentSafety)) then
    fContingentSafety := TfContingentSafety.Create(Self);
  fContingentSafety.IDPedagogue := IDPedagogue;
  fContingentSafety.IDCurAcademicYear := IDCurAY;
  fContingentSafety.Show;
end;

procedure TfMain.N14Click(Sender: TObject);
begin
  // ��� ���������� ����������� �����
  if (not Assigned(fExperiment)) then
    fExperiment := TfExperiment.Create(Self);
  fExperiment.IDCurAcademicYear := IDCurAY;
  fExperiment.Show;

end;

procedure TfMain.N17Click(Sender: TObject); // ����� � ���. ��������
begin
  if (not Assigned(fReport_PedWorkLoad)) then
    fReport_PedWorkLoad := TfReport_PedWorkLoad.Create(Self);
  fReport_PedWorkLoad.IDPedagogue := IDPedagogue;
  fReport_PedWorkLoad.IDCurAcademicYear := IDCurAY;
  fReport_PedWorkLoad.Show;
end;

procedure TfMain.N1Click(Sender: TObject); // ���������� ������
begin
  if (not Assigned(fAgeStructure)) then
    fAgeStructure := TfAgeStructure.Create(Self);
  fAgeStructure.IDCurAcademicYear := IDCurAY;
  fAgeStructure.CurAcademicYear := CurAY;
  fAgeStructure.IDPedagogue := IDPedagogue;

  fAgeStructure.Show;
end;

procedure TfMain.TimeSheetReportClick(Sender: TObject);
begin
  if (not Assigned(fTimeSheetReport)) then
    fTimeSheetReport := TfTimeSheetReport.Create(Self);
  fTimeSheetReport.IDPedagogue := IDPedagogue;
  fTimeSheetReport.IDCurAcademicYear := IDCurAY;
//  fTimeSheetReport.StrPedagogue := StrPedagogue;
//  fTimeSheetReport.StrAcademicYear := CurAY;
  // fTimeSheetReport.IDCurAcademicYear := IDCurAY;
  fTimeSheetReport.Show;
end;

procedure TfMain.N23_NavigateStatisticsPageClick(Sender: TObject);
begin
  if (not Assigned(fJournalPedagogue)) then
    fJournalPedagogue := TfJournalPedagogue.Create(Self);
  fJournalPedagogue.IDPedagogue := IDPedagogue;
  fJournalPedagogue.IDAcademicYear := IDCurAY;
  fJournalPedagogue.StrPedagogue := StrPedagogue;
  fJournalPedagogue.StrAcademicYear := CurAY;
  // fOrders.IDCurAcademicYear := IDCurAY;
  fJournalPedagogue.Show;
end;

procedure TfMain.N24_IndividualPageJournalClick(Sender: TObject);
begin
  // �������� ������� ���'���������� ���� � ������� ������/��-�� ��� ����� ID
  // ��������� ����� ������ �� ������� ���� � ������ ������ �������
end;

procedure TfMain.MonitoringSUN_N3Click(Sender: TObject);
begin
  if (not Assigned(fMonitoringSUN)) then
    fMonitoringSUN :=
      fMonitoringSUN.Create(Self);
  fMonitoringSUN.IDPedagogue := IDPedagogue;
  fMonitoringSUN.IDCurAcademicYear := IDCurAY;
//  fJournalPedagogueByCollectiveGroupChild.StrPedagogue := StrPedagogue;
//  fJournalPedagogueByCollectiveGroupChild.StrAcademicYear := CurAY;
  fMonitoringSUN.Show;
end;

procedure TfMain.N3_CollectiveJournalClick(Sender: TObject);
begin
  if (not Assigned(fJournalPedagogueByCollectiveGroupChild)) then
    fJournalPedagogueByCollectiveGroupChild :=
      TfJournalPedagogueByCollectiveGroupChild.Create(Self);
  fJournalPedagogueByCollectiveGroupChild.IDPedagogue := IDPedagogue;
  fJournalPedagogueByCollectiveGroupChild.IDAcademicYear := IDCurAY;
  fJournalPedagogueByCollectiveGroupChild.StrPedagogue := StrPedagogue;
  fJournalPedagogueByCollectiveGroupChild.StrAcademicYear := CurAY;
  fJournalPedagogueByCollectiveGroupChild.Show;
end;

procedure TfMain.N3_OpenJournalClick(Sender: TObject);
begin
  // ������� ������
  if (not Assigned(fJournalOpening)) then
    fJournalOpening := TfJournalOpening.Create(Self);
  fJournalOpening.IDAcademicYear := IDCurAY;
  fJournalOpening.IDPedagogue := IDPedagogue;
  fJournalOpening.Show;
end;

procedure TfMain.HolidayWorkOff_N24Click(Sender: TObject);
begin
  if (not Assigned(fNonWorkingDays)) then
    fNonWorkingDays := TfNonWorkingDays.Create(Self);
  fNonWorkingDays.IDAcademicYear := IDCurAY;
  fNonWorkingDays.Show;
end;

procedure TfMain.Orders_N10Click(Sender: TObject);
begin
  // if (not Assigned(fOrders)) then
  // fOrders := TfOrders.Create(Self);
  // fOrders.IDCurAcademicYear := IDCurAY;
  // fOrders.Show;
end;

procedure TfMain.Orders_N3Click(Sender: TObject);
begin
  if (not Assigned(fOrders)) then
    fOrders := TfOrders.Create(Self);
  fOrders.IDCurAcademicYear := IDCurAY;
  fOrders.Show;
end;

procedure TfMain.TimeSheet_N3Click(Sender: TObject);
// ������ ������ ���������???
begin
  if (not Assigned(fTimesheet)) then
    fTimesheet := TfTimesheet.Create(Self);
  fTimesheet.IDPedagogue := IDPedagogue;
  fTimesheet.IDCurAcademicYear := IDCurAY;
  fTimesheet.Show;

  // ��������� ����� �� ��������� �� ����� �� ��������
  // �������� ������ ����, ����� ��� �������� ����� ����������� ����������
  // �� �������
  {
    if (not Assigned(fTimesheet)) then
    fTimesheet := TfTimesheet.Create(Self);
    fTimesheet.ShowModal;
    if fTimesheet.ModalResult = mrOk then
    begin
    ShowDetailTimesheet;
    ShowClassicTS;
    end; }
end;

procedure TfMain.TripLearningChild_N25Click(Sender: TObject);
begin
  if (not Assigned(fChildTrips)) then
    fChildTrips := TfChildTrips.Create(Self);
  // fSickLeave.IDPedagogue := IDPedagogue;
  fChildTrips.IDAcademicYear := IDCurAY;
  // fSickLeave.StrPedagogue := StrPedagogue;
  // fSickLeave.StrAcademicYear := CurAY;
  fChildTrips.Show;
end;

procedure TfMain.TripPedagogue_N24Click(Sender: TObject);
begin
  if (not Assigned(fPedagogueTrips)) then
    fPedagogueTrips := TfPedagogueTrips.Create(Self);
  // fSickLeave.IDPedagogue := IDPedagogue;
  fPedagogueTrips.IDAcademicYear := IDCurAY;
  // fSickLeave.StrPedagogue := StrPedagogue;
  // fSickLeave.StrAcademicYear := CurAY;
  fPedagogueTrips.Show;
end;

procedure TfMain.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfMain.SetStatusBarText(const Value: string);
begin
  if FStatusBarText <> Value then
    FStatusBarText := Value;
end;

procedure TfMain.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfMain.ShowByGroupChild;
begin
  if Assigned(ByGroupChild) then
    FreeAndNil(ByGroupChild);
  ByGroupChild := Kernel.GetLearningGroupList(0, IDPedagogue, IDCurAY, 0, 0);
  // (education_program, pedagogue, academic_year, learning_group_type, status)
  Kernel.GetLVByGroupChild(lvByGroupChild, ByGroupChild);
  if lvByGroupChild.Items.Count > 0 then
    lvByGroupChild.ItemIndex := 0
end;

procedure TfMain.ShowByLevel;
begin
  //
end;

procedure TfMain.ShowByProgram;
begin
  //
end;

procedure TfMain.ShowClassicTS;
begin
  if Assigned(ClassicTS1) then
    FreeAndNil(ClassicTS1);
  ClassicTS1 := Kernel.GetTimesheetMini(1, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet1, ClassicTS1);
  if lvClassicTimesheet1.Items.Count > 0 then
    lvClassicTimesheet1.ItemIndex := 0;

  if Assigned(ClassicTS2) then
    FreeAndNil(ClassicTS2);
  ClassicTS2 := Kernel.GetTimesheetMini(2, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet2, ClassicTS2);
  if lvClassicTimesheet2.Items.Count > 0 then
    lvClassicTimesheet2.ItemIndex := 0;

  if Assigned(ClassicTS3) then
    FreeAndNil(ClassicTS3);
  ClassicTS3 := Kernel.GetTimesheetMini(3, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet3, ClassicTS3);
  if lvClassicTimesheet3.Items.Count > 0 then
    lvClassicTimesheet3.ItemIndex := 0;

  if Assigned(ClassicTS4) then
    FreeAndNil(ClassicTS4);
  ClassicTS4 := Kernel.GetTimesheetMini(4, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet4, ClassicTS4);
  if lvClassicTimesheet4.Items.Count > 0 then
    lvClassicTimesheet4.ItemIndex := 0;

  if Assigned(ClassicTS5) then
    FreeAndNil(ClassicTS5);
  ClassicTS5 := Kernel.GetTimesheetMini(5, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet5, ClassicTS5);
  if lvClassicTimesheet5.Items.Count > 0 then
    lvClassicTimesheet5.ItemIndex := 0;

  if Assigned(ClassicTS6) then
    FreeAndNil(ClassicTS6);
  ClassicTS6 := Kernel.GetTimesheetMini(6, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_pedagogue, in_academic_year, in_status)
  Kernel.GetLVClassicTS(lvClassicTimesheet6, ClassicTS6);
  if lvClassicTimesheet6.Items.Count > 0 then
    lvClassicTimesheet6.ItemIndex := 0;
end;

procedure TfMain.ShowDetailTimesheet;
begin
  if Assigned(DetailTimesheet) then
    FreeAndNil(DetailTimesheet);
  DetailTimesheet := Kernel.GetTimeSheetList(0, 0, 0, IDPedagogue, IDCurAY, 1,
    DateToStr(Date));
  // (in_weekday, in_learning_group, in_study_room, in_pedagogue, in_academic_year, in_status, state_on_day)
  // ���� in_status=2, �� ���� ������� �������, �� ������ 2, �� ���� ��������������� � ������������ �����������
  Kernel.GetLVDetailTimesheet(lvDetailTimesheet, DetailTimesheet);
  if lvDetailTimesheet.Items.Count > 0 then
    lvDetailTimesheet.ItemIndex := 0
end;

procedure TfMain.SickLeave_N23Click(Sender: TObject);
begin
  if (not Assigned(fSickLeave)) then
    fSickLeave := TfSickLeave.Create(Self);
  fSickLeave.IDPedagogue := IDPedagogue;
  fSickLeave.IDAcademicYear := IDCurAY;
  fSickLeave.StrPedagogue := StrPedagogue;
  fSickLeave.StrAcademicYear := CurAY;
  fSickLeave.Show;
end;

procedure TfMain.SmalGroup_N3Click(Sender: TObject);
begin
  if (not Assigned(fSmallLearningGroup)) then
    fSmallLearningGroup := TfSmallLearningGroup.Create(Self);
  fSmallLearningGroup.IDPedagogue := IDPedagogue;
  fSmallLearningGroup.IDCurAcademicYear := IDCurAY;
  fSmallLearningGroup.Show;
end;

end.
