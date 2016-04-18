unit frmParents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfParents = class(TForm)
    Label20: TLabel;
    mWorkplace: TMemo;
    mNoteR: TMemo;
    lvParentContact: TListView;
    lvParent: TListView;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    eSurnameR: TEdit;
    eProfession: TEdit;
    ePatronomicR: TEdit;
    eNameR: TEdit;
    cmbParentStatus: TComboBox;
    cmbParentKind: TComboBox;
    bSaveR: TButton;
    bNewRecordR: TButton;
    bRemoveContactR: TButton;
    bChangeContactR: TButton;
    bAddContactR: TButton;
    procedure FormShow(Sender: TObject);
    procedure lvParentSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean); // !!!
    procedure lvParentContactSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bRemoveContactRClick(Sender: TObject);
    procedure bChangeContactRClick(Sender: TObject);
    procedure bAddContactRClick(Sender: TObject);
    procedure bSaveRClick(Sender: TObject);
    procedure bNewRecordRClick(Sender: TObject);
  private
    IDParent: integer;
    IDContact: integer;
    ParentStatus: TResultTable;
    ParentKind: TResultTable;
    ParentList: TResultTable;
    ParentContList: TResultTable;
    FIDChild: integer;
    FStrChild: String;
    procedure SetIDChild(const Value: integer);
    procedure SetStrChild(const Value: String);
    procedure ShowParentList(const inID: integer);
    procedure ShowParentContList(const inID: integer);
    procedure DoClearParent;
  public
    property IDChild: integer read FIDChild write SetIDChild;
    property StrChild: String read FStrChild write SetStrChild;
  end;

var
  fParents: TfParents;

implementation

{$R *.dfm}

uses frmContact;
{ TfParents }

procedure TfParents.bAddContactRClick(Sender: TObject);
var
  i: integer;
begin
  fContact.NewRecord := true;
  // �������� ������������� �����
  if (not Assigned(fContact)) then
    // ���� ����� �� �������, �� ������� ��
    fContact := TfContact.Create(Self);
  fContact.ShowModal; // ����� ����� ��� ���������
  if fContact.ModalResult = mrOk then
    ShowParentContList(IDParent);
end;

procedure TfParents.bChangeContactRClick(Sender: TObject);
begin
  fContact.NewRecord := false;
  if (not Assigned(fContact)) then
    fContact := TfContact.Create(Self);
  fContact.ShowModal;
  if fContact.ModalResult = mrOk then
    ShowParentContList(IDParent);
end;

procedure TfParents.bNewRecordRClick(Sender: TObject);
begin
  IDParent := -1;
  DoClearParent;
  eSurnameR.SetFocus;
end;

procedure TfParents.bRemoveContactRClick(Sender: TObject);
begin
  if Kernel.DeleteParentConact([IDContact]) then
  begin
    ShowMessage('������� ������!');
    // ����� �� ����� �������� ��� ���������!!???
    ShowParentContList(IDParent); // ��� ���������� ���.��������
  end
  else
    ShowMessage('������ ��� �������� ��������!');
end;

procedure TfParents.bSaveRClick(Sender: TObject);
begin
  if (cmbParentKind.ItemIndex = -1) or (cmbParentStatus.ItemIndex = -1) or
    (Trim(eSurnameR.Text) = '') or (Trim(eNameR.Text) = '') then
  begin
    ShowMessage('�� ��� ���� ���������!');
    Exit;
  end;
  if Kernel.SaveParentAll([IDParent, IDChild, eSurnameR.Text, eNameR.Text,
    ePatronomicR.Text, mWorkplace.Text, eProfession.Text, mNoteR.Text,
    ParentKind[cmbParentKind.ItemIndex].ValueByName('ID'),
    ParentStatus[cmbParentStatus.ItemIndex].ValueByName('CODE')]) then
    ShowMessage('���������� ���������!')
  else
    ShowMessage('������ ��� ����������!');
  // ����� ���������� �������, ����� ��������������� �� ������ ������ � LV!!!!!!
  ShowParentList(IDChild); // �������� �����������
end;

procedure TfParents.DoClearParent;
begin
  eSurnameR.Clear;
  eNameR.Clear;
  ePatronomicR.Clear;
  cmbParentKind.ItemIndex := -1;
  cmbParentStatus.ItemIndex := 0;
  mWorkplace.Clear;
  eProfession.Clear;
  mNoteR.Clear;
  lvParentContact.Clear;
end;

procedure TfParents.FormCreate(Sender: TObject);
begin
  ParentList := nil;
  ParentStatus := nil;
  ParentKind := nil;
  ParentContList := nil;
end;

procedure TfParents.FormDestroy(Sender: TObject);
begin
  if Assigned(ParentStatus) then
    FreeAndNil(ParentStatus);
  if Assigned(ParentKind) then
    FreeAndNil(ParentKind);
  if Assigned(ParentList) then
    FreeAndNil(ParentList);
  if Assigned(ParentContList) then
    FreeAndNil(ParentContList);
end;

procedure TfParents.FormShow(Sender: TObject);
var
  i: integer;
begin
  fParents.Caption := '�������� ���������:  ' + StrChild;
  // ��������� ComboBox � ����� �������
  if not Assigned(ParentKind) then
    ParentKind := Kernel.GetParentKind;
  with cmbParentKind do
  begin
    Clear;
    for i := 0 to ParentKind.Count - 1 do
      Items.Add(ParentKind[i].ValueStrByName('NAME'));
  end;

  // ��������� ComboBox �� �������� �������
  if not Assigned(ParentStatus) then
    ParentStatus := Kernel.GetParentStatus(2);
  with cmbParentStatus do
  begin
    Clear;
    for i := 0 to ParentStatus.Count - 1 do
      Items.Add(ParentStatus[i].ValueStrByName('NOTE'));
  end;
  ShowParentList(IDChild);
  // ShowParentContList(IDParent);
end;

procedure TfParents.lvParentContactSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  with ParentContList[Item.Index] do
  begin
    // if (not Assigned(fContact)) then
    // fContact := TfContact.Create(Self);
    fContact.IDParent := IDParent;
    IDContact := ValueByName('ID'); // � ���� ������ � ���� ����� �� ������!
    fContact.IDContact := ValueByName('ID');
    fContact.IDContactType := ValueByName('id_contact_type');
    fContact.ContactValue := ValueStrByName('CONTACT_VALUE');
  end;
end;

procedure TfParents.lvParentSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i: integer;
begin
  if ParentList.Count > 0 then
    with ParentList[Item.Index] do
    begin
      IDParent := ValueByName('ID');
      fContact.IDParent := IDParent;
      eSurnameR.Text := ValueStrByName('SURNAME');
      eNameR.Text := ValueStrByName('NAME');
      ePatronomicR.Text := ValueStrByName('PATRONOMIC');
//      for i := 0 to ParentKind.Count - 1 do
//        if ParentKind[i].ValueStrByName('ID') = ValueStrByName('PARENT_KIND')
//        then
//          cmbParentKind.ItemIndex := i;
//      for i := 0 to ParentStatus.Count - 1 do
//        if ParentStatus[i].ValueStrByName('CODE')
//          = ValueStrByName('PARENT_STATUS') then
//          cmbParentStatus.ItemIndex := i;
// ������� ����������� - ������� � ������� ������ ����. ��� ���� ������� ����
      mWorkplace.Text := ValueStrByName('WORKPLACE');
      eProfession.Text := ValueStrByName('PROFESSION');
      mNoteR.Text := ValueStrByName('NOTE');
      ShowParentContList(IDParent);
    end
  else
  begin
    DoClearParent;
    IDParent := -1;
  end;
  // ShowParentContList(IDParent);

end;

procedure TfParents.SetIDChild;
begin
  if FIDChild <> Value then
    FIDChild := Value;
end;

procedure TfParents.SetStrChild;
begin
  if FStrChild <> Value then
    FStrChild := Value;
end;

procedure TfParents.ShowParentContList(const inID: integer);
begin
  if Assigned(ParentContList) then
    // "���������" ����������, ���� � ��� ����-� ����
    FreeAndNil(ParentContList);
  ParentContList := Kernel.GetParentContList(inID);
  Kernel.GetLVContact(lvParentContact, ParentContList);
  if lvParentContact.Items.Count > 0 then
  // �.�. ���� ���������� ������, �� ������� ������� SelectItem:
  // � ���� ��� �������, �� ����� �������������� ������ "��������" � "�������"
  begin
    lvParentContact.ItemIndex := 0;
    bRemoveContactR.Enabled := true;
    bChangeContactR.Enabled := true
  end
  else
  begin
    bRemoveContactR.Enabled := false;
    bChangeContactR.Enabled := false;
  end;

end;

procedure TfParents.ShowParentList(const inID: integer);
begin
  if Assigned(ParentList) then // "���������" ����������, ���� � ��� ����-� ����
    FreeAndNil(ParentList);
  ParentList := Kernel.GetParentList(inID);
  Kernel.GetLVParent(lvParent, ParentList);
  cmbParentStatus.ItemIndex := 0;
  // ����������� ��������� � ����� ������� �������������� � "���������"...
  if lvParent.Items.Count > 0 then
    // �.�. ���� ���������� ������, �� ������� ������� SelectItem:
    lvParent.ItemIndex := 0
  else
    DoClearParent;
end;

end.
