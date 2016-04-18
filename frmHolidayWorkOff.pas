unit frmHolidayWorkOff;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfNonWorkingDays = class(TForm)
    bClose: TButton;
    Panel1: TPanel;
    ListView1: TListView;
    cmbAcademicYear: TComboBox;
    Label1: TLabel;
    bAdd: TButton;
    bDelete: TButton;
    dtpWirkOffDay: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    AcademicYear: TResultTable;
    NonWorkingList: TResultTable;
    FIDAcademicYear: integer;
    procedure ShowWorkOffList;
    procedure SetIDAcademicYear(const Value: integer);
  public
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
  end;

var
  fNonWorkingDays: TfNonWorkingDays;

implementation

{$R *.dfm}

procedure TfNonWorkingDays.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
end;

procedure TfNonWorkingDays.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
end;

procedure TfNonWorkingDays.FormShow(Sender: TObject);
begin
  dtpWirkOffDay.Date := Date;
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(cmbAcademicYear, AcademicYear, 'NAME', false);
  Kernel.ChooseComboBoxItemIndex(cmbAcademicYear, AcademicYear, true, 'ID',
    IDAcademicYear);
end;

procedure TfNonWorkingDays.SetIDAcademicYear(const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfNonWorkingDays.ShowWorkOffList;
begin
  if Assigned(GropeNameLastLesson) then
    FreeAndNil(GropeNameLastLesson);
  GropeNameLastLesson := Kernel.GetLGNameLastLesson(IDPedagogue, IDAcademicYear);
  // выбираю данные из энтой процедуры, аналогично списку класса педагога
  Kernel.GetLVGropeNameLastLesson(lvLGNameLastLesson, GropeNameLastLesson);
  if lvLGNameLastLesson.Items.Count > 0 then
    lvLGNameLastLesson.ItemIndex := 0;
GetNonWorkDay
end;

end.
