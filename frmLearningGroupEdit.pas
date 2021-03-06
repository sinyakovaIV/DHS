unit frmLearningGroupEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, dbfunc, uKernel;

type
  TfLearningGroupEdit = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cmbName: TComboBox;
    cmbLearningLevel: TComboBox;
    cmbEducationProgram: TComboBox;
    cmbHoursAmount: TComboBox;
    cmbPedagogue: TComboBox;
    cmbAcademicYear: TComboBox;
    cmbStatus: TComboBox;
    bClose: TButton;
    cmbLearningForm: TComboBox;
    Label1: TLabel;
    bSave: TButton;
    procedure bCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbEducationProgramChange(Sender: TObject);
  private
    AcademicYear: TResultTable;
    EducationProgram: TResultTable;
    PedagogueSurnameNP: TResultTable;
    LearningForm: TResultTable;
    StatusLearningGroup: TResultTable;
    LearningLevel: TResultTable;
    AmountHours: TResultTable;
    GroupeName: TResultTable;

    FNewRecord: boolean;
    FIDLearningGroup: integer;

    FIDEducationProgram: integer;
    FIDPedagogue: integer;
    FIDAcademicYear: integer;

    FStrEducationProgram: string;
    FStrPedagogue: string;
    FStrLearningForm: string;
    FStrStatus: string;
    FStrAcademicYear: string;
    FStrLearningLevel: string;
    FIntHoursAmount: integer;
    FGName: string;

    procedure SetIDEducationProgram(const Value: integer);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);

    procedure SetNewRecord(const Value: boolean);
    procedure SetIDLearningGroup(const Value: integer);
    procedure SetStrEducationProgram(const Value: string);
    procedure SetStrPedagogue(const Value: string);
    procedure SetStrLearningForm(const Value: string);
    procedure SetStrStatus(const Value: string);
    procedure SetStrAcademicYear(const Value: string);
    procedure SetStrLearningLevel(const Value: string);
    procedure SetIntHoursAmount(const Value: integer);
    procedure SetGName(const Value: string);

  public

    property IDEducationProgram: integer read FIDEducationProgram
      write SetIDEducationProgram;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;

    property NewRecord: boolean read FNewRecord write SetNewRecord;
    property IDLearningGroup: integer read FIDLearningGroup
      write SetIDLearningGroup;
    property StrEducationProgram: string read FStrEducationProgram
      write SetStrEducationProgram;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property StrLearningForm: string read FStrLearningForm
      write SetStrLearningForm;
    property StrStatus: string read FStrStatus write SetStrStatus;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
    property StrLearningLevel: string read FStrLearningLevel
      write SetStrLearningLevel;
    property IntHoursAmount: integer read FIntHoursAmount
      write SetIntHoursAmount;
    property GName: string read FGName write SetGName;

  end;

var
  fLearningGroupEdit: TfLearningGroupEdit;

implementation

{$R *.dfm}

procedure TfLearningGroupEdit.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfLearningGroupEdit.bSaveClick(Sender: TObject);
begin
  // ������� �������� �� ���������� �����!!!!!!!!!
  if (cmbEducationProgram.ItemIndex = -1) or (cmbPedagogue.ItemIndex = -1) or
    (cmbLearningForm.ItemIndex = -1) or (cmbStatus.ItemIndex = -1) or
    (cmbAcademicYear.ItemIndex = -1) or (cmbLearningLevel.ItemIndex = -1) or
    (cmbHoursAmount.ItemIndex = -1) then
  begin
    ShowMessage('�� ��� ���� ���������!');
    Exit;
  end;
  if Kernel.SaveLearningGroup([IDLearningGroup,
    LearningForm[cmbLearningForm.ItemIndex].ValueByName('ID'),
    EducationProgram[cmbEducationProgram.ItemIndex].ValueByName('ID'),
    PedagogueSurnameNP[cmbPedagogue.ItemIndex].ValueByName('ID_OUT'),
    LearningLevel[cmbLearningLevel.ItemIndex].ValueByName('ID'),
    AcademicYear[cmbAcademicYear.ItemIndex].ValueByName('ID'),
    StatusLearningGroup[cmbStatus.ItemIndex].ValueByName('CODE'),
    AmountHours[cmbHoursAmount.ItemIndex].ValueByName('WEEK_AMOUNT'),
    cmbName.Text]) then
  begin
    ShowMessage('���������� ���������!');
    Close;
    // ShowChildList(chbExpelled.Checked, true); // ��� ���������� ���.��������
  end
  else
    ShowMessage('������ ��� ����������!');
  Close;
end;

procedure TfLearningGroupEdit.cmbEducationProgramChange(Sender: TObject);
var
  i, education_program, learning_group_type: integer;
begin
  education_program := EducationProgram[cmbEducationProgram.ItemIndex]
    .ValueByName('ID');
  learning_group_type := 1;

  if Assigned(GroupeName) then
    FreeAndNil(GroupeName);
  GroupeName := Kernel.GetDistinctLGroupName(learning_group_type,
    education_program);
  with cmbName do
  begin
    Clear;
    for i := 0 to GroupeName.Count - 1 do
      Items.Add(GroupeName[i].ValueStrByName('NAME'));
    DropDownCount := GroupeName.Count + 1;
    cmbName.ItemIndex := 0;
  end;

end;

procedure TfLearningGroupEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfLearningGroupEdit.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  EducationProgram := nil;
  PedagogueSurnameNP := nil;
  LearningForm := nil;
  StatusLearningGroup := nil;
  LearningLevel := nil;
  AmountHours := nil;
  GroupeName := nil;
end;

procedure TfLearningGroupEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(EducationProgram) then
    FreeAndNil(EducationProgram);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(StatusLearningGroup) then
    FreeAndNil(StatusLearningGroup);
  if Assigned(LearningForm) then
    FreeAndNil(LearningForm);
  if Assigned(LearningLevel) then
    FreeAndNil(LearningLevel);
  if Assigned(AmountHours) then
    FreeAndNil(AmountHours);
  if Assigned(GroupeName) then
    FreeAndNil(GroupeName);
end;

procedure TfLearningGroupEdit.FormShow(Sender: TObject);
var
  i, education_program, learning_group_type: integer;
begin

  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  with cmbAcademicYear do
  begin
    Clear;
    for i := 0 to AcademicYear.Count - 1 do
      Items.Add(AcademicYear[i].ValueStrByName('NAME'));
  end;

  if not Assigned(EducationProgram) then
    EducationProgram := Kernel.GetEducationProgram;
  with cmbEducationProgram do
  begin
    Clear;
    for i := 0 to EducationProgram.Count - 1 do
      Items.Add(EducationProgram[i].ValueStrByName('NAME'));

    // ���������� ������� ������� cmbEducationProgramChange ���?

  end;

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  with cmbPedagogue do
  begin
    Clear;
    for i := 0 to PedagogueSurnameNP.Count - 1 do
      Items.Add(PedagogueSurnameNP[i].ValueStrByName('SurnameNP'));
    DropDownCount := PedagogueSurnameNP.Count;
  end;

  if not Assigned(StatusLearningGroup) then
    StatusLearningGroup := Kernel.GetStatusLearningGroup(3);
  with cmbStatus do
  begin
    Clear;
    for i := 0 to StatusLearningGroup.Count - 1 do
      Items.Add(StatusLearningGroup[i].ValueStrByName('NOTE'));
  end;

  if not Assigned(LearningForm) then
    LearningForm := Kernel.GetLearningForm;
  with cmbLearningForm do
  begin
    Clear;
    for i := 0 to 1 do
      Items.Add(LearningForm[i].ValueStrByName('NAME'));
  end;

  if not Assigned(LearningLevel) then
    LearningLevel := Kernel.GetLearningLevel;
  with cmbLearningLevel do
  begin
    Clear;
    for i := 0 to LearningLevel.Count - 1 do
      Items.Add(LearningLevel[i].ValueStrByName('NAME'));
  end;

  if not Assigned(AmountHours) then
    AmountHours := Kernel.GetAmountHours;
  with cmbHoursAmount do
  begin
    Clear;
    for i := 0 to AmountHours.Count - 1 do
      Items.Add(AmountHours[i].ValueStrByName('WEEK_AMOUNT'));
  end;

  education_program := IDEducationProgram;
  learning_group_type := 1;

  if NewRecord then
  begin
    IDLearningGroup := -1;

    for i := 0 to EducationProgram.Count - 1 do
      if EducationProgram[i].ValueByName('ID') = IDEducationProgram then
        cmbEducationProgram.ItemIndex := i;

    // education_program := IDEducationProgram;
    // learning_group_type := 1;
    if Assigned(GroupeName) then
      FreeAndNil(GroupeName);
    GroupeName := Kernel.GetDistinctLGroupName(learning_group_type,
      education_program);
    with cmbName do
    begin
      Clear;
      for i := 0 to GroupeName.Count - 1 do
        Items.Add(GroupeName[i].ValueStrByName('NAME'));
      DropDownCount := GroupeName.Count + 1;
      cmbName.ItemIndex := 0;
    end;

    for i := 0 to PedagogueSurnameNP.Count - 1 do
      if PedagogueSurnameNP[i].ValueByName('ID_OUT') = IDPedagogue then
        cmbPedagogue.ItemIndex := i;
    // cmbPedagogue.ItemIndex := -1;
    cmbLearningForm.ItemIndex := 0;
    cmbStatus.ItemIndex := 2; // � ��������������� ������ ID ������� 3
    for i := 0 to AcademicYear.Count - 1 do
      if AcademicYear[i].ValueByName('ID') = IDAcademicYear then
        cmbAcademicYear.ItemIndex := i;
    // cmbAcademicYear.ItemIndex := -1;
    cmbLearningLevel.ItemIndex := -1;
    cmbHoursAmount.ItemIndex := -1;
  end
  else
  begin
    cmbName.Text := Name;
    for i := 0 to EducationProgram.Count - 1 do
      if EducationProgram[i].ValueStrByName('NAME') = StrEducationProgram then
        cmbEducationProgram.ItemIndex := i;
    for i := 0 to PedagogueSurnameNP.Count - 1 do
      if PedagogueSurnameNP[i].ValueStrByName('SurnameNP') = StrPedagogue then
        cmbPedagogue.ItemIndex := i;
    for i := 0 to LearningForm.Count - 1 do
      if LearningForm[i].ValueStrByName('NAME') = StrLearningForm then
        cmbLearningForm.ItemIndex := i;
    for i := 0 to StatusLearningGroup.Count - 1 do
      if StatusLearningGroup[i].ValueStrByName('NOTE') = StrStatus then
        cmbStatus.ItemIndex := i;
    for i := 0 to AcademicYear.Count - 1 do
      if AcademicYear[i].ValueStrByName('NAME') = StrAcademicYear then
        cmbAcademicYear.ItemIndex := i;
    for i := 0 to LearningLevel.Count - 1 do
      if LearningLevel[i].ValueStrByName('NAME') = StrLearningLevel then
        cmbLearningLevel.ItemIndex := i;
    for i := 0 to AmountHours.Count - 1 do
      if AmountHours[i].ValueByName('WEEK_AMOUNT') = IntHoursAmount then
        cmbHoursAmount.ItemIndex := i;

    if not Assigned(GroupeName) then
      GroupeName := Kernel.GetDistinctLGroupName(learning_group_type,
        education_program);
    with cmbName do
    begin
      Clear;
      for i := 0 to GroupeName.Count - 1 do
        Items.Add(GroupeName[i].ValueStrByName('NAME'));
      DropDownCount := GroupeName.Count + 1;
      cmbName.Text := GName;
      // cmbName.ItemIndex := 0;
    end;

  end;
  cmbLearningForm.Enabled := false;
end;

procedure TfLearningGroupEdit.SetStrAcademicYear(const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfLearningGroupEdit.SetStrEducationProgram(const Value: string);
begin
  if FStrEducationProgram <> Value then
    FStrEducationProgram := Value;
end;

procedure TfLearningGroupEdit.SetIntHoursAmount(const Value: integer);
begin
  if FIntHoursAmount <> Value then
    FIntHoursAmount := Value;
end;

procedure TfLearningGroupEdit.SetStrLearningForm(const Value: string);
begin
  if FStrLearningForm <> Value then
    FStrLearningForm := Value;
end;

procedure TfLearningGroupEdit.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfLearningGroupEdit.SetIDEducationProgram(const Value: integer);
begin
  if FIDEducationProgram <> Value then
    FIDEducationProgram := Value;
end;

procedure TfLearningGroupEdit.SetIDLearningGroup(const Value: integer);
begin
  if FIDLearningGroup <> Value then
    FIDLearningGroup := Value;
end;

procedure TfLearningGroupEdit.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfLearningGroupEdit.SetStrLearningLevel(const Value: string);
begin
  if FStrLearningLevel <> Value then
    FStrLearningLevel := Value;
end;

procedure TfLearningGroupEdit.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfLearningGroupEdit.SetStrStatus(const Value: string);
begin
  if FStrStatus <> Value then
    FStrStatus := Value;
end;

procedure TfLearningGroupEdit.SetGName(const Value: string);
begin
  if FGName <> Value then
    FGName := Value;
end;

procedure TfLearningGroupEdit.SetNewRecord(const Value: boolean);
begin
  if FNewRecord <> Value then
    FNewRecord := Value;
end;

end.
