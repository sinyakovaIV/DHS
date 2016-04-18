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

// если будет присутствовать КТП, то фиксировать его номер(шифр)
// справочник выходных/праздничных дней
// педагог, учебный год, месяц, учащийся/група, программа, уровень,
// Расписание: пн. 13.00-19.00, ср. 8.00-20.00, приказ №... от ...(NUMBER_DATE),
// открыть/заполнить журнал
// журнал педагога, журнал посещаемости (инд, групп- и мелкогрупповых занятий)
// разновидности (особенности, описания) журналов
// инд страничка ученика: lv с датой, днем недели, кол-во часов (0 или 1), тема занятия (с кодом/шифром) или коммент к уроку, возможно статус
end.
