unit frmSmallLearnGrMembers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfSmallLearnGrMembers = class(TForm)
    Panel3: TPanel;
    lvSmallGroupMemberList: TListView;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    lvChildList: TListView;
    Panel4: TPanel;
    bOutGroup: TButton;
    cmbOrderOut: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    bInGroup: TButton;
    cmbOrderIn: TComboBox;
    bClose: TButton;
    Panel7: TPanel;
    cmbChoose: TComboBox;
    bBackInGroup: TButton;
    bDeleteRecord: TButton;
    Panel8: TPanel;
    eSearchFIO: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    gbChooseMode: TGroupBox;
    chbExpelled: TCheckBox;
    lGroupName: TLabel;
    procedure bCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbChooseChange(Sender: TObject);
    procedure bInGroupClick(Sender: TObject);
    procedure bOutGroupClick(Sender: TObject);
    procedure bBackInGroupClick(Sender: TObject);
    procedure bDeleteRecordClick(Sender: TObject);
    procedure lvChildListCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure eSearchFIOChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvSmallGroupMemberListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    AcademicYear: TResultTable;
    SmallLearningGroupName: TResultTable;
    ChildListForSmallGroupMember: TResultTable;
    SmallGroupMembersList: TResultTable;
    SurnameNLearningChildsFromSmallLearningGroup: TResultTable;
    InOrderList: TResultTable;
    OutOrderList: TResultTable;
    FIDLearningGroup: integer;
    FIDAcademicYear: integer;
    FIDEducationProgram: integer;
    FIDPedagogue: integer;
    FStrEducationProgram: string;
    FStrPedagogue: string;
    FStrAcademicYear: string;
    FStrLearningLevel: string;
    FGName: string;
    procedure ShowChildListForSmallGroupMember;
    procedure ShowChildListForSmallGroupMemberByFIO(const inStatus,
      Mode: integer; const aSearchText: string);
    procedure ShowSmallGroupMembersList;
    procedure SetIDLearningGroup(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    procedure SetIDEducationProgram(const Value: integer);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetStrEducationProgram(const Value: string);
    procedure SetStrPedagogue(const Value: string);
    procedure SetStrAcademicYear(const Value: string);
    procedure SetStrLearningLevel(const Value: string);
    procedure SetGName(const Value: string);
  public
    property IDLearningGroup: integer read FIDLearningGroup
      write SetIDLearningGroup;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property IDEducationProgram: integer read FIDEducationProgram
      write SetIDEducationProgram;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property StrEducationProgram: string read FStrEducationProgram
      write SetStrEducationProgram;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
    property StrLearningLevel: string read FStrLearningLevel
      write SetStrLearningLevel;
    property GName: string read FGName write SetGName;
  end;

var
  fSmallLearnGrMembers: TfSmallLearnGrMembers;

implementation

{$R *.dfm}

// TODO: ��� �������� �� ������, ���� ������������ �������
procedure TfSmallLearnGrMembers.bBackInGroupClick(Sender: TObject);
// ������� ������� �� ����������
var
  i, ii, s: integer;
  GrName: string;
begin
  s := 0;
  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
  begin
    if lvSmallGroupMemberList.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ��������������!');
    Exit;
  end;

  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
  begin
    if lvSmallGroupMemberList.Items[i].Checked then
    begin
      if Kernel.SaveLearningGroupMembers
        ([SmallGroupMembersList[i].ValueByName('ID'), IDLearningGroup,
        SmallGroupMembersList[i].ValueByName('ID_OUT_CHILD'), 3,
        SmallGroupMembersList[i].ValueByName('ID_ORDER_IN'), null]) then
      begin
//        ShowMessage('���������� ���������!');
      end
      else
        ShowMessage('������ ��� ����������!');
    end;
    GrName := '';
    if Assigned(SurnameNLearningChildsFromSmallLearningGroup) then
      FreeAndNil(SurnameNLearningChildsFromSmallLearningGroup);
    SurnameNLearningChildsFromSmallLearningGroup :=
      Kernel.GetSurnameNLearningChildsFromSmallLearningGroup(IDLearningGroup);
    for ii := 0 to SurnameNLearningChildsFromSmallLearningGroup.Count - 1 do
    begin
      GrName := GrName + SurnameNLearningChildsFromSmallLearningGroup[ii]
        .ValueStrByName('SURNAME_N') + '  ';
    end;
    Panel8.Caption := GrName;
  end;

  if Kernel.UpdateSmallGroupName([IDLearningGroup, GrName]) then
//    ShowMessage('���������� ��������/������� ������ ���������!')
  else
    ShowMessage('������ ��� ���������� ��������/������� ������!');
  // ������� �������� ������, ������ ������� ��� �������� � ����������� ��� �� ������:
  if Assigned(SmallLearningGroupName) then
    FreeAndNil(SmallLearningGroupName);
  SmallLearningGroupName := Kernel.GetSmallLearnGrName(IDLearningGroup);
  Panel8.Caption := SmallLearningGroupName[0].ValueStrByName('GROUP_NAME');
  ShowSmallGroupMembersList;
end;

procedure TfSmallLearnGrMembers.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfSmallLearnGrMembers.bDeleteRecordClick(Sender: TObject);
// �������� �� ������ - �������_� ����������� �� �������� ������
var
  i, ii, s: integer;
  GrName: string;
begin
  // TODO: ��� �������� ��������� �������� �� ������� ��������� � ��������� ������� � ���������� �/��� �������
  s := 0;
  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
  begin
    if lvSmallGroupMemberList.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ��������!');
    Exit;
  end;
  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
    if lvSmallGroupMemberList.Items[i].Checked then
    begin
      if Kernel.DeleteGroupMember([SmallGroupMembersList[i].ValueByName('ID')])
      then
        // ShowMessage('������ �������!')
      else
        ShowMessage('������ ��� �������� ������!');
    end;

  if Assigned(SurnameNLearningChildsFromSmallLearningGroup) then
    FreeAndNil(SurnameNLearningChildsFromSmallLearningGroup);
  SurnameNLearningChildsFromSmallLearningGroup :=
    Kernel.GetSurnameNLearningChildsFromSmallLearningGroup(IDLearningGroup);
  if SurnameNLearningChildsFromSmallLearningGroup.Count > 0 then
  begin
    GrName := '';
    for ii := 0 to SurnameNLearningChildsFromSmallLearningGroup.Count - 1 do
      GrName := GrName + SurnameNLearningChildsFromSmallLearningGroup[ii]
        .ValueStrByName('SURNAME_N') + '  ';
  end
  else
    GrName := '��������� ��������';
  // Panel8.Caption := GrName;
  if Kernel.UpdateSmallGroupName([IDLearningGroup, GrName]) then
    // ShowMessage('���������� ��������/������� ������ ���������!')
  else
    ShowMessage('������ ��� ���������� ��������/������� ������!');
  // ������� �������� ������, ������ ������� ��� �������� � ����������� ��� �� ������:
  if Assigned(SmallLearningGroupName) then
    FreeAndNil(SmallLearningGroupName);
  SmallLearningGroupName := Kernel.GetSmallLearnGrName(IDLearningGroup);
  Panel8.Caption := SmallLearningGroupName[0].ValueStrByName('GROUP_NAME');
  ShowChildListForSmallGroupMember;
  ShowSmallGroupMembersList;
end;

procedure TfSmallLearnGrMembers.bInGroupClick(Sender: TObject);
// ���������� � ������
var
  i, ii, s: integer;
  id_child, id_order: integer;
  GrName: string;
begin
  s := 0;
  for i := 0 to lvChildList.Items.Count - 1 do
  // ��������, ���� �� "��������" ������ � LV
  begin
    if lvChildList.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ����������!');
    Exit;
  end;

  for i := 0 to lvChildList.Items.Count - 1 do
    // begin
    if lvChildList.Items[i].Checked then
    begin
      id_child := ChildListForSmallGroupMember[i].ValueByName('ID_OUT_CHILD');
      id_order := InOrderList[cmbOrderIn.ItemIndex].ValueByName('ID_OUT');
      if Kernel.SaveLearningGroupMembers([-1, IDLearningGroup,
        ChildListForSmallGroupMember[i].ValueByName('ID_OUT_CHILD'), 3,
        InOrderList[cmbOrderIn.ItemIndex].ValueByName('ID_OUT'), null]) then
      begin
        // ShowMessage('���������� ���������!');
      end
      else
        ShowMessage('������ ��� ����������!');
   end;
//   end;

  GrName := '';
  if Assigned(SurnameNLearningChildsFromSmallLearningGroup) then
    FreeAndNil(SurnameNLearningChildsFromSmallLearningGroup);
  SurnameNLearningChildsFromSmallLearningGroup :=
    Kernel.GetSurnameNLearningChildsFromSmallLearningGroup(IDLearningGroup);
  for ii := 0 to SurnameNLearningChildsFromSmallLearningGroup.Count - 1 do
    GrName := GrName + SurnameNLearningChildsFromSmallLearningGroup[ii]
      .ValueStrByName('SURNAME_N') + '  ';

  if Kernel.UpdateSmallGroupName([IDLearningGroup, GrName]) then
    // ShowMessage('���������� ��������/������� ������ ���������!')
  else
    ShowMessage('������ ��� ���������� ��������/������� ������!');
  // ������� �������� ������, ������ ������� ��� �������� � ����������� ��� �� ������:
  if Assigned(SmallLearningGroupName) then
    FreeAndNil(SmallLearningGroupName);
  SmallLearningGroupName := Kernel.GetSmallLearnGrName(IDLearningGroup);
  Panel8.Caption := SmallLearningGroupName[0].ValueStrByName('GROUP_NAME');
  ShowSmallGroupMembersList;
  eSearchFIO.Clear;
end;

// ���������� �� ������ - ������ ������������ �������� �� '2', �� �������� ������ �������_� �����������?
procedure TfSmallLearnGrMembers.bOutGroupClick(Sender: TObject);
var
  i, s: integer;
  GrName: string;
begin
  s := 0;
  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
  begin
    if lvSmallGroupMemberList.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ��������������!');
    Exit;
  end;

  for i := 0 to lvSmallGroupMemberList.Items.Count - 1 do
  begin
    if lvSmallGroupMemberList.Items[i].Checked then
    begin
      if Kernel.SaveLearningGroupMembers
        ([SmallGroupMembersList[i].ValueByName('ID'), IDLearningGroup,
        SmallGroupMembersList[i].ValueByName('ID_OUT_CHILD'), 2,
        SmallGroupMembersList[i].ValueByName('ID_ORDER_IN'),
        OutOrderList[cmbOrderOut.ItemIndex].ValueByName('ID_OUT')]) then
      begin
        // ShowMessage('���������� ���������!');
      end
      else
        ShowMessage('������ ��� ����������!');
    end;
  end;

  if Assigned(SurnameNLearningChildsFromSmallLearningGroup) then
    FreeAndNil(SurnameNLearningChildsFromSmallLearningGroup);
  SurnameNLearningChildsFromSmallLearningGroup :=
    Kernel.GetSurnameNLearningChildsFromSmallLearningGroup(IDLearningGroup);
  if SurnameNLearningChildsFromSmallLearningGroup.Count > 0 then
  begin
    GrName := '';
    for i := 0 to SurnameNLearningChildsFromSmallLearningGroup.Count - 1 do
      GrName := GrName + SurnameNLearningChildsFromSmallLearningGroup[i]
        .ValueStrByName('SURNAME_N') + '  ';
  end
  else
    GrName := '��������� ��������';
  // Panel8.Caption := GrName;
  if Kernel.UpdateSmallGroupName([IDLearningGroup, GrName]) then
    // ShowMessage('���������� ��������/������� ������ ���������!')
  else
    ShowMessage('������ ��� ���������� ��������/������� ������!');
  // ������� �������� ������, ������ ������� ��� �������� � ����������� ��� �� ������:
  if Assigned(SmallLearningGroupName) then
    FreeAndNil(SmallLearningGroupName);
  SmallLearningGroupName := Kernel.GetSmallLearnGrName(IDLearningGroup);
  Panel8.Caption := SmallLearningGroupName[0].ValueStrByName('GROUP_NAME');

  ShowSmallGroupMembersList;
end;

procedure TfSmallLearnGrMembers.cmbChooseChange(Sender: TObject);
begin
  eSearchFIO.Text := '';
  ShowChildListForSmallGroupMember;
//  eSearchFIO.Text := '';
  // ShowSmallGroupMembersList;
end;

procedure TfSmallLearnGrMembers.eSearchFIOChange(Sender: TObject);
var
  vInStatus, vMode: integer;
begin
  vInStatus := 1; // �� ���������� �����������
  vMode := 0; // ��������� ������ ���������� �� ������ ������
  if length(eSearchFIO.Text) > 2 then
    ShowChildListForSmallGroupMemberByFIO(vInStatus, vMode, eSearchFIO.Text)
  else
    ShowChildListForSmallGroupMember;
end;

procedure TfSmallLearnGrMembers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfSmallLearnGrMembers.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  SmallLearningGroupName := nil;
  ChildListForSmallGroupMember := nil;
  InOrderList := nil;
  OutOrderList := nil;
  SmallGroupMembersList := nil;
  SurnameNLearningChildsFromSmallLearningGroup := nil;
end;

procedure TfSmallLearnGrMembers.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(SmallLearningGroupName) then
    FreeAndNil(SmallLearningGroupName);
  if Assigned(ChildListForSmallGroupMember) then
    FreeAndNil(ChildListForSmallGroupMember);
  if Assigned(InOrderList) then
    FreeAndNil(InOrderList);
  if Assigned(OutOrderList) then
    FreeAndNil(OutOrderList);
  if Assigned(SmallGroupMembersList) then
    FreeAndNil(SmallGroupMembersList);
  if Assigned(SurnameNLearningChildsFromSmallLearningGroup) then
    FreeAndNil(SurnameNLearningChildsFromSmallLearningGroup);
end;

procedure TfSmallLearnGrMembers.FormShow(Sender: TObject);
var
  i: integer;
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbChoose, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbChoose, AcademicYear, true, 'ID',
    IDAcademicYear);

  if Assigned(InOrderList) then
    FreeAndNil(InOrderList);
  InOrderList := Kernel.GetInOutOrderList(0, 1);
  with cmbOrderIn do
  begin
    Clear;
    for i := 0 to InOrderList.Count - 1 do
      Items.Add(InOrderList[i].ValueStrByName('NUMBER_DATES_NAME'));
    if InOrderList.Count > 0 then
    begin
      DropDownCount := InOrderList.Count;
      cmbOrderIn.ItemIndex := 0;
    end;
  end;

    if Assigned(OutOrderList) then
      FreeAndNil(OutOrderList);
    OutOrderList := Kernel.GetInOutOrderList(0, 2);
    with cmbOrderOut do
    begin
      Clear;
      for i := 0 to OutOrderList.Count - 1 do
        Items.Add(OutOrderList[i].ValueStrByName('NUMBER_DATES_NAME'));
      if OutOrderList.Count > 0 then
      begin
        DropDownCount := OutOrderList.Count;
        cmbOrderOut.ItemIndex := 0;
      end;

    Panel1.Caption := '������� ������: ' + StrEducationProgram + '  ' +
      StrLearningLevel + '  (' + StrAcademicYear + ')';
    Panel8.Caption := GName;
    ShowChildListForSmallGroupMember;
    ShowSmallGroupMembersList;
  end;
end;

procedure TfSmallLearnGrMembers.lvChildListCustomDrawItem
  (Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var
  i: integer;
begin
  { ������������ ��������� ������ ������������ �� ������ ������������!!!! }
  // for i := 0 to ChildListForGroupMember.Count - 1 do
  // if ChildListForGroupMember[i].ValueByName('STATUS') = 2 then
  //
  // if Sender.ItemIndex = i then
  // //     if Item = i then
  // Sender.Canvas.Brush.Color := 6521080;

  // if Item.SubItems.Strings[6] = '����������������' then
  // Sender.Canvas.Brush.Color := 6521080;
end;

procedure TfSmallLearnGrMembers.lvSmallGroupMemberListSelectItem
  (Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  // ��-�� RowSelect = false! ��� ��� ��������� �� ����� ��������, �� ��� ��� ����������...
  Item.Checked := true;
  // if SmallGroupMembersList[Item.Index].ValueStrByName('DATE_OUT') <> null then
  // bOutGroup.Enabled := false
  // else
  // bOutGroup.Enabled := true;
end;

procedure TfSmallLearnGrMembers.SetGName(const Value: string);
begin
  if FGName <> Value then
    FGName := Value;
end;

procedure TfSmallLearnGrMembers.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfSmallLearnGrMembers.SetIDEducationProgram(const Value: integer);
begin
  if FIDEducationProgram <> Value then
    FIDEducationProgram := Value;
end;

procedure TfSmallLearnGrMembers.SetIDLearningGroup(const Value: integer);
begin
  if FIDLearningGroup <> Value then
    FIDLearningGroup := Value;
end;

procedure TfSmallLearnGrMembers.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfSmallLearnGrMembers.SetStrAcademicYear(const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfSmallLearnGrMembers.SetStrEducationProgram(const Value: string);
begin
  if FStrEducationProgram <> Value then
    FStrEducationProgram := Value;
end;

procedure TfSmallLearnGrMembers.SetStrLearningLevel(const Value: string);
begin
  if FStrLearningLevel <> Value then
    FStrLearningLevel := Value;
end;

procedure TfSmallLearnGrMembers.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfSmallLearnGrMembers.ShowChildListForSmallGroupMember;
var
  in_id_academic_year: integer;
begin
  in_id_academic_year := AcademicYear[cmbChoose.ItemIndex].ValueByName('ID');
  if Assigned(ChildListForSmallGroupMember) then
    FreeAndNil(ChildListForSmallGroupMember);
  ChildListForSmallGroupMember := Kernel.GetSmallGroupMember(IDEducationProgram,
    IDPedagogue, in_id_academic_year);
  // ������� ������ �� ����� ���������, ���������� ������ ������ ��������
  Kernel.GetLVChildListForGroupMember(lvChildList,
    ChildListForSmallGroupMember);
  if lvChildList.Items.Count > 0 then
  begin
    lvChildList.ItemIndex := 0;
    bInGroup.Enabled := true;
  end
  else
    bInGroup.Enabled := false;
end;

procedure TfSmallLearnGrMembers.ShowChildListForSmallGroupMemberByFIO
  (const inStatus, Mode: integer; const aSearchText: string);
begin
  if Assigned(ChildListForSmallGroupMember) then
    FreeAndNil(ChildListForSmallGroupMember);
  ChildListForSmallGroupMember := Kernel.GetChildList(inStatus, Mode,
    aSearchText);
  Kernel.GetLVChildListForGroupMember(lvChildList,
    ChildListForSmallGroupMember);
  if lvChildList.Items.Count > 0 then
  begin
    lvChildList.ItemIndex := 0;
    bInGroup.Enabled := true;
  end
  else
    bInGroup.Enabled := false;
end;

procedure TfSmallLearnGrMembers.ShowSmallGroupMembersList;
var
  choose_mode, in_id_learning_group, year_birth: integer;
begin
  choose_mode := 0;
  // choose_mode - ���� 0, �� ������ ����� ����������� �� ������������ ������
  // ����� ������ ����������� �� ���� ��������
  in_id_learning_group := IDLearningGroup;
  year_birth := 0;
  if Assigned(SmallGroupMembersList) then
    FreeAndNil(SmallGroupMembersList);
  SmallGroupMembersList := Kernel.GetChildListForGroupMember(choose_mode,
    in_id_learning_group, year_birth);
  // ������� ������ ���������� ������� ������ ����� �� ���������� ������
  Kernel.GetLVGroupMember(lvSmallGroupMemberList, SmallGroupMembersList);
  if lvSmallGroupMemberList.Items.Count > 0 then
  begin
    // lvSmallGroupMemberList.ItemIndex := 0;
    bOutGroup.Enabled := true;
    bDeleteRecord.Enabled := true;
    bBackInGroup.Enabled := true;
  end
  else
  begin
    bOutGroup.Enabled := false;
    bDeleteRecord.Enabled := false;
    bBackInGroup.Enabled := false;
  end;
  // �������� � ������� ����������� �����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end;

end.
