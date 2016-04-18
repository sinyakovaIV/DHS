// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
program Pr_dhs;

uses
  Vcl.Forms,
  ExceptionMon,
  frmMain in 'frmMain.pas' {fMain},
  frmPedagogue in 'frmPedagogue.pas' {fPedagogue},
  frmChild in 'frmChild.pas' {fChild},
  uIBConnect in 'uIBConnect.pas',
  dbfunc in 'dbfunc.pas',
  uKernel in 'uKernel.pas',
  frmContact in 'frmContact.pas' {fContact},
  frmLearningGroupList in 'frmLearningGroupList.pas' {fLearningGroupList},
  frmLearningGroupEdit in 'frmLearningGroupEdit.pas' {fLearningGroupEdit},
  frmLGroupMembers in 'frmLGroupMembers.pas' {fLGroupMembers},
  frmPedagogueClass in 'frmPedagogueClass.pas' {fPedagogueClass},
  frmPedagogueClassEdit in 'frmPedagogueClassEdit.pas' {fPedagogueClassEdit},
  frmPedagogueClassEditMini in 'frmPedagogueClassEditMini.pas' {fPedagogueClassEditMini},
  frmAutorization in 'frmAutorization.pas' {fAutorization},
  frmTimesheet in 'frmTimesheet.pas' {fTimesheet},
  frmTimesheetEdit in 'frmTimesheetEdit.pas' {fTimesheetEdit},
  frmExcelExperiment in 'frmExcelExperiment.pas' {fExcelExperiment},
  frmReport_PedWorkLoad in 'frmReport_PedWorkLoad.pas' {fReport_PedWorkLoad},
  frmParents in 'frmParents.pas' {fParents},
  frmOrders in 'frmOrders.pas' {fOrders},
  frmSmallLearningGroup in 'frmSmallLearningGroup.pas' {fSmallLearningGroup},
  frmSmallLearnGrMembers in 'frmSmallLearnGrMembers.pas' {fSmallLearnGrMembers},
  frmExperiment in 'frmExperiment.pas' {fExperiment},
  frmAgeStructure in 'frmAgeStructure.pas' {fAgeStructure},
  frmJournalPedagogueByIndividualGroupChild in 'frmJournalPedagogueByIndividualGroupChild.pas' {fJournalPedagogueByIndividualGroupChild},
  frmSickLeave in 'frmSickLeave.pas' {fSickLeave},
  frmChildTrips in 'frmChildTrips.pas' {fChildTrips},
  frmPedagogueTrips in 'frmPedagogueTrips.pas' {fPedagogueTrips},
  frmJournalPedagogueByCollectiveGroupChild in 'frmJournalPedagogueByCollectiveGroupChild.pas' {fJournalPedagogueByCollectiveGroupChild},
  frmJournalPedagogue in 'frmJournalPedagogue.pas' {fJournalPedagogue},
  frmNonWorkingDays in 'frmNonWorkingDays.pas' {fNonWorkingDays},
  frmJournalOpening in 'frmJournalOpening.pas' {fJournalOpening},
  frmRealisationVolume in 'frmRealisationVolume.pas' {fRealisationVolume},
  frmGroupComposition in 'frmGroupComposition.pas' {fGroupComposition},
  frmChildDataForJournal in 'frmChildDataForJournal.pas' {fChildDataForJournal},
  frmTimeSheetReport in 'frmTimeSheetReport.pas' {fTimeSheetReport},
  frmMonitoringZUN in 'frmMonitoringZUN.pas' {fMonitoringSUN},
  frmContingentSafety in 'frmContingentSafety.pas' {fContingentSafety};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  // ��� �������� ���������� � ���������� �����
  Application.Title := '���';
  Application.CreateForm(TfAutorization, fAutorization);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfContact, fContact);
  Application.CreateForm(TfLearningGroupEdit, fLearningGroupEdit);
  Application.CreateForm(TfLGroupMembers, fLGroupMembers);
  Application.CreateForm(TfPedagogueClassEdit, fPedagogueClassEdit);
  Application.CreateForm(TfPedagogueClassEditMini, fPedagogueClassEditMini);
  Application.CreateForm(TfTimesheet, fTimesheet);
  Application.CreateForm(TfExcelExperiment, fExcelExperiment);
  Application.CreateForm(TfReport_PedWorkLoad, fReport_PedWorkLoad);
  Application.CreateForm(TfOrders, fOrders);
  Application.CreateForm(TfSmallLearningGroup, fSmallLearningGroup);
  Application.CreateForm(TfSmallLearnGrMembers, fSmallLearnGrMembers);
  Application.CreateForm(TfExperiment, fExperiment);
  Application.CreateForm(TfAgeStructure, fAgeStructure);
  Application.CreateForm(TfJournalPedagogueByIndividualGroupChild, fJournalPedagogueByIndividualGroupChild);
  Application.CreateForm(TfSickLeave, fSickLeave);
  Application.CreateForm(TfChildTrips, fChildTrips);
  Application.CreateForm(TfPedagogueTrips, fPedagogueTrips);
  Application.CreateForm(TfJournalPedagogueByCollectiveGroupChild, fJournalPedagogueByCollectiveGroupChild);
  Application.CreateForm(TfJournalPedagogue, fJournalPedagogue);
  Application.CreateForm(TfNonWorkingDays, fNonWorkingDays);
  Application.CreateForm(TfJournalOpening, fJournalOpening);
  Application.CreateForm(TfRealisationVolume, fRealisationVolume);
  Application.CreateForm(TfGroupComposition, fGroupComposition);
  Application.CreateForm(TfChildDataForJournal, fChildDataForJournal);
  Application.CreateForm(TfTimeSheetReport, fTimeSheetReport);
  Application.CreateForm(TfMonitoringSUN, fMonitoringSUN);
  Application.CreateForm(TfContingentSafety, fContingentSafety);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;

end.
