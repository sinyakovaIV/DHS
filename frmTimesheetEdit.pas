unit frmTimesheetEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, dbfunc, uKernel, DateUtils;

type
  TfTimesheetEdit = class(TForm)
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cmbChooseStudyRoom: TComboBox;
    cmbChooseAccompanist: TComboBox;
    cmbWeekday: TComboBox;
    Label2: TLabel;
    cmbTimesheetGrid: TComboBox;
    rgLessonLength: TRadioGroup;
    rgGridMode: TRadioGroup;
    bSave: TButton;
    Button2: TButton;
    cmbHourDay: TComboBox;
    Panel1: TPanel;
    Label4: TLabel;
    cmbStatus: TComboBox;
    procedure Button2Click(Sender: TObject); // �����
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgGridModeClick(Sender: TObject);
    procedure cmbHourDayChange(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
  private
    FNewRecord: boolean;
    FStrGroupChild: string; // ����� ���-�� ��� �������������� ����������
    FStrGroupChildNew: string; // ����� ���-�� ��� ����������� ����������
    FIDTimesheet: integer;
    FIDWeekday: integer;
    FIDTimesheetGrid: integer;
    FLessonLength: integer;
    // FEndOfLesson: Time;
    FIDLearningGroup: integer; // ����� ���-�� ��� �������������� ����������
    // FIDLearningGroupNew: integer; // ����� ���-�� ��� ����������� ����������
    FIDOrderEstablish: integer;
    FIDStudyRoom: integer;
    FStatus: integer;

    FTagTimesheet: string; // ���� ����� ���� null
    // FStrDateEnding: string;
    // FStrIDAccompanist: string;
    FStrDateEnding: variant;
    FStrIDAccompanist: variant;
    // FIDAccompanist: integer; � ID �������� ����� ������ null, ������� �������������..
    // � ������ ��� �� � integer, ���������, null... ���� ������ �������, �����������...

    Weekday: TResultTable;
    TimesheetGrid: TResultTable;
    StudyRoom: TResultTable;
    Accompanist: TResultTable;
    RTStatus: TResultTable;

    procedure SetNewRecord(const Value: boolean);
    procedure SetStrGroupChild(const Value: string);
    procedure SetStrGroupChildNew(const Value: string);
    procedure SetIDTimesheet(const Value: integer);
    procedure SetIDWeekday(const Value: integer);
    procedure SetIDTimesheetGrid(const Value: integer);
    procedure SetLessonLength(const Value: integer);
    // procedure SetEndOfLesson(const Value: integer);
    procedure SetIDLearningGroup(const Value: integer);
    // procedure SetIDLearningGroupNew(const Value: integer);
    procedure SetIDOrderEstablish(const Value: integer);
    procedure SetIDStudyRoom(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetTagTimesheet(const Value: string);
    procedure SetStrDateEnding(const Value: variant);
    procedure SetStrIDAccompanist(const Value: variant);
    // procedure SetStrDateEnding(const Value: string);
    // procedure SetStrIDAccompanist(const Value: string);
    // procedure SetStrIDAccompanist(const Value: string);
    // procedure SetIDAccompanist(const Value: integer);
  public
    property NewRecord: boolean read FNewRecord write SetNewRecord;
    property StrGroupChild: string read FStrGroupChild write SetStrGroupChild;
    property StrGroupChildNew: string read FStrGroupChildNew
      write SetStrGroupChildNew;
    property IDTimesheet: integer read FIDTimesheet write SetIDTimesheet;
    property IDWeekday: integer read FIDWeekday write SetIDWeekday;
    property IDTimesheetGrid: integer read FIDTimesheetGrid
      write SetIDTimesheetGrid;
    property LessonLength: integer read FLessonLength write SetLessonLength;
    // property EndOfLesson: integer read FEndOfLesson write SetEndOfLesson;
    property IDLearningGroup: integer read FIDLearningGroup
      write SetIDLearningGroup; // ���. ��� �������������� ����������
    // property IDLearningGroupNew: integer read FIDLearningGroupNew
    // write SetIDLearningGroupNew; // ���. ��� ����. ������ ����������
    property IDOrderEstablisht: integer read FIDOrderEstablish
      write SetIDOrderEstablish;
    property IDStudyRoom: integer read FIDStudyRoom write SetIDStudyRoom;
    property Status: integer read FStatus write SetStatus;

    // property StrIDAccompanist: string read FStrIDAccompanist
    // write SetStrIDAccompanist;
    // property IDAccompanist: integer read FIDAccompanist write SetIDAccompanist;
    property StrIDAccompanist: variant read FStrIDAccompanist
      write SetStrIDAccompanist;
    property TagTimesheet: string read FTagTimesheet write SetTagTimesheet;
    // property StrDateEnding: string read FStrDateEnding write SetStrDateEnding;
    // property TagTimesheet: variant read FTagTimesheet write SetTagTimesheet;
    property StrDateEnding: variant read FStrDateEnding write SetStrDateEnding;

  end;

var
  fTimesheetEdit: TfTimesheetEdit;

implementation

{$R *.dfm}

// TODO: ������� �� ����� ������������ ���� ������ ���������� (�� �������) - �� ��������� ��������� ������, ��� ������� ����� ���� ������
procedure TfTimesheetEdit.bSaveClick(Sender: TObject);
var
  i: integer;
  in_id, id_weekday, id_timesheet_grid, lesson_length, id_learning_group,
    id_order_establish, id_study_room, Status: integer;
  date_ending, id_accompanist: variant;
begin
  // ������ ������� �������� �� ���������� � ���������� ��������, ����-��
  if (cmbWeekday.ItemIndex = -1) or (cmbTimesheetGrid.ItemIndex = -1) or
    (cmbChooseStudyRoom.ItemIndex = -1) then
  begin
    ShowMessage('�� ��� ���� ���������!');
    Exit;
  end;

  id_weekday := Weekday[cmbWeekday.ItemIndex].ValueByName('ID');
  id_timesheet_grid := TimesheetGrid[cmbTimesheetGrid.ItemIndex]
    .ValueByName('ID_OUT');
  if rgLessonLength.ItemIndex = 0 then
    lesson_length := 40
  else
    lesson_length := 30;
  id_learning_group := IDLearningGroup;
  id_order_establish := IDOrderEstablisht; // �� ���� � ��������
  id_study_room := StudyRoom[cmbChooseStudyRoom.ItemIndex].ValueByName('ID');
  if cmbChooseAccompanist.ItemIndex = cmbChooseAccompanist.DropDownCount - 1
  then
    id_accompanist := null
  else
    id_accompanist := Accompanist[cmbChooseAccompanist.ItemIndex]
      .ValueByName('ID_OUT');

  if NewRecord then // ����� ������ � ����������
  begin
    in_id := -1;
    cmbStatus.Enabled := false;
    cmbStatus.ItemIndex := 2;
    Status := RTStatus[cmbStatus.ItemIndex].ValueByName('CODE');
    date_ending := null;
  end
  else // ���� not NewRecord - �������������� ������������ ������
  begin
    in_id := IDTimesheet;
    Status := RTStatus[cmbStatus.ItemIndex].ValueByName('CODE');

    case Status of
      1: // ���� ���������� ������������
        // ���� ��������� ������ ����� 31.05.�������� �������� ����
        begin
          if MonthOf(Now) < 9 then
            date_ending := '31.05.' + IntToStr(YearOf(Now))
          else
            date_ending := DateToStr(StrToDate('31.05.' + IntToStr(YearOf(Now) + 1)));
        end;
      2: // ���� ������������ ���������� ������� ���� ����������
        begin
          ShowMessage('��������! ������������ ������ ����������!' + #13#10 +
            '���������� ������ ������������ ��� ��� ������ �� �����.');
          Exit;
        end;
      3: // ���� ���������� �������� ���������������
        date_ending := null;
    end;
    // date_ending := StrDateEnding;
  end;
  if Kernel.SaveTimesheet([in_id, id_weekday, id_timesheet_grid, lesson_length,
    id_learning_group, id_order_establish, id_study_room, id_accompanist,
    Status, date_ending]) then
  begin
    // ShowMessage('���������� ���������!');
    Close;
  end
  else
  begin
    ShowMessage('������ ��� ����������!');
    Close;
  end;
end;

procedure TfTimesheetEdit.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfTimesheetEdit.cmbHourDayChange(Sender: TObject);
var
  i, hour_day: integer;
begin
  hour_day := StrToInt(cmbHourDay.Text);
  if Assigned(TimesheetGrid) then
    FreeAndNil(TimesheetGrid);
  TimesheetGrid := Kernel.GetTimesheetGrid(99, hour_day); // ������ �������� - ��� (��� �������� ����� - 0)
  Kernel.FillingComboBox(cmbTimesheetGrid, TimesheetGrid, 'TIME_LESSON', false);
  cmbTimesheetGrid.ItemIndex := 0;
end;

procedure TfTimesheetEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfTimesheetEdit.FormCreate(Sender: TObject);
begin
  Weekday := nil;
  TimesheetGrid := nil;
  StudyRoom := nil;
  Accompanist := nil;
  RTStatus := nil;
end;

procedure TfTimesheetEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(Weekday) then
    FreeAndNil(Weekday);
  if Assigned(TimesheetGrid) then
    FreeAndNil(TimesheetGrid);
  if Assigned(StudyRoom) then
    FreeAndNil(StudyRoom);
  if Assigned(Accompanist) then
    FreeAndNil(Accompanist);
  if Assigned(RTStatus) then
    FreeAndNil(RTStatus);
end;

procedure TfTimesheetEdit.FormShow(Sender: TObject);
var
  i: integer;
begin
  if not Assigned(Weekday) then
    Weekday := Kernel.GetWeekday;
  Kernel.FillingComboBox(cmbWeekday, Weekday, 'NAME', false);

  if not Assigned(RTStatus) then
    RTStatus := Kernel.GetStatusList(6);
  Kernel.FillingComboBox(cmbStatus, RTStatus, 'NOTE', false);

  if not Assigned(StudyRoom) then
    StudyRoom := Kernel.GetStudyRoom;
  Kernel.FillingComboBox(cmbChooseStudyRoom, StudyRoom, 'NUMBER', false);

  if not Assigned(Accompanist) then
    Accompanist := Kernel.GetAccompanist;
  Kernel.FillingComboBox(cmbChooseAccompanist, Accompanist, 'SURNAMENP', false);
  cmbChooseAccompanist.DropDownCount := cmbChooseAccompanist.DropDownCount + 1;
  cmbChooseAccompanist.Items.Add('��� ���������������');

  Panel4.Caption := StrGroupChild;

  if NewRecord then // ���� ���������� ����� ����������
  begin
    // Panel4.Caption := StrGroupChildNew;
    fTimesheetEdit.Caption := '��������� ����������';
    cmbWeekday.ItemIndex := -1;
    Kernel.ChooseComboBoxItemIndex(cmbStatus, RTStatus, true, 'CODE',
      3 { ��������������� ������ } );
    cmbStatus.Enabled := false;
    cmbChooseStudyRoom.ItemIndex := -1;
    // cmbChooseAccompanist.ItemIndex := -1;
    cmbChooseAccompanist.ItemIndex := cmbChooseAccompanist.DropDownCount - 1;
    rgLessonLength.ItemIndex := 0;
    rgGridMode.ItemIndex := 0;
    if not Assigned(TimesheetGrid) then
      // ���� ������ �������� '0' �� ��������� �������� �����, ������ �������� ��� ��� ���
      TimesheetGrid := Kernel.GetTimesheetGrid(0, 0);
    Kernel.FillingComboBox(cmbTimesheetGrid, TimesheetGrid,
      'TIME_LESSON', false);
    cmbTimesheetGrid.ItemIndex := -1;
  end
  else // ���� ����������/����������� ����������
  begin
    Kernel.ChooseComboBoxItemIndex(cmbWeekday, Weekday, true, 'ID', IDWeekday);
    Kernel.ChooseComboBoxItemIndex(cmbStatus, RTStatus, true, 'CODE', Status);
    cmbStatus.Enabled := true;
    Kernel.ChooseComboBoxItemIndex(cmbChooseStudyRoom, StudyRoom, true, 'ID',
      IDStudyRoom);
    // if not Assigned(StrIDAccompanist) then
    // if StrIDAccompanist = null then
    if StrIDAccompanist = Unassigned then
      cmbChooseAccompanist.ItemIndex := cmbChooseAccompanist.DropDownCount - 1
    else
      Kernel.ChooseComboBoxItemIndex(cmbChooseAccompanist, Accompanist, true,
        'ID_OUT', StrToInt(StrIDAccompanist));
    if LessonLength = 30 then
      rgLessonLength.ItemIndex := 1
    else
      rgLessonLength.ItemIndex := 0;
    // Panel4.Caption := StrGroupChild;
    fTimesheetEdit.Caption := '�������� ����������';

    // �������� cb � ����������� �� ����, �������� ��� �������������� ����� � ����.
    if StrToInt(TagTimesheet) = 0 then // �������� �����
      if Assigned(TimesheetGrid) then
      begin
        FreeAndNil(TimesheetGrid);
//      if not Assigned(TimesheetGrid) then
        TimesheetGrid := Kernel.GetTimesheetGrid(0, 0)
      end
// ���� ������������� ���������� �� �������� �� �������������� �����, �� ����������!!!
      else // ���� �� ���� ��� �������� � cb, ���� ������������ ����� ����� �� �������������� �����...
        TimesheetGrid := Kernel.GetTimesheetGrid(0, 0);
    Kernel.FillingComboBox(cmbTimesheetGrid, TimesheetGrid,
      'TIME_LESSON', false);
    Kernel.ChooseComboBoxItemIndex(cmbTimesheetGrid, TimesheetGrid, true,
      'ID_OUT', IDTimesheetGrid);
  end;
end;

procedure TfTimesheetEdit.rgGridModeClick(Sender: TObject);
var
  i, hour_day: integer;
begin
  if rgGridMode.ItemIndex = 0 then
  begin
    cmbHourDay.Visible := false;
    Panel1.Visible := false;
    if Assigned(TimesheetGrid) then
      FreeAndNil(TimesheetGrid);
    TimesheetGrid := Kernel.GetTimesheetGrid(0, 0);
    Kernel.FillingComboBox(cmbTimesheetGrid, TimesheetGrid,
      'TIME_LESSON', false);
    cmbTimesheetGrid.ItemIndex := 0;
  end
  else
  begin
    cmbHourDay.Visible := true;
    cmbHourDay.ItemIndex := 0;
    Panel1.Visible := true;
    hour_day := StrToInt(cmbHourDay.Text);
    if Assigned(TimesheetGrid) then
      FreeAndNil(TimesheetGrid);
    // �� ������ ��������� ��� �� cmbHourDay
    TimesheetGrid := Kernel.GetTimesheetGrid(99, hour_day);
    Kernel.FillingComboBox(cmbTimesheetGrid, TimesheetGrid,
      'TIME_LESSON', false);
    cmbTimesheetGrid.ItemIndex := 0;
  end;
end;

// procedure TfTimesheetEdit.SetIDAccompanist(const Value: integer);
// begin
// if FIDAccompanist <> Value then
// FIDAccompanist := Value;
// end;

procedure TfTimesheetEdit.SetIDLearningGroup(const Value: integer);
begin
  if FIDLearningGroup <> Value then
    FIDLearningGroup := Value;
end;

// procedure TfTimesheetEdit.SetIDLearningGroupNew(const Value: integer);
// begin
// if FIDLearningGroupNew <> Value then
// FIDLearningGroupNew := Value;
// end;

procedure TfTimesheetEdit.SetIDOrderEstablish(const Value: integer);
begin
  if FIDOrderEstablish <> Value then
    FIDOrderEstablish := Value;
end;

procedure TfTimesheetEdit.SetIDStudyRoom(const Value: integer);
begin
  if FIDStudyRoom <> Value then
    FIDStudyRoom := Value;
end;

procedure TfTimesheetEdit.SetIDTimesheet(const Value: integer);
begin
  if FIDTimesheet <> Value then
    FIDTimesheet := Value;
end;

procedure TfTimesheetEdit.SetIDTimesheetGrid(const Value: integer);
begin
  if FIDTimesheetGrid <> Value then
    FIDTimesheetGrid := Value;
end;

procedure TfTimesheetEdit.SetIDWeekday(const Value: integer);
begin
  if FIDWeekday <> Value then
    FIDWeekday := Value;
end;

procedure TfTimesheetEdit.SetLessonLength(const Value: integer);
begin
  if FLessonLength <> Value then
    FLessonLength := Value;
end;

procedure TfTimesheetEdit.SetNewRecord(const Value: boolean);
begin
  if FNewRecord <> Value then
    FNewRecord := Value;
end;

procedure TfTimesheetEdit.SetStatus(const Value: integer);
begin
  if FStatus <> Value then
    FStatus := Value;
end;

procedure TfTimesheetEdit.SetStrDateEnding(const Value: variant);
begin
  if FStrDateEnding <> Value then
    FStrDateEnding := Value;
end;

// procedure TfTimesheetEdit.SetStrDateEnding(const Value: string);
// begin
// if FStrDateEnding <> Value then
// FStrDateEnding := Value;
// end;

procedure TfTimesheetEdit.SetStrGroupChild(const Value: string);
begin
  if FStrGroupChild <> Value then
    FStrGroupChild := Value;
end;

procedure TfTimesheetEdit.SetStrGroupChildNew(const Value: string);
begin
  if FStrGroupChildNew <> Value then
    FStrGroupChildNew := Value;
end;

// procedure TfTimesheetEdit.SetStrIDAccompanist(const Value: string);
// begin
// if FStrIDAccompanist <> Value then
// FStrIDAccompanist := Value;
// end;
//
// procedure TfTimesheetEdit.SetTagTimesheet(const Value: string);
// begin
// if FTagTimesheet <> Value then
// FTagTimesheet := Value;
// end;

procedure TfTimesheetEdit.SetStrIDAccompanist(const Value: variant);
begin
  if FStrIDAccompanist <> Value then
    FStrIDAccompanist := Value;
end;

procedure TfTimesheetEdit.SetTagTimesheet(const Value: string);
begin
  if FTagTimesheet <> Value then
    FTagTimesheet := Value;
end;

end.
