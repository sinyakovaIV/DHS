unit frmJournalPedagogueByGroupChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, dbfunc, uKernel;

type
  TfJournalPedagogueByGroupChild = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fJournalPedagogueByGroupChild: TfJournalPedagogueByGroupChild;

implementation

{$R *.dfm}

// ���� ����� �������������� ���, �� ����������� ��� �����(����)
// ���������� ��������/����������� ����
// �������, ������� ���, �����, ��������/�����, ���������, �������,
// ����������: ��. 13.00-19.00, ��. 8.00-20.00, ������ �... �� ...(NUMBER_DATE),
// �������/��������� ������
// ������ ��������, ������ ������������ (���, �����- � �������������� �������)
// ������������� (�����������, ��������) ��������
// ��� ��������� �������: lv � �����, ���� ������, ���-�� ����� (0 ��� 1), ���� ������� (� �����/������) ��� ������� � �����, �������� ������
end.
