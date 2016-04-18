unit frmMonitoringZUN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, dbfunc, uKernel, Vcl.Mask;

type
  TfMonitoringSUN = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    cmbPedagogue: TComboBox;
    cmbAcademicYear: TComboBox;
    Label2: TLabel;
    cmbEducationProgram: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit1: TEdit;
    Panel6: TPanel;
    Edit2: TEdit;
    Panel7: TPanel;
    Edit3: TEdit;
    Panel8: TPanel;
    Edit4: TEdit;
    Panel9: TPanel;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PedagogueSurnameNP: TResultTable;
    AcademicYear: TResultTable;
    EducationProgram: TResultTable;
    FIDPedagogue: integer;
    FIDCurAcademicYear: integer;
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDCurAcademicYear(const Value: integer);
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDCurAcademicYear: integer read FIDCurAcademicYear
      write SetIDCurAcademicYear;
  end;

var
  fMonitoringSUN: TfMonitoringSUN;

implementation

{$R *.dfm}

//{ TForm1 }

procedure TfMonitoringSUN.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
  PedagogueSurnameNP := nil;
  EducationProgram := nil;
end;

procedure TfMonitoringSUN.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
  if Assigned(PedagogueSurnameNP) then
    FreeAndNil(PedagogueSurnameNP);
  if Assigned(EducationProgram) then
    FreeAndNil(EducationProgram);
end;

procedure TfMonitoringSUN.FormShow(Sender: TObject);
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true,
    'ID', IDCurAcademicYear);

  if not Assigned(PedagogueSurnameNP) then
    PedagogueSurnameNP := Kernel.GetPedagogueSurnameNP;
  Kernel.FillingComboBox(cmbPedagogue, PedagogueSurnameNP,
    'SurnameNP', false);
  Kernel.ChooseComboBoxItemIndex(cmbPedagogue, PedagogueSurnameNP, true,
    'ID_OUT', IDPedagogue);

  if not Assigned(EducationProgram) then
    EducationProgram := Kernel.GetEducationProgram;
  Kernel.FillingComboBox(cmbEducationProgram, EducationProgram, 'NAME', true);
   Kernel.ChooseComboBoxItemIndex(cmbEducationProgram, EducationProgram, true, 'ID',
   IDCurAcademicYear);
  cmbEducationProgram.ItemIndex := 0;
end;

procedure TfMonitoringSUN.SetIDCurAcademicYear(const Value: integer);
begin
  if FIDCurAcademicYear <> Value then
    FIDCurAcademicYear := Value;
end;

procedure TfMonitoringSUN.SetIDPedagogue(const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

end.
