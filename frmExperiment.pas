unit frmExperiment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, dbfunc, uKernel;

type
  TfExperiment = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    AcademicYear: TResultTable;
    FIDCurAcademicYear: integer;
    procedure SetIDCurAcademicYear(const Value: integer);

  public
    property IDCurAcademicYear: integer read FIDCurAcademicYear
      write SetIDCurAcademicYear;
  end;

var
  fExperiment: TfExperiment;

implementation

{$R *.dfm}
{ TfExperiment }

procedure TfExperiment.FormCreate(Sender: TObject);
begin
  AcademicYear := nil;
end;

procedure TfExperiment.FormDestroy(Sender: TObject);
begin
  if Assigned(AcademicYear) then
    FreeAndNil(AcademicYear);
end;

procedure TfExperiment.FormShow(Sender: TObject);
begin
  if not Assigned(AcademicYear) then
    AcademicYear := Kernel.GetAcademicYear;
  Kernel.FillingComboBox(ComboBox1, AcademicYear, 'NAME', true);
  Kernel.FillingComboBox(ComboBox2, AcademicYear, 'NAME', true);

  Kernel.ChooseComboBoxItemIndex(ComboBox1, AcademicYear, true, 'ID',
    IDCurAcademicYear, ComboBox1.Text);
  Kernel.ChooseComboBoxItemIndex(ComboBox2, AcademicYear, false, 'NAME', 0,
    ComboBox1.Text);
end;

procedure TfExperiment.SetIDCurAcademicYear(const Value: integer);
begin
  if FIDCurAcademicYear <> Value then
    FIDCurAcademicYear := Value;
end;

end.
