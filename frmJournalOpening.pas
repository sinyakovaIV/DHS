unit frmJournalOpening;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfJournalOpening = class(TForm)
    lvLGNameLastLesson: TListView;
    lvPedagogueList: TListView;
    bCheckAllPedagogue: TButton;
    bCheckAllGroup: TButton;
    Panel1: TPanel;
    bOpenJournal: TButton;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    bClose: TButton;
    Panel2: TPanel;
    cmbAcademicYear: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bOpenJournalClick(Sender: TObject);
    procedure lvPedagogueListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure bCheckAllPedagogueClick(Sender: TObject);
    procedure bCheckAllGroupClick(Sender: TObject);
    procedure cmbAcademicYearChange(Sender: TObject);
  private
    PedagogueList: TResultTable;
    GropeNameLastLesson: TResultTable;
    AcademicYear: TResultTable;
    FIDPedagogue: integer;
    FIDAcademicYear: integer;
    // FStrPedagogue: string;
    // FStrAcademicYear: string;
    id_learning_group: integer;
    ending_period: string;
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    // procedure SetStrPedagogue(const Value: string);
    // procedure SetStrAcademicYear(const Value: string);
    procedure ShowPedagogueList;
    procedure ShowLGNameLastLesson(const IDPedagogue, IDAcademicYear: integer);
    procedure Checking(const ListView: TListView;
      const Check_, Pedagogue_: Boolean; Caption_: string; Button_: TButton);
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    // property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    // property StrAcademicYear: string read FStrAcademicYear write SetStrAcademicYear;
  end;

var
  fJournalOpening: TfJournalOpening;

implementation

{$R *.dfm}
{ TfJournalOpening }

procedure TfJournalOpening.bCheckAllGroupClick(Sender: TObject);
var
  i: integer;
begin
  if lvLGNameLastLesson.Items.Count > 0 then
  begin
    if bCheckAllGroup.Caption = '������� ��� ������ / ��������' then
    begin
      for i := 0 to lvLGNameLastLesson.Items.Count - 1 do
        lvLGNameLastLesson.Items[i].Checked := true;
      bCheckAllGroup.Caption := '������ ����� � ���� �����/ ��������';
    end
    else if bCheckAllGroup.Caption = '������ ����� � ���� �����/ ��������' then
    begin
      for i := 0 to lvLGNameLastLesson.Items.Count - 1 do
        lvLGNameLastLesson.Items[i].Checked := false;
      bCheckAllGroup.Caption := '������� ��� ������ / ��������';
    end;

  end
  else
    ShowMessage('�������� ��������!');
end;

// TODO: �����������, ����� ����� �� ����� �� ����������� ������� lvPedagogueListSelectItem
// ��� ����� �� lvPedagogueList ����� ����������� �� SelectItem, � � lvLGNameLastLesson ������������ ������ ���������� ����� ��������
// ���� ��������� ��� ������ ����, �� ����� ���������� ������ ����� � ����, ��� ����������...
procedure TfJournalOpening.bCheckAllPedagogueClick(Sender: TObject);
var
  i: integer;
begin
  if bCheckAllPedagogue.Caption = '������� ���� ���������' then
  begin
    lvPedagogueList.Checkboxes := true;
    lvPedagogueList.RowSelect := false;
    for i := 0 to lvPedagogueList.Items.Count - 1 do
      lvPedagogueList.Items[i].Checked := true;
    bCheckAllPedagogue.Caption := '������ ����� � ���� ���������';
    Panel2.Caption :=
      '������ ����� ������ ��� ���� �����/�������� ���� ���������!';
    lvLGNameLastLesson.Enabled := false;
    lvLGNameLastLesson.Clear;
    bCheckAllGroup.Enabled := false;
  end
  else if bCheckAllPedagogue.Caption = '������ ����� � ���� ���������' then
  begin
    lvPedagogueList.Checkboxes := false;
    lvPedagogueList.RowSelect := true;
    bCheckAllPedagogue.Caption := '������� ���� ���������';
    Panel2.Caption := '';
    bCheckAllGroup.Caption := '������� ��� ������ / ��������';
    bCheckAllGroup.Enabled := true;
    lvLGNameLastLesson.Clear;
  end;
end;

procedure TfJournalOpening.bOpenJournalClick(Sender: TObject);
var
  i, ii, s, ss: integer;
begin
  ending_period := DateToStr(DateTimePicker1.Date);
  // ���� ��� �������� �������, ����� ���� ������ ������ ���� �������, ��� ID �������� � lvPedagogueListSelectItem
  if lvPedagogueList.Checkboxes = false then
  begin

    ss := 0; // detail LV2
    for ii := 0 to lvLGNameLastLesson.Items.Count - 1 do
      if lvLGNameLastLesson.Items[ii].Checked then
        ss := ss + 1; // ������������ LV2, ��������� - ���� �� �������� ������
    if ss = 0 then // ���� ���, ������� �� ���������
    begin
      ShowMessage('�������� ������ / ��������� ��� �������� ������!');
      Exit;
    end;
    // ������������ LV2 ��� ���, �������� � ��������� ��������
    for ii := 0 to lvLGNameLastLesson.Items.Count - 1 do
//    begin
      if lvLGNameLastLesson.Items[ii].Checked then
      begin
        id_learning_group := GropeNameLastLesson[ii].ValueByName('ID_OUT');
        if Kernel.SaveJournalForPeriod([id_learning_group, ending_period]) then
          // ShowMessage('���������� ���������!');
        else
          ShowMessage('������ ��� ����������!');
//      end;
    end;
  end
  else // lvPedagogueList.Checkboxes = true � ���� ���� �������� ������ � lvPedagogueListSelectItem, �� ������� ���
  begin
    s := 0; // master LV
    for i := 0 to lvPedagogueList.Items.Count - 1 do
      if lvPedagogueList.Items[i].Checked then
        s := s + 1; // ������������ lvPedagogueList, ��������� - ���� �� �������� ������
    if s = 0 then
    begin
      ShowMessage('�������� ��������/��������� ��� �������� �������!');
      Exit;
    end;
    if s > 0 then // ������������ LV ��� ���, �������� � ��������� ��������
      for i := 0 to lvPedagogueList.Items.Count - 1 do
//      begin
        if lvPedagogueList.Items[i].Checked then
        begin
          IDPedagogue := PedagogueList[i].ValueByName('ID_OUT');
          for ii := 0 to lvLGNameLastLesson.Items.Count - 1 do
          begin
            id_learning_group := GropeNameLastLesson[ii].ValueByName('ID_OUT');
            if Kernel.SaveJournalForPeriod([id_learning_group, ending_period])
            then
              // ShowMessage('���������� ���������!');
            else
              ShowMessage('������ ��� ����������!');
          end;
        end;
//      end;
  end;
  ShowLGNameLastLesson(IDPedagogue, IDAcademicYear);
end;

procedure TfJournalOpening.Checking(const ListView: TListView;
  const Check_, Pedagogue_: Boolean; Caption_: string; Button_: TButton);
var
  i: integer;
begin
  // if Check_ = true then
  // begin
  // for i := 0 to ListView.Items.Count - 1 do
  // ListView.Items[i].Checked := true;
  // if Pedagogue_ = true then
  // begin
  // lvLGNameLastLesson.Enabled := false;
  // Panel2.Caption :=
  // '������ ����� ������ ��� ���� �����/�������� ���� ���������!';
  // end
  // else
  // // lvLGNameLastLesson.Enabled := true;
  // end
  // else
  // begin
  // for i := 0 to ListView.Items.Count - 1 do
  // ListView.Items[i].Checked := false;
  // lvLGNameLastLesson.Enabled := true;
  // end;
  // Button_.Caption := Caption_;
end;

procedure TfJournalOpening.cmbAcademicYearChange(Sender: TObject);
begin
  IDAcademicYear := AcademicYear[cmbAcademicYear.ItemIndex].ValueByName('ID');
  ShowLGNameLastLesson(IDPedagogue, IDAcademicYear);
end;

procedure TfJournalOpening.DateTimePicker1Change(Sender: TObject);
begin
  ending_period := DateToStr(DateTimePicker1.Date);
end;

procedure TfJournalOpening.FormCreate(Sender: TObject);
begin
  PedagogueList := nil;
  GropeNameLastLesson := nil;
  AcademicYear := nil;
end;

procedure TfJournalOpening.FormDestroy(Sender: TObject);
begin
  if Assigned(PedagogueList) then
    FreeAndNil(PedagogueList);
  if Assigned(GropeNameLastLesson) then
    FreeAndNil(GropeNameLastLesson);
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
end;

procedure TfJournalOpening.FormShow(Sender: TObject);
begin
  ShowPedagogueList;
  ShowLGNameLastLesson(IDPedagogue, IDAcademicYear);
  ending_period := DateToStr(DateTimePicker1.Date);
    if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDAcademicYear);
  DateTimePicker1.Date := Now;
end;

procedure TfJournalOpening.lvPedagogueListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if PedagogueList.Count > 0 then  // � ���� �� ��������, ���� ��� ������� ������� �� ���������� ��
    with PedagogueList[Item.Index] do
    begin
      IDPedagogue := ValueByName('ID_OUT');
      ShowLGNameLastLesson(IDPedagogue, IDAcademicYear);
      Panel2.Caption := '������ ����� / �������� ��������:  ' +
        ValueByName('SURNAMENP');
    end;
  lvLGNameLastLesson.Enabled := true;
end;

procedure TfJournalOpening.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfJournalOpening.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfJournalOpening.ShowLGNameLastLesson(const IDPedagogue,
  IDAcademicYear: integer);
begin
  if Assigned(GropeNameLastLesson) then
    FreeAndNil(GropeNameLastLesson);
  GropeNameLastLesson := Kernel.GetLGNameLastLesson(IDPedagogue,
    IDAcademicYear);
  Kernel.GetLVGropeNameLastLesson(lvLGNameLastLesson, GropeNameLastLesson);
  if lvLGNameLastLesson.Items.Count > 0 then
    lvLGNameLastLesson.ItemIndex := 0;
end;

procedure TfJournalOpening.ShowPedagogueList;
begin
  if not Assigned(PedagogueList) then
    PedagogueList := Kernel.GetPsnpForAutorization;
  Kernel.GetLVPedagogueList(lvPedagogueList, PedagogueList);
  if lvPedagogueList.Items.Count > 0 then
    lvPedagogueList.ItemIndex := 0;
  // �� IDPedagogue ������� �������� ��������
end;

end.
