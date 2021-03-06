unit frmTimesheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, dbfunc, uKernel, Vcl.Mask;

type
  TfTimesheet = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    cmbChooseAcademicYear: TComboBox;
    cmbChoosePedagogue: TComboBox;
    lvTimesheet: TListView;
    lvGroupChild: TListView;
    GroupBox3: TGroupBox;
    bChange: TButton;
    Panel4: TPanel;
    bDelete: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cmbChooseOrder2: TComboBox;
    bInsert: TButton;
    Panel3: TPanel;
    cmbWeekday: TComboBox;
    Label5: TLabel;
    Button4: TButton;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    meStateOnDay: TMaskEdit;
    bToShow: TButton;
    chbAllRecord: TCheckBox;
    bReplace: TButton;
    Label8: TLabel;
    cmbChooseOrder1: TComboBox;
    procedure Button4Click(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvGroupChildSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cmbChoosePedagogueChange(Sender: TObject);
    procedure cmbChooseAcademicYearChange(Sender: TObject);
    procedure bInsertClick(Sender: TObject);
    procedure lvTimesheetSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure bDeleteClick(Sender: TObject);
    procedure lvTimesheetCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbAllRecordClick(Sender: TObject);
    procedure cmbChooseOrder2Change(Sender: TObject);
    procedure bToShowClick(Sender: TObject);
    procedure bReplaceClick(Sender: TObject);
    procedure cmbWeekdayChange(Sender: TObject);
  private
    TimesheetList: TResultTable;
    LearningGroupChildList: TResultTable;
    PedagogueSurnameNP: TResultTable;
    AcademicYear: TResultTable;
    Weekday: TResultTable;
    OrderList: TResultTable;
    FIDPedagogue: integer;
    FIDCurAcademicYear: integer;
    StrDateEndingByOrder: string;
    StrDateEndingByTableTimesgeet: string;
    procedure ShowGroupChildListForTimesheet;
    procedure ShowTimesheetList(const in_status: integer;
      const state_on_day: string);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDCurAcademicYear(const Value: integer);
    procedure AllOrNotAll;
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDCurAcademicYear: integer read FIDCurAcademicYear
      write SetIDCurAcademicYear;
  end;

var
  fTimesheet: TfTimesheet;

implementation

{$R *.dfm}
// TODO: ���������� ������ ������������ ���-����, �� ��������� ��������� ������ � �� �������
// TODO: ���� ������� ���������� �����, �� ������ ������ �� ��������

uses frmTimesheetEdit;

procedure TfTimesheet.AllOrNotAll;
begin
  if chbAllRecord.Checked then
  begin
    ShowTimesheetList(0, meStateOnDay.Text);
    // meStateOnDay.Clear;
  end
  else
    ShowTimesheetList(1, meStateOnDay.Text);
end;

procedure TfTimesheet.bChangeClick(Sender: TObject);
begin
  if TimesheetList.Count > 0 then
  begin
    if Panel4.Caption = '' then
    begin
      ShowMessage('�������� ������ � �����������!');
      Exit;
    end;
    if fTimesheetEdit.Status <> 3 then
    begin
      ShowMessage('��������! ���������� ��� �������������� �������������' +
        #13#10 + '������ ��� ���������������� ����������!');
      Exit;
    end;
    if (not Assigned(fTimesheetEdit)) then
      fTimesheetEdit := TfTimesheetEdit.Create(Self);
    fTimesheetEdit.NewRecord := false;
    fTimesheetEdit.ShowModal;
    if fTimesheetEdit.ModalResult = mrOk then
    begin
      ShowGroupChildListForTimesheet;
      AllOrNotAll;
    end;
  end
  else
    ShowMessage('��� ������� ��� �������������� ����������!');
end;

procedure TfTimesheet.bDeleteClick(Sender: TObject);
begin
  // ��� �������� ������ ������������ �������� �� ������� ��������� � ����������� ������� � �������
  // ��������� �������� ������������� ����������, �� ������ ��� ������ - �������� ���
  if Panel4.Caption = '' then
  begin
    ShowMessage('�������� ������ � �����������!');
    Exit;
  end;
  if fTimesheetEdit.Status <> 3 then
  begin
    ShowMessage('��������! �������� �������������' + #13#10 +
      '������ ��� ���������������� ����������!');
    Exit;
  end;
  if Kernel.DeleteTimesheet([fTimesheetEdit.IDTimesheet]) then
  begin
    ShowMessage('������ �������!');
    // ����� �� ����� �������� ��� ���������!!???
  end
  else
    ShowMessage('������ ��� �������� ������!');
  ShowGroupChildListForTimesheet;
  AllOrNotAll;
end;

procedure TfTimesheet.bInsertClick(Sender: TObject);
begin
  if OrderList.Count = 0 then
  begin
    ShowMessage('��������� ������ �������� �� ����������� ����������!');
    Exit;
  end;

  if LearningGroupChildList.Count > 0 then
  begin
    if Panel3.Caption = '' then
    begin
      ShowMessage('�������� ������ � �������/��������!');
      Exit;
    end;
    if (not Assigned(fTimesheetEdit)) then
      fTimesheetEdit := TfTimesheetEdit.Create(Self);
    fTimesheetEdit.NewRecord := true;
    fTimesheetEdit.IDTimesheet := -1;
    fTimesheetEdit.IDOrderEstablisht := OrderList[cmbChooseOrder2.ItemIndex]
      .ValueByName('ID_OUT');
    fTimesheetEdit.ShowModal;
    if fTimesheetEdit.ModalResult = mrOk then
    begin
      ShowGroupChildListForTimesheet;
      AllOrNotAll;
    end;
  end
  else
    ShowMessage('��� ������� ��� ����������� ����������!');
end;

procedure TfTimesheet.bReplaceClick(Sender: TObject);
var
  in_id, old_status: integer;
begin
  if LearningGroupChildList.Count > 0 then
  begin
    if Panel4.Caption = '' then
    begin
      ShowMessage('�������� ������ � �����������!');
      Exit;
    end;
    in_id := fTimesheetEdit.IDTimesheet;
    old_status := 2;
    StrDateEndingByOrder :=
      DateToStr(StrToDate(OrderList[cmbChooseOrder1.ItemIndex].ValueStrByName
      ('DATE_EVENT')) - 1);
    if Kernel.UpdateTimesheet([in_id, old_status, StrDateEndingByOrder]) then
    begin
      ShowMessage('������ ����������� ���������� ������� �� "��������"!');
      // Exit;
    end
    else
    begin
      ShowMessage('������ ��� ����������!');
      Exit;
    end;

    if (not Assigned(fTimesheetEdit)) then
      fTimesheetEdit := TfTimesheetEdit.Create(Self);
    fTimesheetEdit.NewRecord := true;
    fTimesheetEdit.IDTimesheet := -1;
    fTimesheetEdit.IDOrderEstablisht := OrderList[cmbChooseOrder1.ItemIndex]
      .ValueByName('ID_OUT');
    fTimesheetEdit.ShowModal;
    if fTimesheetEdit.ModalResult = mrOk then
    begin
      ShowGroupChildListForTimesheet;
      AllOrNotAll;
    end;
  end
  else
    ShowMessage('��� ������� ��� ����������� ����������!');
end;

procedure TfTimesheet.bToShowClick(Sender: TObject);
begin
//  chbAllRecord.Checked := false;
  AllOrNotAll;
end;

procedure TfTimesheet.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TfTimesheet.chbAllRecordClick(Sender: TObject);
begin
  AllOrNotAll;
end;

procedure TfTimesheet.cmbChooseAcademicYearChange(Sender: TObject);
begin
  ShowGroupChildListForTimesheet;
  AllOrNotAll;
end;

procedure TfTimesheet.cmbChooseOrder2Change(Sender: TObject);
begin
  fTimesheetEdit.IDOrderEstablisht := OrderList[cmbChooseOrder2.ItemIndex]
    .ValueByName('ID_OUT');
end;

procedure TfTimesheet.cmbChoosePedagogueChange(Sender: TObject);
begin
  ShowGroupChildListForTimesheet;
  AllOrNotAll;
end;

procedure TfTimesheet.cmbWeekdayChange(Sender: TObject);
begin
  AllOrNotAll;
end;

procedure TfTimesheet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // � ����� �� �� ���������!
  // ModalResult := mrOk;
end;

procedure TfTimesheet.FormCreate(Sender: TObject);
begin
  Weekday := nil;
  AcademicYear := nil;
  PedagogueSurnameNP := nil;
  LearningGroupChildList := nil;
  TimesheetList := nil;
  OrderList := nil;
end;

procedure TfTimesheet.FormDestroy(Sender: TObject);
begin
  if Assigned(Weekday) then
    FreeAndNil(Weekday);
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(LearningGroupChildList) then
    FreeAndNil(LearningGroupChildList);
  if Assigned(OrderList) then
    FreeAndNil(OrderList);
  if Assigned(TimesheetList) then
    FreeAndNil(TimesheetList);
end;

procedure TfTimesheet.FormShow(Sender: TObject);
var
  i: integer;
begin

  meStateOnDay.Text := DateToStr(Date);

  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbChooseAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbChooseAcademicYear, AcademicYear, true,
    'ID', IDCurAcademicYear);

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbChoosePedagogue, PedagogueSurnameNP,
    'SurnameNP', false);
  Kernel.ChooseComboBoxItemIndex(cmbChoosePedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue);

  if not Assigned(Weekday) then
    Weekday := Kernel.GetWeekday;
  Kernel.FillingComboBox(cmbWeekday, Weekday, 'NAME', true);
  cmbWeekday.ItemIndex := 0;

  if not Assigned(OrderList) then
    OrderList := Kernel.GetOrderListForTimesheet(IDCurAcademicYear);
  Kernel.FillingComboBox(cmbChooseOrder2, OrderList,
    'NUMBER_DATES_NAME', false);
  cmbChooseOrder2.ItemIndex := 0;

  if not Assigned(OrderList) then
    OrderList := Kernel.GetOrderListForTimesheet(IDCurAcademicYear);
  Kernel.FillingComboBox(cmbChooseOrder1, OrderList,
    'NUMBER_DATES_NAME', false);
  cmbChooseOrder1.ItemIndex := 0;

  ShowGroupChildListForTimesheet;
  AllOrNotAll;
end;

// ������������ ��� ����������� ������ ����������
procedure TfTimesheet.lvGroupChildSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if LearningGroupChildList.Count > 0 then
  begin
    if (not Assigned(fTimesheetEdit)) then
      fTimesheetEdit := TfTimesheetEdit.Create(Self);
    // fTimesheetEdit.StrGroupChildNew := LearningGroupChildList[Item.Index]
    // .ValueStrByName('NAME');
    fTimesheetEdit.StrGroupChild := LearningGroupChildList[Item.Index]
      .ValueStrByName('NAME');
    fTimesheetEdit.IDLearningGroup := LearningGroupChildList[Item.Index]
      .ValueByName('ID_OUT'); // ���������� ID ������ ��� ����-�� -����� �� ����
    // Panel3.Caption := fTimesheetEdit.StrGroupChildNew;

    Panel3.Caption := fTimesheetEdit.StrGroupChild;
    Panel4.Caption := '';

    if OrderList.Count > 0 then

      fTimesheetEdit.IDOrderEstablisht := OrderList[cmbChooseOrder2.ItemIndex]
        .ValueByName('ID_OUT');
  end;
end;

procedure TfTimesheet.lvTimesheetCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.SubItems.Strings[4] = '����������������' then
    Sender.Canvas.Brush.Color := 6521080;
end;

procedure TfTimesheet.lvTimesheetSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if TimesheetList.Count > 0 then // ����� �� ��������,���� ���������� ���������
  begin
    if (not Assigned(fTimesheetEdit)) then
      fTimesheetEdit := TfTimesheetEdit.Create(Self);
    fTimesheetEdit.StrGroupChild := TimesheetList[Item.Index].ValueStrByName
      ('NAME_GROUP_CHILD');
    // ���������� ID ������ ��� ����-��
    fTimesheetEdit.IDLearningGroup := TimesheetList[Item.Index]
      .ValueByName('ID_LEARNING_GROUP');
    Panel4.Caption := fTimesheetEdit.StrGroupChild;
    Panel3.Caption := '';

    fTimesheetEdit.IDTimesheet := TimesheetList[Item.Index].ValueByName
      ('ID_OUT');
    fTimesheetEdit.IDWeekday := TimesheetList[Item.Index].ValueByName
      ('ID_WEEKDAY');
    fTimesheetEdit.IDTimesheetGrid := TimesheetList[Item.Index]
      .ValueByName('ID_TIMESHEET_GRID');
    fTimesheetEdit.LessonLength := TimesheetList[Item.Index].ValueByName
      ('LESSON_LENGTH');
    fTimesheetEdit.IDOrderEstablisht := TimesheetList[Item.Index]
      .ValueByName('ID_ORDER_ESTABLISH');
    // fTimesheetEdit.IDOrderEstablisht := OrderList[cmbChooseOrder2.ItemIndex]
    // .ValueByName('ID_OUT');
    fTimesheetEdit.IDStudyRoom := TimesheetList[Item.Index].ValueByName
      ('ID_STUDY_ROOM');

    // if TimesheetList[Item.Index].ValueStrByName('ID_ACCOMPANIST') = 'null' then
    // ��������� ID ����� ���� null, ���������� ��������������...
    fTimesheetEdit.StrIDAccompanist := TimesheetList[Item.Index].ValueStrByName
      ('ID_ACCOMPANIST');
    fTimesheetEdit.Status := TimesheetList[Item.Index].ValueByName('STATUS');
    fTimesheetEdit.TagTimesheet := TimesheetList[Item.Index].ValueStrByName
      ('TAG_TIMESHEET');
    // ��������� �������� ���������� - ���� ������� ����� ������������� ����������
    // ����� ���� ����
    fTimesheetEdit.StrDateEnding := TimesheetList[Item.Index].ValueStrByName
      ('DATE_ENDING');
    // ������ � ������ ������:     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    StrDateEndingByOrder :=
      DateToStr(StrToDate(OrderList[cmbChooseOrder2.ItemIndex].ValueStrByName
      ('DATE_EVENT')) - 1);

    // StrDateEndingByTableTimesgeet := DateToStr(TimesheetList[Item.Index].ValueStrByName
    // ('DATE_ENDING'));

  end;
end;

procedure TfTimesheet.SetIDCurAcademicYear(const Value: integer);
begin
  if FIDCurAcademicYear <> Value then
    FIDCurAcademicYear := Value;
end;

procedure TfTimesheet.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfTimesheet.ShowGroupChildListForTimesheet;
var
  pedagogue, academic_year: integer;
begin
  pedagogue := PedagogueSurnameNP[cmbChoosePedagogue.ItemIndex]
    .ValueByName('ID_OUT');
  academic_year := AcademicYear[cmbChooseAcademicYear.ItemIndex]
    .ValueByName('ID');
  if Assigned(LearningGroupChildList) then
    FreeAndNil(LearningGroupChildList);
  // ���������� ������ � ����������� �� ���� ����������, ��� ����� ��������, ���������������� � ����������� -�� ����������
  LearningGroupChildList := Kernel.GetLearningGroupList(0, pedagogue,
    academic_year, 0, 0);
  Kernel.GetLVGroupChildListForTimesheet(lvGroupChild, LearningGroupChildList);
  if lvGroupChild.Items.Count > 0 then
  begin
    lvGroupChild.ItemIndex := 0;
    bInsert.Enabled := true;
  end
  else
  begin
    Panel3.Caption := '';
    bInsert.Enabled := false;
  end;
end;

procedure TfTimesheet.ShowTimesheetList(const in_status: integer;
  const state_on_day: string);
var
  in_weekday, in_learning_group, in_study_room, in_pedagogue,
    in_academic_year: integer;
  // in_status: integer; // ������� ����������� ���������� ������� �/� CheckBox
begin
  if cmbWeekday.ItemIndex = 0 then
    in_weekday := 0
  else
    in_weekday := Weekday[cmbWeekday.ItemIndex - 1].ValueByName('ID');
  in_pedagogue := PedagogueSurnameNP[cmbChoosePedagogue.ItemIndex]
    .ValueByName('ID_OUT');
  in_academic_year := AcademicYear[cmbChooseAcademicYear.ItemIndex]
    .ValueByName('ID');
  in_learning_group := 0; // in �������� ��� ����������� ���� ����� � ����������
  in_study_room := 0; // ���������� ��� ���� ���������
  // in_status := 0; // ���������� ������ -�� ���������� (����, � ��� ����� �����)

  if Assigned(TimesheetList) then
    FreeAndNil(TimesheetList);
  TimesheetList := Kernel.GetTimeSheetList(in_weekday, in_learning_group,
    in_study_room, in_pedagogue, in_academic_year, in_status, state_on_day);
  Kernel.GetLVTimesheetList(lvTimesheet, TimesheetList);
  if lvTimesheet.Items.Count > 0 then
  begin
    lvTimesheet.ItemIndex := 0;
    bChange.Enabled := true;
    bDelete.Enabled := true;
    bReplace.Enabled := true;
  end
  else
  begin
    Panel4.Caption := '';
    bChange.Enabled := false;
    bDelete.Enabled := false;
    bReplace.Enabled := false;
  end;
end;

end.
