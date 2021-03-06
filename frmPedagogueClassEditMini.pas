unit frmPedagogueClassEditMini;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfPedagogueClassEditMini = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    cmbOrderOut: TComboBox;
    Panel6: TPanel;
    Label1: TLabel;
    cmbOrderIn: TComboBox;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    cmbHoursAmount: TComboBox;
    cmbLearningLevel: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    bSave: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    InOrderList: TResultTable;
    OutOrderList: TResultTable;
    LearningLevel: TResultTable;
    AmountHours: TResultTable;

    FNewRecord: boolean;
    FIDEducationProgram: integer;
    FIDPedagogue: integer;
    FIDAcademicYear: integer;
    FIDLearningChild: integer;

    FIDLearningGroup: integer;
    FIDLearningLevel: integer;
    // FStatusLearningGroup: integer;    ������� ����������!
    FWeekAmountHours: integer;
    FIDLearningGroupMember: integer;
    FIDOrderIn: integer;
    FIDOrderOut: variant;

    FStrEducationProgram: string;
    FStrPedagogue: string;
    FStrAcademicYear: string;
    FStrSurnameNameChild: string;

    procedure SetNewRecord(const Value: boolean);
    procedure SetIDEducationProgram(const Value: integer);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    procedure SetIDLearningChild(const Value: integer);

    procedure SetIDLearningGroup(const Value: integer);
    procedure SetIDLearningLevel(const Value: integer);
    procedure SetWeekAmountHours(const Value: integer);
    procedure SetIDLearningGroupMember(const Value: integer);
    procedure SetIDOrderIn(const Value: integer);
    procedure SetIDOrderOut(const Value: variant);

    procedure SetStrEducationProgram(const Value: string);
    procedure SetStrPedagogue(const Value: string);
    procedure SetStrAcademicYear(const Value: string);
    procedure SetStrSurnameNameChild(const Value: string);
  public
    property NewRecord: boolean read FNewRecord write SetNewRecord;
    property IDEducationProgram: integer read FIDEducationProgram
      write SetIDEducationProgram;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property IDLearningChild: integer read FIDLearningChild
      write SetIDLearningChild;

    property IDLearningGroup: integer read FIDLearningGroup
      write SetIDLearningGroup;
    property IDLearningLevel: integer read FIDLearningLevel
      write SetIDLearningLevel;
    property WeekAmountHours: integer read FWeekAmountHours
      write SetWeekAmountHours;
    property IDLearningGroupMember: integer read FIDLearningGroupMember
      write SetIDLearningGroupMember;
    property IDOrderIn: integer read FIDOrderIn write SetIDOrderIn;
    property IDOrderOut: variant read FIDOrderOut write SetIDOrderOut;

    property StrEducationProgram: string read FStrEducationProgram
      write SetStrEducationProgram;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
    property StrSurnameNameChild: string read FStrSurnameNameChild
      write SetStrSurnameNameChild;
  end;

var
  fPedagogueClassEditMini: TfPedagogueClassEditMini;

implementation

{$R *.dfm}

procedure TfPedagogueClassEditMini.bSaveClick(Sender: TObject);
var
  id_lg, id_lgm, order_out: integer;
begin
  if (cmbLearningLevel.ItemIndex = -1) or (cmbHoursAmount.ItemIndex = -1) then
  begin
    ShowMessage('�� ��� ���� ���������!');
    Exit;
  end;

  if NewRecord then  // ��������� ������ �������
  begin
    id_lg := -1;
    id_lgm := -1;
    if Kernel.SavePedagogueClassMember([id_lg, 3, IDEducationProgram,
      IDPedagogue, LearningLevel[cmbLearningLevel.ItemIndex].ValueByName('ID'),
      IDAcademicYear, 3, AmountHours[cmbHoursAmount.ItemIndex]
      .ValueByName('WEEK_AMOUNT'), StrSurnameNameChild, id_lgm, IDLearningChild,
      3, InOrderList[cmbOrderIn.ItemIndex].ValueByName('ID_OUT'), null]) then
// TODO 1: ��������� ��� ���������� ���������� ������� ������ �� ��������/��������/�������� ����� - ������ ����������
    begin
      ShowMessage('���������� ���������!');
      Close;
    end
    else
      ShowMessage('������ ��� ����������!');
    Close;
  end
  else
  begin
    id_lg := IDLearningGroup;     // ��������� �������
    id_lgm := IDLearningGroupMember;
    if ((cmbOrderOut.Text = '������ ����������') or
      (cmbOrderOut.ItemIndex = -1)) then
    begin
      if Kernel.SavePedagogueClassMember([id_lg, 3, IDEducationProgram,
        IDPedagogue, LearningLevel[cmbLearningLevel.ItemIndex]
        .ValueByName('ID'), IDAcademicYear, 3,
        AmountHours[cmbHoursAmount.ItemIndex].ValueByName('WEEK_AMOUNT'),
        StrSurnameNameChild, id_lgm, IDLearningChild, 3,
        InOrderList[cmbOrderIn.ItemIndex].ValueByName('ID_OUT'), null]) then
      begin
        ShowMessage('���������� ���������!');
        Close;
      end
      else
        ShowMessage('������ ��� ����������!');
      Close;
    end
    else  // ��������� �������
    begin
      order_out := OutOrderList[cmbOrderOut.ItemIndex].ValueByName('ID_OUT');
      if Kernel.SavePedagogueClassMember([id_lg, 3, IDEducationProgram,
        IDPedagogue, LearningLevel[cmbLearningLevel.ItemIndex]
        .ValueByName('ID'), IDAcademicYear, 3,
        AmountHours[cmbHoursAmount.ItemIndex].ValueByName('WEEK_AMOUNT'),
        StrSurnameNameChild, id_lgm, IDLearningChild, 2,
        InOrderList[cmbOrderIn.ItemIndex].ValueByName('ID_OUT'), order_out]) then
      begin
        ShowMessage('���������� ���������!');
        Close;
      end
      else
        ShowMessage('������ ��� ����������!');
      Close;
    end;
  end;
end;

procedure TfPedagogueClassEditMini.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedagogueClassEditMini.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfPedagogueClassEditMini.FormCreate(Sender: TObject);
begin
  InOrderList := nil;
  OutOrderList := nil;
  LearningLevel := nil;
  AmountHours := nil;
end;

procedure TfPedagogueClassEditMini.FormDestroy(Sender: TObject);
begin
  if Assigned(InOrderList) then
    FreeAndNil(InOrderList);
  if Assigned(OutOrderList) then
    FreeAndNil(OutOrderList);
  if Assigned(LearningLevel) then
    FreeAndNil(LearningLevel);
  if Assigned(AmountHours) then
    FreeAndNil(AmountHours);
end;

procedure TfPedagogueClassEditMini.FormShow(Sender: TObject);
var
  i: integer;
begin
  Panel2.Caption := StrSurnameNameChild + ', �������: ' + StrPedagogue + ', ' +
    StrAcademicYear + ' ��/���, "' + StrEducationProgram + '"';

  if not Assigned(InOrderList) then
    InOrderList := Kernel.GetInOutOrderList(IDAcademicYear, 1);
  with cmbOrderIn do
  begin
    Clear;
    for i := 0 to InOrderList.Count - 1 do
      Items.Add(InOrderList[i].ValueStrByName('NUMBER_DATES_NAME'));
    if InOrderList.Count > 0 then
      DropDownCount := InOrderList.Count + 1;
  end;

  if not Assigned(OutOrderList) then
    OutOrderList := Kernel.GetInOutOrderList(IDAcademicYear, 2);
  with cmbOrderOut do
  begin
    Clear;
    for i := 0 to OutOrderList.Count - 1 do
      Items.Add(OutOrderList[i].ValueStrByName('NUMBER_DATES_NAME'));
    Items.Add('������ ����������');
    if OutOrderList.Count > 0 then
      DropDownCount := OutOrderList.Count + 1;
  end;

  if not Assigned(LearningLevel) then
    LearningLevel := Kernel.GetLearningLevel;
  with cmbLearningLevel do
  begin
    Clear;
    for i := 0 to LearningLevel.Count - 1 do
      Items.Add(LearningLevel[i].ValueStrByName('NAME'));
    if LearningLevel.Count > 0 then
      DropDownCount := LearningLevel.Count + 1;
  end;

  if not Assigned(AmountHours) then
    AmountHours := Kernel.GetAmountHours;
  with cmbHoursAmount do
  begin
    Clear;
    for i := 0 to AmountHours.Count - 1 do
      Items.Add(AmountHours[i].ValueStrByName('WEEK_AMOUNT'));
    if AmountHours.Count > 0 then
      DropDownCount := AmountHours.Count + 1;
  end;

  if NewRecord then
  begin
    cmbOrderIn.ItemIndex := 0;
    // cmbOrderOut.ItemIndex := 0;
    cmbOrderOut.Enabled := false;
    cmbLearningLevel.ItemIndex := -1;
    cmbHoursAmount.ItemIndex := -1;
  end
  else
  begin
    cmbOrderOut.Enabled := true;
    for i := 0 to InOrderList.Count - 1 do
      if InOrderList[i].ValueByName('ID_OUT') = IDOrderIn then
        cmbOrderIn.ItemIndex := i;
    for i := 0 to OutOrderList.Count - 1 do
      if OutOrderList[i].ValueByName('ID_OUT') = IDOrderOut then
        cmbOrderOut.ItemIndex := i;
    for i := 0 to LearningLevel.Count - 1 do
      if LearningLevel[i].ValueByName('ID') = IDLearningLevel then
        cmbLearningLevel.ItemIndex := i;
    for i := 0 to AmountHours.Count - 1 do
      if AmountHours[i].ValueByName('WEEK_AMOUNT') = WeekAmountHours then
        cmbHoursAmount.ItemIndex := i;
  end;

end;

procedure TfPedagogueClassEditMini.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfPedagogueClassEditMini.SetIDEducationProgram(const Value: integer);
begin
  if FIDEducationProgram <> Value then
    FIDEducationProgram := Value;
end;

procedure TfPedagogueClassEditMini.SetIDLearningChild(const Value: integer);
begin
  if FIDLearningChild <> Value then
    FIDLearningChild := Value;
end;

procedure TfPedagogueClassEditMini.SetIDLearningGroup(const Value: integer);
begin
  if FIDLearningGroup <> Value then
    FIDLearningGroup := Value;
end;

procedure TfPedagogueClassEditMini.SetIDLearningGroupMember
  (const Value: integer);
begin
  if FIDLearningGroupMember <> Value then
    FIDLearningGroupMember := Value;
end;

procedure TfPedagogueClassEditMini.SetIDLearningLevel(const Value: integer);
begin
  if FIDLearningLevel <> Value then
    FIDLearningLevel := Value;
end;

procedure TfPedagogueClassEditMini.SetIDOrderIn(const Value: integer);
begin
  if FIDOrderIn <> Value then
    FIDOrderIn := Value;
end;

procedure TfPedagogueClassEditMini.SetIDOrderOut(const Value: variant);
begin
  if FIDOrderOut <> Value then
    FIDOrderOut := Value;
end;

procedure TfPedagogueClassEditMini.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfPedagogueClassEditMini.SetNewRecord(const Value: boolean);
begin
  if FNewRecord <> Value then
    FNewRecord := Value;
end;

procedure TfPedagogueClassEditMini.SetStrAcademicYear(const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfPedagogueClassEditMini.SetStrEducationProgram(const Value: string);
begin
  if FStrEducationProgram <> Value then
    FStrEducationProgram := Value;
end;

procedure TfPedagogueClassEditMini.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfPedagogueClassEditMini.SetStrSurnameNameChild(const Value: string);
begin
  if FStrSurnameNameChild <> Value then
    FStrSurnameNameChild := Value;
end;

procedure TfPedagogueClassEditMini.SetWeekAmountHours(const Value: integer);
begin
  if FWeekAmountHours <> Value then
    FWeekAmountHours := Value;
end;

end.
