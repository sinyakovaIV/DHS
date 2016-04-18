object fJournalOpening: TfJournalOpening
  Left = 0
  Top = 0
  Caption = #1054#1090#1082#1088#1099#1090#1080#1077' '#1078#1072#1088#1085#1091#1083#1072' '#1087#1077#1076#1072#1075#1086#1075#1072
  ClientHeight = 527
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    709
    527)
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 146
    Top = 503
    Width = 79
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
  end
  object lvLGNameLastLesson: TListView
    Left = 237
    Top = 69
    Width = 464
    Height = 421
    Anchors = [akLeft, akTop, akBottom]
    Checkboxes = True
    Columns = <
      item
        Caption = #8470
        Width = 47
      end
      item
        Caption = #1043#1088#1091#1087#1087#1072'/'#1059#1095#1072#1097#1080#1081#1089#1103
        Width = 220
      end
      item
        Caption = #1055#1088'-'#1084#1072
        Width = 65
      end
      item
        Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1079#1072#1085#1103#1090#1080#1077
        Width = 135
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object lvPedagogueList: TListView
    Left = 8
    Top = 10
    Width = 217
    Height = 263
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Caption = #8470
        Width = 47
      end
      item
        Caption = #1055#1077#1076#1072#1075#1086#1075
        Width = 150
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvPedagogueListSelectItem
  end
  object bCheckAllPedagogue: TButton
    Left = 8
    Top = 287
    Width = 217
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1087#1077#1076#1072#1075#1086#1075#1086#1074
    TabOrder = 2
    OnClick = bCheckAllPedagogueClick
  end
  object bCheckAllGroup: TButton
    Left = 8
    Top = 327
    Width = 217
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1075#1088#1091#1087#1087#1099' / '#1091#1095#1072#1097#1080#1093#1089#1103
    TabOrder = 3
    OnClick = bCheckAllGroupClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 365
    Width = 217
    Height = 125
    Anchors = [akLeft, akBottom]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      213
      121)
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 143
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086' '#1076#1072#1090#1099' '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086':'
    end
    object bOpenJournal: TButton
      Left = 8
      Top = 10
      Width = 197
      Height = 42
      Anchors = [akLeft, akBottom]
      Caption = ' '#1054#1090#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083
      TabOrder = 0
      OnClick = bOpenJournalClick
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 86
      Width = 197
      Height = 24
      Anchors = [akLeft, akBottom]
      Date = 42244.357743912030000000
      Time = 42244.357743912030000000
      TabOrder = 1
      OnChange = DateTimePicker1Change
    end
  end
  object bClose: TButton
    Left = 591
    Top = 496
    Width = 111
    Height = 24
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 237
    Top = 8
    Width = 464
    Height = 47
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object cmbAcademicYear: TComboBox
    Left = 237
    Top = 495
    Width = 137
    Height = 24
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    OnChange = cmbAcademicYearChange
  end
end
