unit frmJournalPedagogueByIndividualGroupChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel,
  DateUtils, Vcl.Buttons;

type
  TfJournalPedagogueByIndividualGroupChild = class(TForm)
    Panel3: TPanel;
    pPedagogue_: TPanel;
    pGroup_: TPanel;
    lvIndividualJournal: TListView;
    Button4: TButton;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel5: TPanel;
    cmbStatusLesson: TComboBox;
    mThemeComment: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    eNumberTheme: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    bChangeTheme: TButton;
    bSave: TButton;
    pTimesheet_: TPanel;
    cbMonth: TComboBox;
    eDateLesson: TEdit;
    PageControl1: TPageControl;
    TSh_9: TTabSheet;
    TSh_10: TTabSheet;
    TSh_11: TTabSheet;
    TSh_12: TTabSheet;
    TSh_1: TTabSheet;
    TSh_2: TTabSheet;
    TSh_3: TTabSheet;
    TSh_4: TTabSheet;
    TSh_5: TTabSheet;
    sbDisplacement: TSpeedButton;
    cmbPedagogue: TComboBox;
    bSaveDisplacement: TBitBtn;
    sbDelete: TSpeedButton;
    bDelete: TButton;
    procedure Button2Click(Sender: TObject);
    procedure bChangeThemeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure lvIndividualJournalSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure bSaveClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure sbDisplacementClick(Sender: TObject);
    procedure bSaveDisplacementClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
  private
    LessonStatus: TResultTable;
    IndividualPage: TResultTable; // ������, �� ���������, ����� ��������?))
    TimesheetForGroup: TResultTable;
    IndividualJournal: TResultTable;
    PedagogueSurnameNP: TResultTable;

    FIDPedagogue: integer;
    FStrPedagogue: string;
    FIDAcademicYear: integer;
    FStrAcademicYear: string;
    FIDLearningGroup: integer;
    FMonth: integer;
    FStrLGName: string;
    FStrEducationProgram: string;
    FStrLearningLevel: string;
    FWeekCountHour: integer;

    IDlesson: integer;
    in_status: integer;
    in_themes_number, in_theme_note: string;
    procedure SetIDPedagogue(const Value: integer);
    procedure SetStrPedagogue(const Value: string);
    procedure SetIDAcademicYear(const Value: integer);
    procedure SetStrAcademicYear(const Value: string);
    procedure SetIDLearningGroup(const Value: integer);
    procedure SetMonth(const Value: integer);
    procedure SetStrLGName(const Value: string);
    procedure SetStrEducationProgram(const Value: string);
    procedure SetStrLearningLevel(const Value: string);
    procedure SetWeekCountHour(const Value: integer);
    procedure ShowIndividualJournal(const IDLearningGroup, Month: integer);
  public
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property IDLearningGroup: integer read FIDLearningGroup
      write SetIDLearningGroup;
    property Month: integer read FMonth write SetMonth;
    property StrLGName: string read FStrLGName write SetStrLGName;
    property StrEducationProgram: string read FStrEducationProgram
      write SetStrEducationProgram;
    property StrLearningLevel: string read FStrLearningLevel
      write SetStrLearningLevel;
    property WeekCountHour: integer read FWeekCountHour write SetWeekCountHour;
  end;

var
  fJournalPedagogueByIndividualGroupChild
    : TfJournalPedagogueByIndividualGroupChild;

implementation

{$R *.dfm}
// ����������: ��. 13.00-19.00, ��. 8.00-20.00, ������ �... �� ...(NUMBER_DATE), ���. ����.....
// �������� ������ ����� ������
// ���� �� ������ ��� ����� ����� ������ ��������� lv � �����������
// � ���������� ������ "������� ������"

procedure TfJournalPedagogueByIndividualGroupChild.bSaveClick(Sender: TObject);
begin
  in_status := LessonStatus[cmbStatusLesson.ItemIndex].ValueByName('CODE');
  in_themes_number := eNumberTheme.Text;
  in_theme_note := mThemeComment.Text;
  if Kernel.UpdateJournal([IDlesson, in_status, in_themes_number, in_theme_note])
  then
  begin
    // ShowMessage('���������� ���������!');
  end
  else
  begin
    ShowMessage('������ ��� ����������!');
   // Close;
  end;
  ShowIndividualJournal(IDLearningGroup, Month);
end;

procedure TfJournalPedagogueByIndividualGroupChild.bSaveDisplacementClick
  (Sender: TObject);
var
  i, s: integer;
begin
  // ����������� �������, ����� ������� �� ������� ��� ����

  s := 0;
  for i := 0 to lvIndividualJournal.Items.Count - 1 do
  begin
    if lvIndividualJournal.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ��������������!');
    Exit;
  end;
  for i := 0 to lvIndividualJournal.Items.Count - 1 do
  begin
    if lvIndividualJournal.Items[i].Checked then
    begin
      IDlesson := IndividualJournal[i].ValueByName('ID_OUT');
      in_status := 1;
      in_themes_number := IndividualJournal[i].ValueStrByName('NUMBER_THEME');
      in_theme_note := IndividualJournal[i].ValueStrByName('NOTE_THEME') +
        ' ���������: ' + PedagogueSurnameNP[cmbPedagogue.ItemIndex]
        .ValueStrByName('SURNAMENP');
      if Kernel.UpdateJournal([IDlesson, in_status, in_themes_number,
        in_theme_note]) then
      begin
        // ShowMessage('���������� ���������!');
      end
      else
      begin
        ShowMessage('������ ��� ����������!');
      end;
    end;
  end;

  ShowIndividualJournal(IDLearningGroup, Month);
end;

procedure TfJournalPedagogueByIndividualGroupChild.Button2Click
  (Sender: TObject);
begin
  // ���� ����� ��������� ���������� ��� ��������� - ��� ���� �������
end;

procedure TfJournalPedagogueByIndividualGroupChild.bDeleteClick(
  Sender: TObject);
begin
  // ������� ������ �� ������� - ������ � ���������� ����� �������� � ������������� ����� ���
end;

procedure TfJournalPedagogueByIndividualGroupChild.bChangeThemeClick
  (Sender: TObject);
begin
  // �������� ���� ��� ������� (����������� ���� ����)
end;

procedure TfJournalPedagogueByIndividualGroupChild.cbMonthChange
  (Sender: TObject);
begin
  if cbMonth.ItemIndex <= 3 then
    Month := cbMonth.ItemIndex + 9
  else
    Month := cbMonth.ItemIndex - 3;
  ShowIndividualJournal(IDLearningGroup, Month);
  PageControl1.ActivePageIndex := cbMonth.ItemIndex;
end;

procedure TfJournalPedagogueByIndividualGroupChild.FormCreate(Sender: TObject);
begin
  LessonStatus := nil;
  IndividualPage := nil;
  TimesheetForGroup := nil;
  IndividualJournal := nil;
  PedagogueSurnameNP := nil;
end;

procedure TfJournalPedagogueByIndividualGroupChild.FormDestroy(Sender: TObject);
begin
  if Assigned(LessonStatus) then
    FreeAndNil(LessonStatus);
  if Assigned(IndividualPage) then
    FreeAndNil(IndividualPage);
  if Assigned(TimesheetForGroup) then
    FreeAndNil(TimesheetForGroup);
  if Assigned(IndividualJournal) then
    FreeAndNil(IndividualJournal);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
end;

procedure TfJournalPedagogueByIndividualGroupChild.FormShow(Sender: TObject);
var
  weekday, time, date_beginig, order: string;
  i, ii: integer;
begin
  // ��������, ��� ������ � ������� ��������, ���� ����� ����� ������������ ���������
  pPedagogue_.Caption := '�������:  ' + StrPedagogue + ', ' + StrAcademicYear +
    ' ������� ���,  ' +
  // ��������� ������ ������� �� ������� ����:
  // Kernel.MonthStr(MonthOf(Date)) + '.';
    Kernel.MonthStr(Month);

  pGroup_.Caption := '������/��������:  ' + StrLGName + '      ���������:  ' +
    StrEducationProgram + ',  �������:  ' + StrLearningLevel;
  if not Assigned(TimesheetForGroup) then
    TimesheetForGroup := Kernel.GetTimesheetForGroup(IDLearningGroup,
      IDAcademicYear);

  pTimesheet_.Caption := '����������:  ';
  // ������� ��� �������� ���������� ����� �� ��������� ���������� ������ � ������,
  // ����� ����� ����������, ����������, ��� ���������� ��� ������ ������ ���������� �� ���������
  if TimesheetForGroup.Count > 0 then
    try
      for i := 0 to WeekCountHour - 1 do
      begin
        weekday := TimesheetForGroup[i].ValueStrByName('WEEK_DAY');
        time := TimesheetForGroup[i].ValueStrByName('LESSON_BEGIN_END');
        pTimesheet_.Caption := pTimesheet_.Caption + weekday + ' ' + time + ' ';
      end;
      if TimesheetForGroup.Count > WeekCountHour then
      begin
        for ii := 0 to round(TimesheetForGroup.Count / WeekCountHour) - 2 do
        begin
          date_beginig := TimesheetForGroup[1 + WeekCountHour * ii]
            .ValueStrByName('DATE_BEGINING');
          order := TimesheetForGroup[1 + WeekCountHour * ii].ValueStrByName
            ('NUMBER_DATE_ORDER');
          pTimesheet_.Caption := pTimesheet_.Caption + '���. ����. � ' +
            date_beginig + ' ' + order + ' ';
          for i := 1 to WeekCountHour do
          begin
            weekday := TimesheetForGroup[i + WeekCountHour * ii].ValueStrByName
              ('WEEK_DAY');
            time := TimesheetForGroup[i + WeekCountHour * ii].ValueStrByName
              ('LESSON_BEGIN_END');
            pTimesheet_.Caption := pTimesheet_.Caption + weekday + ' ' +
              time + ' ';
          end;
        end;
      end;
    except
      on EArgumentOutOfRangeException do
        ShowMessage('������! ��������� ����������!' + #13#10 +
          '���������� ������ � ������ ������ ��������������� ���������');
    end;

  if not Assigned(LessonStatus) then
    LessonStatus := Kernel.GetLessonStatus(7);
  Kernel.FillingComboBox(cmbStatusLesson, LessonStatus, 'NOTE', false);
  ShowIndividualJournal(IDLearningGroup, Month);
  if Month >= 9 then
  begin
    cbMonth.ItemIndex := Month - 9;
    PageControl1.ActivePageIndex := Month - 9;
  end
  else if Month <= 5 then
  begin
    cbMonth.ItemIndex := Month + 3;
    PageControl1.ActivePageIndex := Month + 3;
  end;
  // else
  // cbMonth.ItemIndex := 8;
  eDateLesson.Enabled := false;

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP, 'SurnameNP', false);
  cmbPedagogue.ItemIndex := 0;
end;

procedure TfJournalPedagogueByIndividualGroupChild.lvIndividualJournalSelectItem
  (Sender: TObject; Item: TListItem; Selected: Boolean);
var
  i: integer;
  EventEnding: string;
begin
  if IndividualJournal.Count > 0 then
    with IndividualJournal[Item.Index] do
    begin
      IDlesson := ValueByName('ID_OUT');
      eDateLesson.Text := ValueByName('LESSON_DATE');
      eNumberTheme.Text := ValueStrByName('NUMBER_THEME');
      Kernel.ChooseComboBoxItemIndex(cmbStatusLesson, LessonStatus, true,
        'CODE', ValueByName('LESSON_STATUS'));
      // Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
      // 'ID_OUT', IDPedagogue);
      mThemeComment.Text := ValueStrByName('NOTE_THEME');

      // if ValueStrByName('DATE_ENDING') = '' then
      // dtpEventEnding.Visible := false
      // else
      // begin
      // dtpEventEnding.Date := ValueByName('DATE_ENDING');
      // dtpEventEnding.Visible := true;
      // end;
      // for i := 0 to AcademicYear.Count - 1 do
      // if cmbAcademicYear2.Items[i] = ValueStrByName('ACADEMIC_YEAR') then
      // cmbAcademicYear2.ItemIndex := i;
      // for i := 0 to OrderType.Count - 1 do
      // if cmbTypeOrders2.Items[i] = ValueStrByName('TYPE_ORDER') then
      // cmbTypeOrders2.ItemIndex := i;
      // for i := 0 to StatusOrder.Count - 1 do
      // if cmbStatusOrder2.Items[i] = ValueStrByName('NAME_STATUS') then
      // cmbStatusOrder2.ItemIndex := i;
      bSave.Enabled := true;
      bChangeTheme.Enabled := true;
    end
  else
  begin
    // DoClearOrder;
    bSave.Enabled := false;
    bChangeTheme.Enabled := false;
  end;
end;

procedure TfJournalPedagogueByIndividualGroupChild.PageControl1Change
  (Sender: TObject);
begin
  if PageControl1.ActivePageIndex <= 3 then
    Month := PageControl1.ActivePageIndex + 9
  else
    Month := PageControl1.ActivePageIndex - 3;
  ShowIndividualJournal(IDLearningGroup, Month);
  cbMonth.ItemIndex := PageControl1.ActivePageIndex;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetIDAcademicYear
  (const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetIDLearningGroup
  (const Value: integer);
begin
  if FIDLearningGroup <> Value then
    FIDLearningGroup := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetIDPedagogue
  (const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetMonth
  (const Value: integer);
begin
  if FMonth <> Value then
    FMonth := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetStrAcademicYear
  (const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetStrEducationProgram
  (const Value: string);
begin
  if FStrEducationProgram <> Value then
    FStrEducationProgram := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetStrLearningLevel
  (const Value: string);
begin
  if FStrLearningLevel <> Value then
    FStrLearningLevel := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetStrLGName
  (const Value: string);
begin
  if FStrLGName <> Value then
    FStrLGName := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetStrPedagogue
  (const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.SetWeekCountHour
  (const Value: integer);
begin
  if FWeekCountHour <> Value then
    FWeekCountHour := Value;
end;

procedure TfJournalPedagogueByIndividualGroupChild.ShowIndividualJournal
  (const IDLearningGroup, Month: integer);
begin
  if Assigned(IndividualJournal) then
    FreeAndNil(IndividualJournal);
  IndividualJournal := Kernel.GetIndividualJournal(IDLearningGroup, Month);
  Kernel.GetLVIndividualJournal(lvIndividualJournal, IndividualJournal);
  if lvIndividualJournal.Items.Count > 0 then
    lvIndividualJournal.ItemIndex := 0;
end;

procedure TfJournalPedagogueByIndividualGroupChild.sbDeleteClick(
  Sender: TObject);
begin
  if sbDelete.Down = false then
  begin
    sbDelete.Caption := '������� � �������';
    bDelete.Caption := '������� ������';
    lvIndividualJournal.Checkboxes := false;

  end
  else
  begin
    sbDelete.Caption := '�������� �����';
    bDelete.Caption := '������� ������';
    lvIndividualJournal.Checkboxes := true;

//    bSaveDisplacement.Visible := true;
  end;
end;

procedure TfJournalPedagogueByIndividualGroupChild.sbDisplacementClick
  (Sender: TObject);
begin
  if sbDisplacement.Down = false then
  begin
    sbDisplacement.Caption := '��������� ���������';
    lvIndividualJournal.Checkboxes := false;
    cmbPedagogue.Visible := false;
    bSaveDisplacement.Visible := false;
  end
  else
  begin
    sbDisplacement.Caption := '������� �����';
    lvIndividualJournal.Checkboxes := true;
    cmbPedagogue.Visible := true;
    bSaveDisplacement.Visible := true;
  end;
end;

end.
