unit frmRealisationVolume;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel,
  DateUtils, Winapi.ActiveX, ComObj, Vcl.OleServer;

type
  TfRealisationVolume = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    cmbPedagogue: TComboBox;
    cmbAcademicYear: TComboBox;
    PageControl1: TPageControl;
    Label2: TLabel;
    cbMonth: TComboBox;
    tsPedagogueByMonth_1: TTabSheet;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    lvPedagogueByMonth1: TListView;
    lvPedagogueByMonth2: TListView;
    Memo1: TMemo;
    bExportPedagogueByMonth: TButton;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter2: TSplitter;
    lvPedagogueByYear2: TListView;
    lvPedagogueByYear1: TListView;
    lvDHSByYear1: TListView;
    lvDHSByYear2: TListView;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter3: TSplitter;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    lvPedagogueByYearII2: TListView;
    lvPedagogueByYearII1: TListView;
    lvDHSByYearII2: TListView;
    lvDHSByYearII1: TListView;
    Panel9: TPanel;
    Splitter4: TSplitter;
    Panel10: TPanel;
    Panel11: TPanel;
    Splitter5: TSplitter;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbPedagogueChange(Sender: TObject);
    procedure cmbAcademicYearChange(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure bExportPedagogueByMonthClick(Sender: TObject);
  private
    AcademicYear: TResultTable;
    PedagogueSurnameNP: TResultTable;
    RTPedagogueByMonth1, RTPedagogueByMonth2: TResultTable;
    RTPedagogueBySemester1, RTPedagogueBySemester2: TResultTable;
    RTPedagogueBySemesterII1, RTPedagogueBySemesterII2: TResultTable;
    RTdhsBySemester1, RTdhsBySemester2: TResultTable;
    RTdhsBySemesterII1, RTdhsBySemesterII2: TResultTable;
    FIDPedagogue: integer;
    FIDAcademicYear: integer;
    MonthNumber: integer;
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    procedure ShowByMonth;
    procedure ShowBySemester;
    procedure ShowBySemesterII;
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
  end;

var
  fRealisationVolume: TfRealisationVolume;

implementation

{$R *.dfm}

procedure TfRealisationVolume.bExportPedagogueByMonthClick(Sender: TObject);
var
  ExcelFileName, PedSurname, CurAcademicYear, sline: string;
  StrGroupChildName, StrProgram, CountHoursMonth, CountHoursWeek, Percent: string;
  ExcelApp, Sheet, WorkBook: Variant;
  // Memo: TMemo;
  i, ii: integer;
begin
  Memo1.Clear;
  if not Kernel.CheckExcelInstalled('Excel.Application') then
    Application.MessageBox(PChar('Необходимо установить Microsoft Excel.'),
      'Ошибка', MB_ICONERROR);
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
    sline := 'Объем реализации ДОП за ' + cbMonth.Text + ' ' + CurAcademicYear +
      ' учебного года.  Педагог:  ' + PedSurname;
    Memo1.Lines.Add(sline);
    // отображение листа в виде "разметка страницы"
    ExcelApp.ActiveWindow.View := 3;
    // Отступы
    Sheet.PageSetup.TopMargin := 70;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[1].ColumnWidth := 4;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[2].ColumnWidth := 25;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[3].ColumnWidth := 10;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[4].ColumnWidth := 10;
    ExcelApp.Workbooks[1].WorkSheets[1].Columns[4].ColumnWidth := 10;
    // для примеру:
    // ExcelApp.Workbooks[1].WorkSheets[1].Cells[1, 1] := 'По группам / учащимся';
    sline := '';
    sline := '№' + #9 + 'Группа / учащийся' + #9 + 'Программа' + #9 + 'часов/нед' + #9 +
      'часов/мес' + #9 + '%';
    Memo1.Lines.Add(sline);

    for ii := 0 to RTPedagogueByMonth1.Count - 1 do
    begin
      StrGroupChildName := RTPedagogueByMonth1[ii].ValueStrByName('GROUP_NAME');
      StrProgram := RTPedagogueByMonth1[ii].ValueStrByName
        ('SHORT_NAME_PROGRAM');
      CountHoursWeek := RTPedagogueByMonth1[ii].ValueStrByName('AMOUNT_WEEK');
      CountHoursMonth := RTPedagogueByMonth1[ii].ValueStrByName('COUNT_HOURS');
      Percent := RTPedagogueByMonth1[ii].ValueStrByName('PERCENT');
      sline := '';
      sline := IntToStr(ii + 1) + #9 + StrGroupChildName + #9 + StrProgram + #9
        + CountHoursWeek + #9
        + CountHoursMonth + #9 + Percent;
      Memo1.Lines.Add(sline);
    end;
    Memo1.Lines.Add('');
    sline := '№' + #9 + 'Программа' + #9 + '' +#9 + 'часов/нед' + #9 + 'часов/мес'
      + #9 + '%';
    Memo1.Lines.Add(sline);
    for i := 0 to RTPedagogueByMonth2.Count - 1 do
    begin
      sline := '';
      sline := IntToStr(i + 1) + #9 + RTPedagogueByMonth2[i].ValueStrByName
        ('NAME_PROGRAM_') + #9 + '' + #9 +
      // часов/нед
        RTPedagogueByMonth2[i].ValueStrByName('AMOUNT_WEEK_') + #9 +
      // часов/мес
        RTPedagogueByMonth2[i].ValueStrByName('COUNT_HOURS_') + #9 +
        RTPedagogueByMonth2[i].ValueStrByName('PERCENT_');
      Memo1.Lines.Add(sline);
    end;

    // for i := 0 to RT.Count - 1 do
    // with ListView.Items.Add do
    // begin
    // Caption := IntToStr(i + 1);
    // SubItems.Add(RT[i].ValueStrByName('NAME_PROGRAM_'));
    // SubItems.Add(RT[i].ValueStrByName('COUNT_HOURS_'));
    // SubItems.Add(RT[i].ValueStrByName('PERCENT_'));

    // if not VarIsNull(RT[i].ValueByName('COUNT_HOURS_')) then
    // count_hours := count_hours + RT[i].ValueByName('COUNT_HOURS_');
    // if not VarIsNull(RT[i].ValueByName('PERCENT_')) then
    // percent := percent + RT[i].ValueByName('PERCENT_')
    // end;
    // percent := percent * 100 / RT.Count;
    // with ListView.Items.Add do
    // begin
    // SubItems.Add('Все программы');
    // SubItems.Add(IntToStr(count_hours));
    // SubItems.Add(FloatToStrF(percent, ffFixed, 5, 2));
    // end;

    Memo1.SelectAll;
    Memo1.CopyToClipboard;
    ExcelApp.Workbooks[1].WorkSheets[1].Paste;
    // формирую имя будущего файла
    Delete(PedSurname, Length(PedSurname) - 4, 5);
    ExcelFileName := CurAcademicYear + PedSurname +
      ' - Объем реадизации ДОП за ' + cbMonth.Text;
    WorkBook.SaveAs(ExtractFilePath(ParamStr(0)) + ExcelFileName);
    // ExcelApp.WorkBooks[1].WorkSheets[1].range['A2:F9'].Select;
    ExcelApp.Visible := true;
  finally
  end;

end;

procedure TfRealisationVolume.Button1Click(Sender: TObject);
begin
  lvPedagogueByYear1.Columns[13].Width := 50;
end;

procedure TfRealisationVolume.cbMonthChange(Sender: TObject);
begin
  if cbMonth.ItemIndex <= 3 then
    MonthNumber := cbMonth.ItemIndex + 9
  else
    MonthNumber := cbMonth.ItemIndex - 3;
  ShowByMonth;
end;

procedure TfRealisationVolume.cmbAcademicYearChange(Sender: TObject);
begin
  IDAcademicYear := AcademicYear[cmbAcademicYear.ItemIndex].ValueByName('ID');
  ShowByMonth;
end;

procedure TfRealisationVolume.cmbPedagogueChange(Sender: TObject);
begin
  IDPedagogue := PedagogueSurnameNP[cmbPedagogue.ItemIndex].ValueByName
    ('ID_OUT');
  ShowByMonth;
  ShowBySemester;
  ShowBySemesterII;
end;

procedure TfRealisationVolume.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  PedagogueSurnameNP := nil;
  RTPedagogueByMonth1 := nil;
  RTPedagogueByMonth2 := nil;
  RTPedagogueBySemester1 := nil;
  RTPedagogueBySemester2 := nil;
  RTPedagogueBySemesterII1 := nil;
  RTPedagogueBySemesterII2 := nil;
  RTdhsBySemester1 := nil;
  RTdhsBySemester2 := nil;
  RTdhsBySemesterII1 := nil;
  RTdhsBySemesterII1 := nil;
end;

procedure TfRealisationVolume.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(RTPedagogueByMonth1) then
    FreeAndNil(RTPedagogueByMonth1);
  if Assigned(RTPedagogueByMonth2) then
    FreeAndNil(RTPedagogueByMonth2);

  if Assigned(RTPedagogueBySemester1) then
    FreeAndNil(RTPedagogueBySemester1);
  if Assigned(RTPedagogueBySemester2) then
    FreeAndNil(RTPedagogueBySemester2);
  if Assigned(RTPedagogueBySemesterII1) then
    FreeAndNil(RTPedagogueBySemesterII1);
  if Assigned(RTPedagogueBySemesterII2) then
    FreeAndNil(RTPedagogueBySemesterII2);

  if Assigned(RTdhsBySemester1) then
    FreeAndNil(RTdhsBySemester1);
  if Assigned(RTdhsBySemester2) then
    FreeAndNil(RTdhsBySemester2);
  if Assigned(RTdhsBySemesterII1) then
    FreeAndNil(RTdhsBySemesterII1);
  if Assigned(RTdhsBySemesterII2) then
    FreeAndNil(RTdhsBySemesterII2);
end;

procedure TfRealisationVolume.FormShow(Sender: TObject);
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDAcademicYear);
  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP, 'SurnameNP', false);
  Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue);
  // определяю текущий месяц и в зависимости от ея выбираю строку в cb
  MonthNumber := MonthOf(Now);
  if (MonthNumber <= 5) or (MonthNumber >= 9) then
    if MonthNumber >= 9 then
      cbMonth.ItemIndex := MonthNumber - 9
    else if MonthNumber <= 5 then
      cbMonth.ItemIndex := MonthNumber + 3
    else
      cbMonth.ItemIndex := 8;

  ShowByMonth;
  ShowBySemester;
  ShowBySemesterII;
end;

procedure TfRealisationVolume.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfRealisationVolume.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfRealisationVolume.ShowByMonth;
begin
  if Assigned(RTPedagogueByMonth1) then
    FreeAndNil(RTPedagogueByMonth1);
  RTPedagogueByMonth1 := Kernel.GetVolumeRealByMonthPed(IDPedagogue,
    IDAcademicYear, 0, MonthNumber);
  Kernel.GetLVPedagogueByMonth1(lvPedagogueByMonth1, RTPedagogueByMonth1);

  if Assigned(RTPedagogueByMonth2) then
    FreeAndNil(RTPedagogueByMonth2);
  RTPedagogueByMonth2 := Kernel.GetVolumeRealByProgrMonthPed(IDPedagogue,
    IDAcademicYear, MonthNumber);
  Kernel.GetLVPedagogueByMonth2(lvPedagogueByMonth2, RTPedagogueByMonth2);
end;

procedure TfRealisationVolume.ShowBySemester;
begin
//    RTdhsBySemester1, RTdhsBySemester2: TResultTable;

  if Assigned(RTPedagogueBySemester1) then
    FreeAndNil(RTPedagogueBySemester1);
  RTPedagogueBySemester1 := Kernel.GetVolumeRealBySemesterPed(IDPedagogue,
    IDAcademicYear, 0, 12); // [id_pedagogue,id_academic_year,id_program, last_month_semester]
  Kernel.GetLVPedagogueBySemester1(lvPedagogueByYear1, RTPedagogueBySemester1);

  if Assigned(RTPedagogueBySemester2) then
    FreeAndNil(RTPedagogueBySemester2);
  RTPedagogueBySemester2 := Kernel.GetVolumeRealByProgrSemesterPed(IDPedagogue,
    IDAcademicYear, 12); // чтобы получить данные за 1 полугодие, нужно выбрать группы по состоянию на декабрь
  Kernel.GetLVPedagogueBySemester2(lvPedagogueByYear2, RTPedagogueBySemester2);

  if Assigned(RTdhsBySemester1) then
    FreeAndNil(RTdhsBySemester1);
  RTdhsBySemester1 := Kernel.GetVolumeRealByPedSemesterDHS(0,
    IDAcademicYear, 12); // чтобы получить данные за 1 полугодие, нужно выбрать группы по состоянию на декабрь
  Kernel.GetLVByPedSemesterDHS(lvDHSByYear1, RTdhsBySemester1);

  if Assigned(RTdhsBySemester2) then
    FreeAndNil(RTdhsBySemester2);
  RTdhsBySemester2 := Kernel.GetVolumeRealByProgrSemesterPed(0,
    IDAcademicYear, 12); // чтобы получить данные за 1 полугодие, нужно выбрать группы по состоянию на декабрь
  Kernel.GetLVPedagogueBySemester2(lvDHSByYear2, RTdhsBySemester2);

end;

procedure TfRealisationVolume.ShowBySemesterII;
begin
  if Assigned(RTPedagogueBySemesterII1) then
    FreeAndNil(RTPedagogueBySemesterII1);
  RTPedagogueBySemesterII1 := Kernel.GetVolumeRealBySemesterPed(IDPedagogue,
    IDAcademicYear, 0, 5); // [id_pedagogue,id_academic_year,id_program, last_month_semester]
  Kernel.GetLVPedagogueBySemesterII1(lvPedagogueByYearII1, RTPedagogueBySemesterII1);

  if Assigned(RTPedagogueBySemesterII2) then
    FreeAndNil(RTPedagogueBySemesterII2);
  RTPedagogueBySemesterII2 := Kernel.GetVolumeRealByProgrSemesterPed(IDPedagogue,
    IDAcademicYear, 5); // чтобы получить данные за 2 полугодие, нужно выбрать группы по состоянию на май
  Kernel.GetLVPedagogueBySemesterII2(lvPedagogueByYearII2, RTPedagogueBySemesterII2);

  if Assigned(RTdhsBySemesterII1) then
    FreeAndNil(RTdhsBySemesterII1);
  RTdhsBySemesterII1 := Kernel.GetVolumeRealByPedSemesterDHS(0,
    IDAcademicYear, 5);
  Kernel.GetLVByPedSemesterIIDHS(lvDHSByYearII1, RTdhsBySemesterII1);

  if Assigned(RTdhsBySemesterII2) then
    FreeAndNil(RTdhsBySemesterII2);
  RTdhsBySemesterII2 := Kernel.GetVolumeRealByProgrSemesterPed(0,
    IDAcademicYear, 5);
  Kernel.GetLVPedagogueBySemesterII2(lvDHSByYearII2, RTdhsBySemesterII2);
end;

end.
