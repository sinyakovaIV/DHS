unit frmSmallLearningGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfSmallLearningGroup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lvSmallLearningGroup: TListView;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    bClose: TButton;
    bSave: TButton;
    bNewRecord: TButton;
    bGroupMembers: TButton;
    bDeleteGroup: TButton;
    cmbChooseAcademicYear: TComboBox;
    cmbChooseEducationProgram: TComboBox;
    cmbChoosePedagogue: TComboBox;
    cmbChooseStatus: TComboBox;
    cmbAcademicYear: TComboBox;
    cmbEducationProgram: TComboBox;
    cmbHoursAmount: TComboBox;
    cmbLearningForm: TComboBox;
    cmbLearningLevel: TComboBox;
    cmbPedagogue: TComboBox;
    cmbStatus: TComboBox;
    eGroupName: TEdit;
    Label10: TLabel;
    procedure bDeleteGroupeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvSmallLearningGroupSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure bNewRecordClick(Sender: TObject);
    procedure lvSmallLearningGroupCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure cmbChooseEducationProgramChange(Sender: TObject);
    procedure cmbChoosePedagogueChange(Sender: TObject);
    procedure cmbChooseAcademicYearChange(Sender: TObject);
    procedure cmbChooseLearningFormChange(Sender: TObject);
    procedure cmbChooseStatusChange(Sender: TObject);
    procedure bGroupMembersClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);

  private
    AcademicYear: TResultTable;
    EducationProgram: TResultTable;
    PedagogueSurnameNP: TResultTable;
    StatusLearningGroup: TResultTable;
    SmallLearnGroupList: TResultTable;
    LearningLevel: TResultTable;
    AmountHours: TResultTable;
    GroupeName: TResultTable;
    LearningForm: TResultTable;
    NewIDSmallLG: TResultTable;
    FIDPedagogue: integer;
    FIDCurAcademicYear: integer;
    IDLearningGroup: integer;
    procedure ShowSmallLearnGrList;
    procedure OnChangeCMBsSetProperties;
    /// //////////////function ChangeCMBsSetProperties: Array of integer; ??????
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDCurAcademicYear(const Value: integer);
    procedure DoClearSmallLearnGroup;
  public
    // IDLearningGroup: integer;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDCurAcademicYear: integer read FIDCurAcademicYear
      write SetIDCurAcademicYear;
  end;

var
  fSmallLearningGroup: TfSmallLearningGroup;

implementation

{$R *.dfm}

uses frmSmallLearnGrMembers;

procedure TfSmallLearningGroup.bGroupMembersClick(Sender: TObject);
begin
  if (not Assigned(fSmallLearnGrMembers)) then
    fSmallLearnGrMembers := TfSmallLearnGrMembers.Create(Self);
  fSmallLearnGrMembers.ShowModal;
  if fSmallLearnGrMembers.ModalResult = mrOk then
    ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.bNewRecordClick(Sender: TObject);
begin
  IDLearningGroup := -1;
  DoClearSmallLearnGroup;
end;

procedure TfSmallLearningGroup.bSaveClick(Sender: TObject);
var
  idLearningForm, idEducationProgram, id_Pedagogue, idLearningLevel,
    idAcademicYear, idStatusLearningGroup, Amount_Hours: integer;
  GName: string;
begin
// при сохранении изменений создается новая группа, а не вносятся изменения
  idLearningForm := LearningForm[cmbLearningForm.ItemIndex].ValueByName('ID');
  idEducationProgram := EducationProgram[cmbEducationProgram.ItemIndex]
    .ValueByName('ID');
  id_Pedagogue := PedagogueSurnameNP[cmbPedagogue.ItemIndex].ValueByName
    ('ID_OUT');
  idLearningLevel := LearningLevel[cmbLearningLevel.ItemIndex]
    .ValueByName('ID');
  idAcademicYear := AcademicYear[cmbAcademicYear.ItemIndex].ValueByName('ID');
  idStatusLearningGroup := StatusLearningGroup[cmbStatus.ItemIndex]
    .ValueByName('CODE');
  Amount_Hours := AmountHours[cmbHoursAmount.ItemIndex].ValueByName
    ('WEEK_AMOUNT');
  GName := 'Временное название.';
  if (cmbEducationProgram.ItemIndex = -1) or (cmbPedagogue.ItemIndex = -1) or
    (cmbAcademicYear.ItemIndex = -1) or (cmbLearningForm.ItemIndex = -1) or
    (cmbStatus.ItemIndex = -1) or (cmbLearningLevel.ItemIndex = -1) or
    (cmbHoursAmount.ItemIndex = -1) then
  begin
    ShowMessage('Не все поля заполнены!');
    Exit;
  end;
//  if Kernel.SaveLearningGroup([IDLearningGroup, idLearningForm,
//    idEducationProgram, id_Pedagogue, idLearningLevel, idAcademicYear,
//    idStatusLearningGroup, Amount_Hours, GName]) then
//  begin
//    ShowMessage('Сохранение выполнено!');
    if Assigned(NewIDSmallLG) then
    FreeAndNil(NewIDSmallLG);
      NewIDSmallLG := Kernel.GetIDSmallLearnGroup(IDLearningGroup,
        idLearningForm, idEducationProgram, id_Pedagogue, idLearningLevel,
        idAcademicYear, idStatusLearningGroup, Amount_Hours, GName);
    if (not Assigned(fSmallLearnGrMembers)) then // стр 110 тоже создание формы
      fSmallLearnGrMembers := TfSmallLearnGrMembers.Create(Self);
    if NewIDSmallLG.Count > 0 then
      fSmallLearnGrMembers.IDLearningGroup := NewIDSmallLG[0]
        .ValueByName('ID_OUT');
    fSmallLearnGrMembers.GName := GName;
    fSmallLearnGrMembers.ShowModal;
    if fSmallLearnGrMembers.ModalResult = mrOk then
      ShowSmallLearnGrList;
//  end
//  else
//    ShowMessage('Ошибка при сохранении!');
end;

procedure TfSmallLearningGroup.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfSmallLearningGroup.bDeleteGroupeClick(Sender: TObject);
begin
//TODO: продумать удаление группы, ведь в нее могут быть зачислены дети и привязано расписание
  if Kernel.DeleteGroup([fSmallLearnGrMembers.IDLearningGroup]) then
  begin
    ShowMessage('Группа удалена!'); // МОЖЕТ НЕ СТОИТ ВЫВОДИТЬ ЭТО СООБЩЕНИЕ!!???
    ShowSmallLearnGrList; // для обновления осн.сведений
  end
  else
    ShowMessage('Ошибка при удалении группы!');
end;

procedure TfSmallLearningGroup.cmbChooseAcademicYearChange(Sender: TObject);
begin
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.cmbChooseEducationProgramChange(Sender: TObject);
begin
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.cmbChooseLearningFormChange(Sender: TObject);
begin
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.cmbChoosePedagogueChange(Sender: TObject);
begin
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.cmbChooseStatusChange(Sender: TObject);
begin
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.DoClearSmallLearnGroup;
var
  i: integer;
begin
  cmbHoursAmount.ItemIndex := 0; // мелкогрупповые обычно по часу
  cmbLearningLevel.ItemIndex := -1;
  cmbStatus.ItemIndex := 2;   // статус "группы" при очистке всегда предварительная/о - еще подумать..
  cmbLearningForm.ItemIndex := 1; // форма обучения всегда мелкогрупповая
  cmbLearningForm.Enabled := false;
// комбик с учебным годом после очистки должен содержать текущий учебный год
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDCurAcademicYear);
// комбик с педагогом должен содержать педагога из cmbChoosePedagogue, а если там 'Все'
// то по выбираю по IDPedagogue
  if cmbChoosePedagogue.ItemIndex = 0 then
    Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue) else
    cmbPedagogue.ItemIndex := cmbChoosePedagogue.ItemIndex - 1;
  cmbEducationProgram.ItemIndex := -1;
  eGroupName.Clear;
end;

procedure TfSmallLearningGroup.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  EducationProgram := nil;
  PedagogueSurnameNP := nil;
  StatusLearningGroup := nil;
  SmallLearnGroupList := nil;

  LearningLevel := nil;
  AmountHours := nil;
  GroupeName := nil; // ?????
  LearningForm := nil;
  NewIDSmallLG := nil;
end;

procedure TfSmallLearningGroup.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(EducationProgram) then
    FreeAndNil(EducationProgram);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(StatusLearningGroup) then
    FreeAndNil(StatusLearningGroup);
  if Assigned(SmallLearnGroupList) then
    FreeAndNil(SmallLearnGroupList);

  if Assigned(LearningLevel) then
    FreeAndNil(LearningLevel);
  if Assigned(AmountHours) then
    FreeAndNil(AmountHours);
  if Assigned(GroupeName) then // ???
    FreeAndNil(GroupeName);
  if Assigned(LearningForm) then
    FreeAndNil(LearningForm);
  if Assigned(NewIDSmallLG) then
    FreeAndNil(NewIDSmallLG);
end;

procedure TfSmallLearningGroup.FormShow(Sender: TObject);
var
  i: integer;
begin

  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbChooseAcademicYear, AcademicYear, 'NAME', true);
  Kernel.ChooseComboBoxItemIndex(cmbChooseAcademicYear, AcademicYear, true,
    'ID', IDCurAcademicYear);
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
//  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
//    IDCurAcademicYear);

  if not Assigned(EducationProgram) then
    EducationProgram := Kernel.GetEducationProgram;
  Kernel.FillingComboBox(cmbChooseEducationProgram, EducationProgram,
    'NAME', true);
  cmbChooseEducationProgram.ItemIndex := 0;
  Kernel.FillingComboBox(cmbEducationProgram, EducationProgram, 'NAME', false);
//  Kernel.ChooseComboBoxItemIndex(cmbEducationProgram, EducationProgram, true,
//    'ID', IDCurAcademicYear);

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbChoosePedagogue, PedagogueSurnameNP,
    'SurnameNP', true);
  Kernel.ChooseComboBoxItemIndex(cmbChoosePedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue);
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP, 'SurnameNP', false);
//  Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
//    'ID_OUT', IDPedagogue);

  if not Assigned(LearningLevel) then
    LearningLevel := Kernel.GetLearningLevel;
  Kernel.FillingComboBox(cmbLearningLevel, LearningLevel, 'NAME', false);
//  Kernel.ChooseComboBoxItemIndex(cmbLearningLevel, LearningLevel, true, 'ID',
//    IDCurAcademicYear);

  if not Assigned(AmountHours) then
    AmountHours := Kernel.GetAmountHours;
  Kernel.FillingComboBox(cmbHoursAmount, AmountHours, 'WEEK_AMOUNT', false);
  cmbHoursAmount.ItemIndex := 0;

  if not Assigned(LearningForm) then
    LearningForm := Kernel.GetLearningForm;
  Kernel.FillingComboBox(cmbLearningForm, LearningForm, 'NAME', false);
  cmbLearningForm.ItemIndex := 1; // всегда мелкогрупповая
  cmbLearningForm.Enabled := false;

  if not Assigned(StatusLearningGroup) then
    StatusLearningGroup := Kernel.GetStatusLearningGroup(3);
  Kernel.FillingComboBox(cmbChooseStatus, StatusLearningGroup, 'NOTE', true);
  cmbChooseStatus.ItemIndex := 0;
  Kernel.FillingComboBox(cmbStatus, StatusLearningGroup, 'NOTE', false);
//  cmbStatus.ItemIndex := 0;

  eGroupName.Enabled := false;
  ShowSmallLearnGrList;
end;

procedure TfSmallLearningGroup.lvSmallLearningGroupCustomDrawItem
  (Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.SubItems.Strings[5] = 'Расформированная' then
    Sender.Canvas.Brush.Color := 6521080; {
    Sender.Canvas.Brush.Color := 	$00FF0000;
    else
    Sender.Canvas.Brush.Color := clWindow; }
  // if Item.Selected { in State } then
  // Sender.Canvas.Brush.Color := 6521080 // ан не работает...
end;

procedure TfSmallLearningGroup.lvSmallLearningGroupSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  i, education_program, pedagogue, academic_year, learning_group_type,
    status: integer;
begin
    if (not Assigned(fSmallLearnGrMembers)) then
      fSmallLearnGrMembers := TfSmallLearnGrMembers.Create(Self);
  with SmallLearnGroupList[Item.Index] do
  begin
    fSmallLearnGrMembers.IDLearningGroup := ValueByName('ID_OUT');
    fSmallLearnGrMembers.idAcademicYear := ValueByName('ID_ACADEMIC_YEAR');
    fSmallLearnGrMembers.idEducationProgram :=
      ValueByName('ID_EDUCATION_PROGRAM'); // ???
    fSmallLearnGrMembers.IDPedagogue := ValueByName('ID_PEDAGOGUE'); // ???
    fSmallLearnGrMembers.StrEducationProgram :=
      ValueStrByName('EDUCATION_PROGRAM');
    fSmallLearnGrMembers.StrPedagogue := ValueStrByName('SURNAMENP');
    fSmallLearnGrMembers.StrAcademicYear := ValueStrByName('ACADEMIC_YEAR');
    fSmallLearnGrMembers.StrLearningLevel := ValueStrByName('LEARNING_LEVEL');
    fSmallLearnGrMembers.GName := ValueStrByName('NAME');
  end;
  eGroupName.Text := SmallLearnGroupList[Item.Index].ValueByName('NAME');
// здесь меняю индексы у "нижних" комбиков - перенести в процедуры cmbChoose...Change
  for i := 0 to StatusLearningGroup.Count - 1 do
    if StatusLearningGroup[i].ValueByName('CODE') = SmallLearnGroupList
      [Item.Index].ValueByName('ID_STATUS') then
      cmbStatus.ItemIndex := i;
  for i := 0 to LearningLevel.Count - 1 do
    if LearningLevel[i].ValueByName('ID') = SmallLearnGroupList[Item.Index]
      .ValueByName('ID_LEARNING_LEVEL') then
      cmbLearningLevel.ItemIndex := i;
  for i := 0 to AmountHours.Count - 1 do
    if AmountHours[i].ValueByName('WEEK_AMOUNT') = SmallLearnGroupList
      [Item.Index].ValueByName('ID_WEEK_AMOUNT') then
      cmbHoursAmount.ItemIndex := i;
  for i := 0 to EducationProgram.Count - 1 do
    if EducationProgram[i].ValueByName('ID') = fSmallLearnGrMembers.idEducationProgram
    then
      cmbEducationProgram.ItemIndex := i;
  for i := 0 to PedagogueSurnameNP.Count - 1 do
    if PedagogueSurnameNP[i].ValueByName('ID_OUT') = fSmallLearnGrMembers.IDPedagogue
    then
      cmbPedagogue.ItemIndex := i;
  for i := 0 to AcademicYear.Count - 1 do
    if AcademicYear[i].ValueByName('ID') = fSmallLearnGrMembers.idAcademicYear
    then
      cmbAcademicYear.ItemIndex := i;
end;

// TODO: ВМЕСТО ПРОЦЕДУРЫ ЗАМУТИТЬ ФУНКЦИЮ, возвращающую целочисленный массив?????????
procedure TfSmallLearningGroup.OnChangeCMBsSetProperties;
var
  education_program, pedagogue, academic_year, learning_group_type,
    status: integer;
begin
//  if cmbChooseEducationProgram.ItemIndex = 0 then
//    education_program := 0
//  else
//    education_program := EducationProgram[cmbChooseEducationProgram.ItemIndex -
//      1].ValueByName('ID');
//
//  if cmbChoosePedagogue.ItemIndex = 0 then
//    pedagogue := 0
//  else
//    pedagogue := PedagogueSurnameNP[cmbChoosePedagogue.ItemIndex - 1]
//      .ValueByName('ID_OUT');
//  if cmbChooseAcademicYear.ItemIndex = 0 then
//    academic_year := 0
//  else
//    academic_year := AcademicYear[cmbChooseAcademicYear.ItemIndex - 1]
//      .ValueByName('ID');
//  if cmbChooseStatus.ItemIndex = 0 then
//    status := 0
//  else
//    status := StatusLearningGroup[cmbChooseStatus.ItemIndex - 1]
//      .ValueByName('CODE');
//  if (not Assigned(fSmallLearnGrMembers)) then
//    fSmallLearnGrMembers := TfSmallLearnGrMembers.Create(Self);
//  fSmallLearnGrMembers.idEducationProgram := education_program;
//  fSmallLearnGrMembers.IDPedagogue := pedagogue;
end;

procedure TfSmallLearningGroup.SetIDCurAcademicYear(const Value: integer);
begin
  if FIDCurAcademicYear <> Value then
    FIDCurAcademicYear := Value;
end;

procedure TfSmallLearningGroup.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfSmallLearningGroup.ShowSmallLearnGrList;
var
  i, education_program, pedagogue, academic_year, learning_group_type,
    status: integer;
begin
  if cmbChooseEducationProgram.ItemIndex = 0 then
    education_program := 0
  else
  begin
    education_program := EducationProgram[cmbChooseEducationProgram.ItemIndex -
      1].ValueByName('ID');
    //
    // for i := 0 to EducationProgram.Count - 1 do
    // if EducationProgram[i].ValueByName('ID') = education_program then
    // cmbEducationProgram.ItemIndex := i;
    //
  end;
  if cmbChoosePedagogue.ItemIndex = 0 then
    pedagogue := 0
  else
  begin
    pedagogue := PedagogueSurnameNP[cmbChoosePedagogue.ItemIndex - 1]
      .ValueByName('ID_OUT');
    //
    // for i := 0 to PedagogueSurnameNP.Count - 1 do
    // if PedagogueSurnameNP[i].ValueByName('ID_OUT') = pedagogue then
    // cmbPedagogue.ItemIndex := i;
    //
  end;
  if cmbChooseAcademicYear.ItemIndex = 0 then
    academic_year := 0
  else
  begin
    academic_year := AcademicYear[cmbChooseAcademicYear.ItemIndex - 1]
      .ValueByName('ID');
    //
    // for i := 0 to AcademicYear.Count - 1 do
    // if AcademicYear[i].ValueByName('ID') = academic_year then
    // cmbAcademicYear.ItemIndex := i;
    //
  end;
  if cmbChooseStatus.ItemIndex = 0 then
    status := 0
  else
    status := StatusLearningGroup[cmbChooseStatus.ItemIndex - 1]
      .ValueByName('CODE');
  learning_group_type := 2; // я не получаю программно этот тип, а закладываю
  // вручную - несовершенство, с которым нужно смириться? как изменить не знаю пока
  OnChangeCMBsSetProperties;
  if Assigned(SmallLearnGroupList) then
    FreeAndNil(SmallLearnGroupList);
  SmallLearnGroupList := Kernel.GetLearningGroupList(education_program,
    pedagogue, academic_year, learning_group_type, status);
  Kernel.GetLVSmallLearningGroup(lvSmallLearningGroup, SmallLearnGroupList);
  if lvSmallLearningGroup.Items.Count > 0 then
  begin
    lvSmallLearningGroup.ItemIndex := 0;
    bGroupMembers.Enabled := true;
    bDeleteGroup.Enabled := true;
  end
  else
  begin
    IDLearningGroup := -1;
    DoClearSmallLearnGroup;
    bGroupMembers.Enabled := false;
    bDeleteGroup.Enabled := false;
  end;
end;

end.
