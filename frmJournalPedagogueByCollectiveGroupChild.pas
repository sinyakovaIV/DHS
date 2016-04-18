unit frmJournalPedagogueByCollectiveGroupChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel,
  DateUtils;

type
  TfJournalPedagogueByCollectiveGroupChild = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    lvCollectiveJournal: TListView;
    Panel4: TPanel;
    Button2: TButton;
    Button3: TButton;
    bToIndividualJournal: TButton;
    Button5: TButton;
    Button6: TButton;
    cbMonth: TComboBox;
    RadioGroup1: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bToIndividualJournalClick(Sender: TObject);
    procedure lvCollectiveJournalSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
  private
    FIDPedagogue: integer;
    FIDAcademicYear: integer;
    FStrPedagogue: string;
    FStrAcademicYear: string;
    NumberMonth: integer;
    CollectiveJournal: TResultTable;
    procedure ShowCollectiveJournal(const IDPedagogue, IDAcademicYear,
      NumberMonth: integer);
    procedure SetIDPedagogue(const Value: integer);
    procedure SetIDAcademicYear(const Value: integer);
    procedure SetStrPedagogue(const Value: string);
    procedure SetStrAcademicYear(const Value: string);
  public
    property IDPedagogue: integer read FIDPedagogue write SetIDPedagogue;
    property IDAcademicYear: integer read FIDAcademicYear
      write SetIDAcademicYear;
    property StrPedagogue: string read FStrPedagogue write SetStrPedagogue;
    property StrAcademicYear: string read FStrAcademicYear
      write SetStrAcademicYear;
  end;

var
  fJournalPedagogueByCollectiveGroupChild
    : TfJournalPedagogueByCollectiveGroupChild;

implementation

{$R *.dfm}

uses frmJournalPedagogueByIndividualGroupChild;

procedure TfJournalPedagogueByCollectiveGroupChild.bToIndividualJournalClick(
  Sender: TObject);
begin
  if (not Assigned(fJournalPedagogueByIndividualGroupChild)) then
    fJournalPedagogueByIndividualGroupChild :=
      TfJournalPedagogueByIndividualGroupChild.Create(Self);
  fJournalPedagogueByIndividualGroupChild.IDPedagogue := IDPedagogue;
  fJournalPedagogueByIndividualGroupChild.IDAcademicYear := IDAcademicYear;
  fJournalPedagogueByIndividualGroupChild.StrPedagogue := StrPedagogue;
  fJournalPedagogueByIndividualGroupChild.StrAcademicYear := StrAcademicYear;
  fJournalPedagogueByIndividualGroupChild.Month := NumberMonth;
  fJournalPedagogueByIndividualGroupChild.Show;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.Button2Click
  (Sender: TObject);
begin
  // ���� ��� �� ������ ������� � ���� ���� ���� �� � ����� ������, ���������� ������ �������� �� ������������� ������� � ������� - ����� ��������� �������...
end;

procedure TfJournalPedagogueByCollectiveGroupChild.Button6Click(
  Sender: TObject);
begin
  Close;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.cbMonthChange
  (Sender: TObject);
begin
  if cbMonth.ItemIndex <= 3 then
    NumberMonth := cbMonth.ItemIndex + 9
  else
    NumberMonth := cbMonth.ItemIndex - 3;
  ShowCollectiveJournal(IDPedagogue, IDAcademicYear, NumberMonth);
  Panel1.Caption := StrPedagogue + '   ' + StrAcademicYear + ' �.   ' +  cbMonth.Text;
  RadioGroup1.ItemIndex := cbMonth.ItemIndex;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.FormCreate(Sender: TObject);
begin
  CollectiveJournal := nil;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.FormDestroy(Sender: TObject);
begin
  if Assigned(CollectiveJournal) then
    FreeAndNil(CollectiveJournal);
end;

procedure TfJournalPedagogueByCollectiveGroupChild.FormShow(Sender: TObject);
begin
  NumberMonth := MonthOf(Now);
  if NumberMonth >= 9 then
  begin
    cbMonth.ItemIndex := NumberMonth - 9;
    RadioGroup1.ItemIndex := NumberMonth - 9;
  end
  else if NumberMonth <= 5 then
  begin
    cbMonth.ItemIndex := NumberMonth + 3;
    RadioGroup1.ItemIndex := NumberMonth + 3;
  end
  else
  begin
    cbMonth.ItemIndex := 8;
    RadioGroup1.ItemIndex := 8;
  end;
  Panel1.Caption := StrPedagogue + '   ' + StrAcademicYear + ' �.   ' +  cbMonth.Text;
  if (NumberMonth <= 5) or (NumberMonth >= 9) then
    ShowCollectiveJournal(IDPedagogue, IDAcademicYear, NumberMonth)
  else // � ������ ������ ����� ������������ ��� ���������� ������
    ShowCollectiveJournal(IDPedagogue, IDAcademicYear, 5);
end;

procedure TfJournalPedagogueByCollectiveGroupChild.lvCollectiveJournalSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if (not Assigned(fJournalPedagogueByIndividualGroupChild)) then
    fJournalPedagogueByIndividualGroupChild :=
      TfJournalPedagogueByIndividualGroupChild.Create(Self);
//  fJournalPedagogueByIndividualGroupChild.IDLearningGroup := GropeNameLastLesson
//    [Item.Index].ValueByName('ID_OUT');
   with CollectiveJournal[Item.Index] do
   begin
  fJournalPedagogueByIndividualGroupChild.IDLearningGroup := ValueByName('ID_OUT');
  fJournalPedagogueByIndividualGroupChild.StrLGName := ValueByName('NAME_LG');
  fJournalPedagogueByIndividualGroupChild.StrEducationProgram := ValueByName('PROGRAM_SHORT_NAME');
  fJournalPedagogueByIndividualGroupChild.StrLearningLevel := ValueByName('L_LEVEL');
  fJournalPedagogueByIndividualGroupChild.WeekCountHour := ValueByName('WEEK_COUNT_HOUR');
   end;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.RadioGroup1Click(
  Sender: TObject);
begin
  cbMonth.ItemIndex := RadioGroup1.ItemIndex;
  cbMonthChange(Sender);
end;

procedure TfJournalPedagogueByCollectiveGroupChild.SetIDAcademicYear
  (const Value: integer);
begin
  if FIDAcademicYear <> Value then
    FIDAcademicYear := Value;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.SetIDPedagogue
  (const Value: integer);
begin
  if FIDPedagogue <> Value then
    FIDPedagogue := Value;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.SetStrAcademicYear
  (const Value: string);
begin
  if FStrAcademicYear <> Value then
    FStrAcademicYear := Value;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.SetStrPedagogue
  (const Value: string);
begin
  if FStrPedagogue <> Value then
    FStrPedagogue := Value;
end;

procedure TfJournalPedagogueByCollectiveGroupChild.ShowCollectiveJournal
  (const IDPedagogue, IDAcademicYear, NumberMonth: integer);
begin
  if Assigned(CollectiveJournal) then
    FreeAndNil(CollectiveJournal);
  CollectiveJournal := Kernel.GetCollectiveJournal(IDPedagogue, IDAcademicYear,
    NumberMonth);
  Kernel.GetLVCollectiveJournal(lvCollectiveJournal, CollectiveJournal);
  if lvCollectiveJournal.Items.Count > 0 then
    lvCollectiveJournal.ItemIndex := 0;
end;

end.
