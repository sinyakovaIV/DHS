unit frmChildTrips;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfChildTrips = class(TForm)
    Panel1: TPanel;
    cmbOrders: TComboBox;
    cmbAcademicYear: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    lvTriping: TListView;
    Panel3: TPanel;
    lvChildForTrip: TListView;
    bClose: TButton;
    bToTrip: TButton;
    bDeleteRecord: TButton;
    Label3: TLabel;
    Label4: TLabel;
    cmbChoose: TComboBox;
    eSearchFIO: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure cmbOrdersChange(Sender: TObject);
    procedure bToTripClick(Sender: TObject);
    procedure bDeleteRecordClick(Sender: TObject);
    procedure cmbAcademicYearChange(Sender: TObject);
    procedure eSearchFIOChange(Sender: TObject);
    procedure cmbChooseChange(Sender: TObject);
  private
    AcademicYear: TResultTable;
    OrdersTrip: TResultTable;
    ChildListFotTrip: TResultTable;
    LearningGroupName: TResultTable;
    PedagogueList: TResultTable;
    TripingList: TResultTable;
    FIDAcademicYear: integer;
    IDOrder: integer;
    IDPedagogue: integer;
    procedure ShowPedagogueList;
    procedure ShowChildListForTripByGroup;
    procedure ShowChildListForTripByFIO(const inStatus, Mode: integer;
      const aSearchText: string);
    // � ����� �� ������� ��, ��� ���������...
    procedure ShowTripingList(const id_order: integer);
    procedure SetIDAcademicYear(const Value: integer);
  public
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
  end;

var
  fChildTrips: TfChildTrips;

implementation

{$R *.dfm}

procedure TfChildTrips.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfChildTrips.bDeleteRecordClick(Sender: TObject);
var
  i, s: integer;
begin
  // ��� ��������� �������� �� ������� ��������� � ��������� ������� � ���������� �/��� �������
  s := 0;
  for i := 0 to lvTriping.Items.Count - 1 do
  begin
    if lvTriping.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ��������!');
    Exit;
  end;
  for i := 0 to lvTriping.Items.Count - 1 do
  begin
    if lvTriping.Items[i].Checked then
      if Kernel.DeleteChildTrip([TripingList[i].ValueByName('ID_OUT')]) then
      begin
        // ShowMessage('������ �������!');
        // ����� �� ����� �������� ��� ���������!!???
      end
      else
        ShowMessage('������ ��� �������� ������!');
  end;
  ShowTripingList(IDOrder);
end;

procedure TfChildTrips.bToTripClick(Sender: TObject);
var
  i, s: integer;
  id_child: integer;
begin
  s := 0;
  for i := 0 to lvChildForTrip.Items.Count - 1 do
  begin
    if lvChildForTrip.Items[i].Checked then
      s := s + 1;
  end;
  if s = 0 then
  begin
    ShowMessage('�������� ������ ��� ����������!');
    Exit;
  end;
  for i := 0 to lvChildForTrip.Items.Count - 1 do
  begin
    if lvChildForTrip.Items[i].Checked then
    begin
      id_child := ChildListFotTrip[i].ValueByName('ID_OUT_CHILD');
      if Kernel.SaveChildTrip([id_child, IDOrder]) then
      begin
        // ShowMessage('���������� ���������!');
      end
      else
        ShowMessage('������ ��� ����������!');
    end;
  end;
  ShowTripingList(IDOrder);
end;

procedure TfChildTrips.cmbAcademicYearChange(Sender: TObject);
begin
  if cmbAcademicYear.ItemIndex = 0 then
    IDAcademicYear := 0
  else
    IDAcademicYear := AcademicYear[cmbAcademicYear.ItemIndex - 1]
      .ValueByName('ID');
  if Assigned(OrdersTrip) then
    FreeAndNil(OrdersTrip);
  OrdersTrip := Kernel.GetOrdersTrip(IDAcademicYear);
  Kernel.FillingComboBox(cmbOrders, OrdersTrip, 'LENGTH_NUMBER_DATE', false);
  // ���������, ��� �� ����� ������, ���� � ��� ����� ������, � � �������� ������ ������..
  cmbOrders.ItemIndex := 0;
  if OrdersTrip.Count > 0 then
  begin
    IDOrder := OrdersTrip[0].ValueByName('ID_OUT');
    ShowTripingList(IDOrder);
  end
  else
    lvTriping.Clear;
  if Assigned(LearningGroupName) then
    FreeAndNil(LearningGroupName);
  LearningGroupName := Kernel.GetLearningGroupName(0, 0, IDAcademicYear, 1, 0);
  // (IDEducationProgram, IDPedagogue, IDAcademicYear, IDLearningForm, FIDStatus)
  Kernel.FillingComboBox(cmbChoose, LearningGroupName,
    'name_academic_year', false);
  cmbChoose.ItemIndex := 0;
  ShowChildListForTripByGroup
end;

procedure TfChildTrips.cmbChooseChange(Sender: TObject);
begin
  ShowChildListForTripByGroup
end;

procedure TfChildTrips.cmbOrdersChange(Sender: TObject);
begin
  IDOrder := OrdersTrip[cmbOrders.ItemIndex].ValueByName('ID_OUT');
  ShowTripingList(IDOrder);
end;

procedure TfChildTrips.eSearchFIOChange(Sender: TObject);
var
  vInStatus, vMode: integer;
begin
  vInStatus := 1; // �� ���������� �����������
  vMode := 0; // ��������� ������ ���������� �� ������ ������
  if length(eSearchFIO.Text) > 2 then
    ShowChildListForTripByFIO(vInStatus, vMode, eSearchFIO.Text)
  else
    ShowChildListForTripByGroup;
end;

procedure TfChildTrips.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  OrdersTrip := nil;
  ChildListFotTrip := nil;
  TripingList := nil;
  LearningGroupName := nil;
end;

procedure TfChildTrips.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(OrdersTrip) then
    FreeAndNil(OrdersTrip);
  if Assigned(ChildListFotTrip) then
    FreeAndNil(ChildListFotTrip);
  if Assigned(TripingList) then
    FreeAndNil(TripingList);
  if Assigned(LearningGroupName) then
    FreeAndNil(LearningGroupName);
end;

procedure TfChildTrips.FormShow(Sender: TObject);
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', true);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDAcademicYear);

  if not Assigned(OrdersTrip) then
    OrdersTrip := Kernel.GetOrdersTrip(IDAcademicYear);
  Kernel.FillingComboBox(cmbOrders, OrdersTrip, 'LENGTH_NUMBER_DATE', false);
  // ���������, ��� �� ����� ������, ���� � ��� ����� ������, � � �������� ������ ������..
  cmbOrders.ItemIndex := 0;
  if OrdersTrip.Count > 0 then
    IDOrder := OrdersTrip[0].ValueByName('ID_OUT');

  if not Assigned(LearningGroupName) then
    // FreeAndNil(LearningGroupName);
    LearningGroupName := Kernel.GetLearningGroupName(0, 0,
      IDAcademicYear, 1, 0);
  // (IDEducationProgram, IDPedagogue, IDAcademicYear, IDLearningForm, FIDStatus)
  Kernel.FillingComboBox(cmbChoose, LearningGroupName,
    'name_academic_year', false);
  cmbChoose.ItemIndex := 0;

  ShowChildListForTripByGroup;
  ShowTripingList(IDOrder);
end;

procedure TfChildTrips.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfChildTrips.ShowChildListForTripByGroup;
var
  choose_mode, in_id_learning_group, year_birth: integer;
begin
  choose_mode := 0;
  if LearningGroupName.Count > 0 then
    in_id_learning_group := LearningGroupName[cmbChoose.ItemIndex]
      .ValueByName('ID_OUT')
  else
    in_id_learning_group := 0; // ���� ��������
  year_birth := 0;

  if Assigned(ChildListFotTrip) then
    FreeAndNil(ChildListFotTrip);
  ChildListFotTrip := Kernel.GetChildListForGroupMember(choose_mode,
    in_id_learning_group, year_birth);
  Kernel.GetLVChildListForGroupMember(lvChildForTrip, ChildListFotTrip);
  if lvChildForTrip.Items.Count > 0 then
  begin
    lvChildForTrip.ItemIndex := 0;
    bToTrip.Enabled := true;
  end
  else
    bToTrip.Enabled := false;
end;

procedure TfChildTrips.ShowChildListForTripByFIO(const inStatus, Mode: integer;
  const aSearchText: string);
begin
  if Assigned(ChildListFotTrip) then
    FreeAndNil(ChildListFotTrip);
  ChildListFotTrip := Kernel.GetChildList(inStatus, Mode, aSearchText);
  Kernel.GetLVChildListForGroupMember(lvChildForTrip, ChildListFotTrip);
  if lvChildForTrip.Items.Count > 0 then
  begin
    lvChildForTrip.ItemIndex := 0;
    bToTrip.Enabled := true;
  end
  else
    bToTrip.Enabled := false;
end;

procedure TfChildTrips.ShowPedagogueList;
begin

end;

procedure TfChildTrips.ShowTripingList(const id_order: integer);
begin
  if Assigned(TripingList) then
    FreeAndNil(TripingList);
  TripingList := Kernel.GetChildTrips(IDOrder);
  // ������� ������ �� ����� ���������, ���������� ������ ������ ��������
  Kernel.GetLVChildTrips(lvTriping, TripingList);
  if lvTriping.Items.Count > 0 then
  begin
    lvTriping.ItemIndex := 0;
    bDeleteRecord.Enabled := true;
  end
  else
    bDeleteRecord.Enabled := false;
end;

end.
