unit frmTimeSheetReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel,
  DateUtils, Winapi.ActiveX, ComObj, Vcl.OleServer;

type
  TfTimeSheetReport = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lvDetailTimesheet: TListView;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cmbAcademicYear: TComboBox;
    cmbPedagogue: TComboBox;
    cmbWeekday: TComboBox;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbWeekdayChange(Sender: TObject);
    procedure cmbPedagogueChange(Sender: TObject);
    procedure cmbAcademicYearChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    PedagogueSurnameNP: TResultTable;
    AcademicYear: TResultTable;
    Weekday: TResultTable;
    TimesheetList: TResultTable;

    FIDPedagogue: integer;
    FIDCurAcademicYear: integer;
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDCurAcademicYear(const Value: integer);
    procedure ShowTimesheetList;
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDCurAcademicYear: integer read FIDCurAcademicYear
      write SetIDCurAcademicYear;
  end;

var
  fTimeSheetReport: TfTimeSheetReport;

implementation

{$R *.dfm}
{ TfTimeSheetReport }

procedure TfTimeSheetReport.Button1Click(Sender: TObject);
var
  ExcelFileName, PedSurname, CurAcademicYear, sline: string;
  StrWeekday, StrTime, StrGroupChildName, StrLevel, StrProgram, StrDateBegining,
    StrDateEnding, StrStudyRoom: string;
  ExcelApp, Sheet, WorkBook: Variant;
  // Memo: TMemo;
  i, ii: integer;
begin
  Memo1.Clear;
  if not Kernel.CheckExcelInstalled('Excel.Application') then
    Application.MessageBox(PChar('���������� ���������� Microsoft Excel.'),
      '������', MB_ICONERROR);
  try
    if not Kernel.CheckExcelRun('Excel.Application', ExcelApp) then
      ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := false;
    ExcelApp.Application.EnableEvents := false;
    ExcelApp.SheetsInNewWorkbook := 1;
    WorkBook := ExcelApp.Workbooks.Add;
    Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
    PedSurname := ' ' + PedagogueSurnameNP[cmbPedagogue.ItemIndex]
      .ValueStrByName('SURNAMENP');
    CurAcademicYear := AcademicYear[cmbAcademicYear.ItemIndex]
      .ValueStrByName('NAME');
    Memo1.Clear;
    sline := '��������� ���������� ��������:   ' + PedSurname + '   ' +
      CurAcademicYear + ' ��.���.    ���� ������:  ' + DateToStr(Date);
    Memo1.Lines.Add(sline);
    sline := '';
    Memo1.Lines.Add(sline);
    // ����������� ����� � ���� "�������� ��������"
    ExcelApp.ActiveWindow.View := 3;
    // �������
    Sheet.PageSetup.TopMargin := 35;
    Sheet.PageSetup.LeftMargin := 35;
    Sheet.PageSetup.RightMargin := 35;
    Sheet.PageSetup.BottomMargin := 40;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[1].ColumnWidth := 4;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[2].ColumnWidth := 4;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[3].ColumnWidth := 10;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[4].ColumnWidth := 32;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[6].ColumnWidth := 7;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[5].ColumnWidth := 5;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[7].ColumnWidth := 10;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[8].ColumnWidth := 10;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[9].ColumnWidth := 4;
    // ��� �������:
    // ExcelApp.Workbooks[1].WorkSheets[1].Cells[1, 1] := '�� ������� / ��������';
    sline := '';
    sline := '�' + #9 + '�/���' + #9 + '�����' + #9 + '������ / ��������' + #9 +
      '�����.' + #9 + '�������' + #9 + '������ �' + #9 + '������ ��' + #9 + '���.';
    Memo1.Lines.Add(sline);

    for ii := 0 to TimesheetList.Count - 1 do
    begin
      StrWeekday := TimesheetList[ii].ValueStrByName('WEEKDAY_SHORT_NAME');
      StrTime := TimesheetList[ii].ValueStrByName('LESSON_BEGIN_END');
      StrGroupChildName := TimesheetList[ii].ValueStrByName('NAME_GROUP_CHILD');
      StrProgram := TimesheetList[ii].ValueStrByName('PROGRAM_SHORT_NAME');
      StrLevel := TimesheetList[ii].ValueStrByName('LEARNING_LEVEL');
      StrDateBegining := TimesheetList[ii].ValueStrByName('date_event');
      StrDateEnding := TimesheetList[ii].ValueStrByName('DATE_END');
      StrStudyRoom := TimesheetList[ii].ValueStrByName('NUMBER_STUDY_ROOM');

      sline := '';
      sline := IntToStr(ii + 1) + #9 + StrWeekday + #9 + StrTime + #9 +
        StrGroupChildName + #9 + StrLevel + #9 + StrProgram + #9 +
        StrDateBegining + #9 + StrDateEnding + #9 + StrStudyRoom;
      Memo1.Lines.Add(sline);
    end;
    Memo1.Lines.Add('');
    // sline := '�' + #9 + '���������' + #9 + '' + #9 +
    // '���-�� �����' + #9 + '%';
    // Memo1.Lines.Add(sline);
    // for i := 0 to RTPedagogueByMonth2.Count - 1 do
    // begin
    // sline := '';
    // sline := IntToStr(i + 1) + #9 + RTPedagogueByMonth2[i].ValueStrByName
    // ('NAME_PROGRAM_') + #9 + RTPedagogueByMonth2[i].ValueStrByName
    // ('COUNT_HOURS_') + #9 + RTPedagogueByMonth2[i].ValueStrByName
    // ('PERCENT_');
    // Memo1.Lines.Add(sline);
    // end;

    // sline := '����:   ' + DateToStr(Date);
    // Memo1.Lines.Add(sline);
    Memo1.SelectAll;
    Memo1.CopyToClipboard;
    ExcelApp.Workbooks[1].WorkSheets[1].Paste;
    // �������� ��� �������� �����
    Delete(PedSurname, Length(PedSurname) - 4, 5);
//    ExcelFileName := CurAcademicYear + PedSurname +
//      ' - ��������� ���������� ��  ' + DateToStr(Date);
    ExcelFileName := CurAcademicYear + PedSurname +
      ' - ��������� ���������� ��  ' + IntToStr(DayOf(Now)) + ' ' + IntToStr(MonthOf(Now));
      //
    WorkBook.SaveAs(ExtractFilePath(ParamStr(0)) + ExcelFileName);
    // ExcelApp.WorkBooks[1].WorkSheets[1].range['A2:F9'].Select;
    ExcelApp.Visible := true;
  finally
  end;
end;

procedure TfTimeSheetReport.cmbAcademicYearChange(Sender: TObject);
begin
  ShowTimesheetList;
end;

procedure TfTimeSheetReport.cmbPedagogueChange(Sender: TObject);
begin
  ShowTimesheetList;
end;

procedure TfTimeSheetReport.cmbWeekdayChange(Sender: TObject);
begin
  ShowTimesheetList;
end;

procedure TfTimeSheetReport.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  PedagogueSurnameNP := nil;
  TimesheetList := nil;
  Weekday := nil;
end;

procedure TfTimeSheetReport.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(TimesheetList) then
    FreeAndNil(TimesheetList);
  if Assigned(Weekday) then
    FreeAndNil(Weekday);
end;

procedure TfTimeSheetReport.FormShow(Sender: TObject);
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDCurAcademicYear);

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP, 'SurnameNP', false);
  Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue);

  if not Assigned(Weekday) then
    Weekday := Kernel.GetWeekday;
  Kernel.FillingComboBox(cmbWeekday, Weekday, 'NAME', true);
  cmbWeekday.ItemIndex := 0;

  ShowTimesheetList;
end;

procedure TfTimeSheetReport.SetIDCurAcademicYear(const Value: integer);
begin
  if FIDCurAcademicYear <> Value then
    FIDCurAcademicYear := Value;
end;

procedure TfTimeSheetReport.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfTimeSheetReport.ShowTimesheetList;
var
  in_weekday, in_learning_group, in_study_room, in_pedagogue, in_academic_year,
    in_status: integer;
  state_on_day: string;
  // ���������� ������� ���� � ���� ��������, ����� ����������� ��� ������������ �� ������ ������ ����������
begin
  if cmbWeekday.ItemIndex = 0 then
    in_weekday := 0
  else
    in_weekday := Weekday[cmbWeekday.ItemIndex - 1].ValueByName('ID');
  in_learning_group := 0; // in �������� ��� ����������� ���� ����� � ����������
  in_study_room := 0; // ���������� ��� ���� ���������
  in_pedagogue := PedagogueSurnameNP[cmbPedagogue.ItemIndex].ValueByName
    ('ID_OUT');
  in_academic_year := AcademicYear[cmbAcademicYear.ItemIndex].ValueByName('ID');
  in_status := 0; //
  state_on_day := DateToStr(Date);

  if Assigned(TimesheetList) then
    FreeAndNil(TimesheetList);
  TimesheetList := Kernel.GetTimeSheetList(in_weekday, in_learning_group,
    in_study_room, in_pedagogue, in_academic_year, in_status, state_on_day);
  Kernel.GetLVDetailTimesheetList(lvDetailTimesheet, TimesheetList);
  if lvDetailTimesheet.Items.Count > 0 then
  begin
    lvDetailTimesheet.ItemIndex := 0;
    // bChange.Enabled := true;
    // bDelete.Enabled := true;
    // bReplace.Enabled := true;
  end
  else
  begin
    // Panel4.Caption := '';
    // bChange.Enabled := false;
    // bDelete.Enabled := false;
    // bReplace.Enabled := false;
  end;

end;

end.
