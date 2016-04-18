unit frmPedagogueClassEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfPedagogueClassEdit = class(TForm)
    Panel2: TPanel;
    lvChildList: TListView;
    Panel5: TPanel;
    bClose: TButton;
    Panel3: TPanel;
    lvClassList: TListView;
    Panel1: TPanel;
    bEditRecord: TButton;
    bDeleteRecord: TButton;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    chbExpelled: TCheckBox;
    Splitter1: TSplitter;
    Panel7: TPanel;
    rgChooseMode: TRadioGroup;
    cmbChoose: TComboBox;
    bInGroup: TButton;
    eSearchFIO: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgChooseModeClick(Sender: TObject);
    procedure bEditRecordClick(Sender: TObject);
    procedure bInGroupClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure cmbChooseChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bDeleteRecordClick(Sender: TObject);
    procedure lvChildListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvClassListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure eSearchFIOChange(Sender: TObject);
  private
    YearBirth: TResultTable;
    ChildListForClassMember: TResultTable;
    ClassMembersList: TResultTable;
    AcademicYear: TResultTable;

    FIDEducationProgram: integer;
    FIDPedagogue: integer;
    FIDAcademicYear: integer;
    FStrEducationProgram: string;
    FStrPedagogue: string;
    FStrAcademicYear: string;

    procedure SetIDEducationProgram(const Value: integer);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    procedure SetStrEducationProgram(const Value: string);
    procedure SetStrPedagogue(const Value: string);
    procedure SetStrAcademicYear(const Value: string);
    procedure ShowChildListForClassMember;
    procedure ShowClassMembersList;
    procedure ShowChildListForClassMemberByFIO(const inStatus,
  Mode: integer; const aSearchText: string);

  public
    property IDEducationProgram: integer read FIDEducationProgram
      write SetIDEducationProgram;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property StrEducationProgram: string read FStrEducationProgram
      write SetStrEducationProgram;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
  end;

var
  fPedagogueClassEdit: TfPedagogueClassEdit;

implementation

{$R *.dfm}

uses frmPedagogueClassEditMini;

procedure TfPedagogueClassEdit.bDeleteRecordClick(Sender: TObject);
begin
// ��� ��������� �������� �� ������� ��������� � ��������� ������� � ���������� �/��� �������
  if Application.MessageBox('������������� �������� ������������ �� ������?',
    '���', MB_YESNO) = IDYES then
  begin
    if (Kernel.DeleteGroup([fPedagogueClassEditMini.IDLearningGroup]) and
      Kernel.DeleteGroupMember([fPedagogueClassEditMini.IDLearningGroupMember]))
    then
    begin
      ShowMessage('������ �������!');
      // ����� �� ����� �������� ��� ���������!!???
    end
    else
      ShowMessage('������ ��� �������� ������!');
    ShowChildListForClassMember;
    ShowClassMembersList;
  end;
end;

procedure TfPedagogueClassEdit.bEditRecordClick(Sender: TObject);
begin
  fPedagogueClassEditMini.NewRecord := false;
  if (not Assigned(fPedagogueClassEditMini)) then
    fPedagogueClassEditMini := TfPedagogueClassEditMini.Create(Self);
  fPedagogueClassEditMini.ShowModal;
  if fPedagogueClassEditMini.ModalResult = mrOk then
  begin
    ShowChildListForClassMember;
    ShowClassMembersList;
  end;
end;

procedure TfPedagogueClassEdit.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfPedagogueClassEdit.bInGroupClick(Sender: TObject);
begin
  fPedagogueClassEditMini.NewRecord := true;
  if (not Assigned(fPedagogueClassEditMini)) then
    fPedagogueClassEditMini := TfPedagogueClassEditMini.Create(Self);
  fPedagogueClassEditMini.ShowModal;
  if fPedagogueClassEditMini.ModalResult = mrOk then
  begin
    ShowChildListForClassMember;
    ShowClassMembersList;
  end;
end;

procedure TfPedagogueClassEdit.cmbChooseChange(Sender: TObject);
begin
  ShowChildListForClassMember;
end;

procedure TfPedagogueClassEdit.eSearchFIOChange(Sender: TObject);
var
  vInStatus, vMode: integer;
begin
  vInStatus := 1; // �� ���������� �����������
  vMode := 0; // ��������� ������ ���������� �� ������ ������
  if length(eSearchFIO.Text) > 2 then
    ShowChildListForClassMemberByFIO(vInStatus, vMode, eSearchFIO.Text)
  else
    ShowChildListForClassMember;
end;

procedure TfPedagogueClassEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfPedagogueClassEdit.FormCreate(Sender: TObject);
begin
  YearBirth := nil;
  ChildListForClassMember := nil;
  ClassMembersList := nil;
  AcademicYear := nil;

end;

procedure TfPedagogueClassEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(YearBirth) then
    FreeAndNil(YearBirth);
  if Assigned(ChildListForClassMember) then
    FreeAndNil(ChildListForClassMember);
  if Assigned(ClassMembersList) then
    FreeAndNil(ClassMembersList);
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  // if Assigned(InOrderList) then

end;

procedure TfPedagogueClassEdit.FormShow(Sender: TObject);
var
  i: integer;
begin
  fPedagogueClassEditMini.IDEducationProgram := IDEducationProgram;
  fPedagogueClassEditMini.IDPedagogue := IDPedagogue;
  fPedagogueClassEditMini.IDAcademicYear := IDAcademicYear;

  fPedagogueClassEditMini.StrEducationProgram := StrEducationProgram;
  fPedagogueClassEditMini.StrPedagogue := StrPedagogue;
  fPedagogueClassEditMini.StrAcademicYear := StrAcademicYear;

  Panel1.Caption := StrPedagogue + ', ' + StrAcademicYear + ' ��/���, "' +
    StrEducationProgram + '"';
  rgChooseMode.ItemIndex := 0;
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  with cmbChoose do
  begin
    Clear;
    Items.Add('���');
    for i := 0 to AcademicYear.Count - 1 do
      Items.Add(AcademicYear[i].ValueStrByName('NAME'));
    DropDownCount := AcademicYear.Count + 1;
    for i := 0 to AcademicYear.Count - 1 do
      if AcademicYear[i].ValueStrByName('NAME') = StrAcademicYear then
        cmbChoose.ItemIndex := i + 1;
  end;
  ShowChildListForClassMember;
  ShowClassMembersList;
end;

procedure TfPedagogueClassEdit.lvChildListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if ChildListForClassMember.Count > 0 then
    with ChildListForClassMember[Item.Index] do
    begin
      fPedagogueClassEditMini.IDLearningChild := ValueByName('ID_OUT_CHILD');
      fPedagogueClassEditMini.StrSurnameNameChild :=
        ValueByName('SURNAME_NAME');
    end;
end;

procedure TfPedagogueClassEdit.lvClassListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if ClassMembersList.Count > 0 then
    with ClassMembersList[Item.Index] do
    begin
      fPedagogueClassEditMini.IDLearningGroup :=
        ValueByName('ID_OUT_LEARNING_GROUP');
      fPedagogueClassEditMini.IDLearningLevel :=
        ValueByName('ID_OUT_LEARNING_LEVEL');
      fPedagogueClassEditMini.WeekAmountHours :=
        ValueByName('WEEK_AMOUNT_HOURS');
      fPedagogueClassEditMini.IDLearningGroupMember :=
        ValueByName('ID_OUT_LEARNING_GROUP_MEMBER');
      fPedagogueClassEditMini.IDOrderIn := ValueByName('ID_OUT_ORDER_IN');
      if ValueStrByName('ID_OUT_ORDER_OUT') <> 'null' then
        fPedagogueClassEditMini.IDOrderOut := ValueByName('ID_OUT_ORDER_OUT');
      fPedagogueClassEditMini.IDLearningChild := ValueByName('ID_OUT_CHILD');
      fPedagogueClassEditMini.StrSurnameNameChild :=
        ValueByName('SURNAME_NAME');
    end;
end;

procedure TfPedagogueClassEdit.rgChooseModeClick(Sender: TObject);
var
  i: integer;
begin
  if rgChooseMode.ItemIndex = 0 then
  begin

    // ���� ����� ����������� � FormShow
    if not Assigned(AcademicYear) then
      AcademicYear := Kernel.GetAcademicYear;
    with cmbChoose do
    begin
      Clear;
      Items.Add('���');
      for i := 0 to AcademicYear.Count - 1 do
        Items.Add(AcademicYear[i].ValueStrByName('NAME'));
      DropDownCount := AcademicYear.Count + 1;
      for i := 0 to AcademicYear.Count - 1 do
        if AcademicYear[i].ValueStrByName('NAME') = StrAcademicYear then
          cmbChoose.ItemIndex := i + 1;
    end;

  end
  else
  begin
    if not Assigned(YearBirth) then
      YearBirth := Kernel.GetYearBirth;
    with cmbChoose do
    begin
      Clear;
      for i := 0 to YearBirth.Count - 1 do
        Items.Add(YearBirth[i].ValueStrByName('YearBirth'));
      DropDownCount := YearBirth.Count + 1;
      ItemIndex := 0;
    end;
  end;
  ShowChildListForClassMember;
end;

procedure TfPedagogueClassEdit.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfPedagogueClassEdit.SetIDEducationProgram(const Value: integer);
begin
  if FIDEducationProgram <> Value then
    FIDEducationProgram := Value;
end;

procedure TfPedagogueClassEdit.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfPedagogueClassEdit.SetStrAcademicYear(const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfPedagogueClassEdit.SetStrEducationProgram(const Value: string);
begin
  if FStrEducationProgram <> Value then
    FStrEducationProgram := Value;
end;

procedure TfPedagogueClassEdit.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfPedagogueClassEdit.ShowChildListForClassMember;
var
  in_id_academic_year, year_birth: integer;
begin
  if rgChooseMode.ItemIndex = 0 then
  // ������� ������� �� �������� ����
  begin
    in_id_academic_year := AcademicYear[cmbChoose.ItemIndex - 1]
      .ValueByName('ID');
    if Assigned(ChildListForClassMember) then
      FreeAndNil(ChildListForClassMember);
    ChildListForClassMember := Kernel.GetChildListForClassMemberByAcademicYear
      (IDEducationProgram, IDPedagogue, in_id_academic_year);
  end
  else
  // ������� ������ �� ���� ��������
  begin
    if YearBirth.Count > 0 then
      year_birth := StrToInt(cmbChoose.Text);
    if Assigned(ChildListForClassMember) then
      FreeAndNil(ChildListForClassMember);
    ChildListForClassMember := Kernel.GetChildListForClassMemberByYearBirth
      (year_birth);
  end;

  Kernel.GetLVChildListClassMemberForEdit(lvChildList, ChildListForClassMember);
  if lvChildList.Items.Count > 0 then
    lvChildList.ItemIndex := 0;
end;

procedure TfPedagogueClassEdit.ShowChildListForClassMemberByFIO(const inStatus,
  Mode: integer; const aSearchText: string);
begin
  if Assigned(ChildListForClassMember) then
    FreeAndNil(ChildListForClassMember);
  ChildListForClassMember := Kernel.GetChildList(inStatus, Mode,
    aSearchText);
  Kernel.GetLVChildListForGroupMember(lvChildList,
    ChildListForClassMember);
  if lvChildList.Items.Count > 0 then
  begin
    lvChildList.ItemIndex := 0;
    bInGroup.Enabled := true;
  end
  else
    bInGroup.Enabled := false;
end;

procedure TfPedagogueClassEdit.ShowClassMembersList;
begin
  if Assigned(ClassMembersList) then
    FreeAndNil(ClassMembersList);
  ClassMembersList := Kernel.GetChildListClassMember(IDEducationProgram,
    IDPedagogue, IDAcademicYear);
  Kernel.GetLVChildListClassMemberForEdit(lvClassList, ClassMembersList);
  if lvClassList.Items.Count > 0 then
    lvClassList.ItemIndex := 0;
end;

end.