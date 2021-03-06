unit frmSickLeave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfSickLeave = class(TForm)
    Panel1: TPanel;
    cmbPedagogue: TComboBox;
    cmbAcademicYear: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    lvSickLeave: TListView;
    bAddSickLeave: TButton;
    Button3: TButton;
    bDeleteSickLeave: TButton;
    Panel2: TPanel;
    cmbAcademicYear2: TComboBox;
    cmbPedagogue2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    dtpDateBegining: TDateTimePicker;
    dtpDateEnding: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    bSaveSickLeave: TButton;
    bChange: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bAddSickLeaveClick(Sender: TObject);
    procedure bSaveSickLeaveClick(Sender: TObject);
    procedure lvSickLeaveSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure bDeleteSickLeaveClick(Sender: TObject);
    procedure cmbPedagogueChange(Sender: TObject);
    procedure cmbAcademicYearChange(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
  private
    IDSickLeave: integer;
    AcademicYear: TResultTable;
    PedagogueSurnameNP: TResultTable;
    SickLeave: TResultTable;
    FStrPedagogue: string;
    FIDPedagogue: integer;
    FStrAcademicYear: string;
    FIDAcademicYear: integer;
    procedure SetStrPedagogue(const Value: string);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetStrAcademicYear(const Value: string);
    procedure SetIDAcademicYear(const Value: integer);
    procedure ShowSickLeaveList;
  public
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
  end;

var
  fSickLeave: TfSickLeave;

implementation

{$R *.dfm}
{ TfSickLeave }

procedure TfSickLeave.bAddSickLeaveClick(Sender: TObject);
begin
  // Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
  // 'ID_OUT', IDPedagogue);
  // Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
  // IDAcademicYear);
  cmbPedagogue2.ItemIndex := -1;
  // cmbAcademicYear2.ItemIndex := -1;
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear2, AcademicYear, false, 'ID',
    IDAcademicYear);
  dtpDateBegining.Date := Date;
  dtpDateEnding.Date := Date;
  IDSickLeave := -1;
  bChange.Enabled := false;
  bDeleteSickLeave.Enabled := false;
  bSaveSickLeave.Enabled := true;
end;

procedure TfSickLeave.bChangeClick(Sender: TObject);
begin
  bChange.Enabled := true;
  bDeleteSickLeave.Enabled := true; // ���� ��������, ��� false
  bSaveSickLeave.Enabled := true;
end;

procedure TfSickLeave.bDeleteSickLeaveClick(Sender: TObject);
begin
  if Kernel.DeleteSickLeave([IDSickLeave]) then
  begin
    ShowMessage('������ �������!');
    // ����� �� ����� �������� ��� ���������!!???
  end
  else
    ShowMessage('������ ��� �������� ������!');
  ShowSickLeaveList;
end;

procedure TfSickLeave.bSaveSickLeaveClick(Sender: TObject);
var
  i1, i2: integer;
  s1, s2: string;
begin
  if (cmbPedagogue2.ItemIndex = -1) or (cmbAcademicYear2.ItemIndex = -1) then
  begin
    ShowMessage('�������� �������� � ������� ���!');
    Exit;
  end;
  i1 := AcademicYear[cmbAcademicYear2.ItemIndex].ValueByName('ID');
  i2 := PedagogueSurnameNP[cmbPedagogue2.ItemIndex].ValueByName('ID_OUT');
  s1 := dateToStr(dtpDateBegining.Date);
  s2 := dateToStr(dtpDateEnding.Date);
  if Kernel.SaveSickLeave([IDSickLeave, AcademicYear[cmbAcademicYear2.ItemIndex]
    .ValueByName('ID'), PedagogueSurnameNP[cmbPedagogue2.ItemIndex]
    .ValueByName('ID_OUT'), dateToStr(dtpDateBegining.Date),
    dateToStr(dtpDateEnding.Date)]) then
    ShowMessage('���������� ���������!')
  else
    ShowMessage('������ ��� ����������!');
  ShowSickLeaveList;
end;

procedure TfSickLeave.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfSickLeave.cmbAcademicYearChange(Sender: TObject);
begin
  ShowSickLeaveList;
end;

procedure TfSickLeave.cmbPedagogueChange(Sender: TObject);
begin
  ShowSickLeaveList;
end;

procedure TfSickLeave.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  PedagogueSurnameNP := nil;
  SickLeave := nil;
end;

procedure TfSickLeave.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(SickLeave) then
    FreeAndNil(SickLeave);
end;

procedure TfSickLeave.FormShow(Sender: TObject);
var
  i: integer;
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', true);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDAcademicYear);
  Kernel.FillingComboBox(cmbAcademicYear2, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear2, AcademicYear, false, 'ID',
    IDAcademicYear);

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP, 'SurnameNP', true);
  // Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
  // 'ID_OUT', IDPedagogue);
  cmbPedagogue.ItemIndex := 0;
  Kernel.FillingComboBox(cmbPedagogue2, PedagogueSurnameNP, 'SurnameNP', false);
  // Kernel.ChooseComboBoxItemIndex(cmbPedagogue2, PedagogueSurnameNP, false,
  // 'ID_OUT', IDPedagogue);
  cmbPedagogue2.ItemIndex := -1;

  dtpDateBegining.Date := Date;
  dtpDateEnding.Date := Date;
  ShowSickLeaveList;
  Panel1.Caption := '�������: ' + StrPedagogue + ',  ' + StrAcademicYear +
    ' ������� ���.';
end;

procedure TfSickLeave.lvSickLeaveSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i: integer;
begin
  if SickLeave.Count > 0 then
    with SickLeave[Item.Index] do
    begin
      IDSickLeave := ValueByName('ID_OUT');
      dtpDateBegining.Date := ValueByName('DATE_BEGINING');
      dtpDateEnding.Date := ValueByName('DATE_ENDING');

      for i := 0 to AcademicYear.Count - 1 do
        if cmbAcademicYear2.Items[i] = ValueStrByName('ACADEMIC_YEAR') then
          cmbAcademicYear2.ItemIndex := i;
      for i := 0 to PedagogueSurnameNP.Count - 1 do
        if cmbPedagogue2.Items[i] = ValueStrByName('SURNAMENP') then
          cmbPedagogue2.ItemIndex := i;
    end;
  // bDeleteSickLeave.Enabled := false;
  // bSaveSickLeave.Enabled := false;
end;

procedure TfSickLeave.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfSickLeave.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfSickLeave.SetStrAcademicYear(const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfSickLeave.SetStrPedagogue(const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfSickLeave.ShowSickLeaveList;
var
  id_academic_year, id_pedagogue: integer;
begin
  if cmbPedagogue.ItemIndex = 0 then
    id_pedagogue := 0
  else
    id_pedagogue := PedagogueSurnameNP[cmbPedagogue.ItemIndex - 1]
      .ValueByName('ID_OUT');

  if cmbAcademicYear.ItemIndex = 0 then
    id_academic_year := 0
  else
    id_academic_year := AcademicYear[cmbAcademicYear.ItemIndex - 1]
      .ValueByName('ID');

  if Assigned(SickLeave) then
    FreeAndNil(SickLeave);
  SickLeave := Kernel.GetSickLeave(id_pedagogue, id_academic_year);
  Kernel.GetLVSickLeave(lvSickLeave, SickLeave);
  if lvSickLeave.Items.Count > 0 then
  begin
    lvSickLeave.ItemIndex := 0;
    bChange.Enabled := true;
    bDeleteSickLeave.Enabled := true;
    bSaveSickLeave.Enabled := false;
  end
  else
  begin
    IDSickLeave := -1;
    bChange.Enabled := false;
    bDeleteSickLeave.Enabled := false;
    bSaveSickLeave.Enabled := false;
  end;
end;

end.
