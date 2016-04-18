object fSmallLearningGroup: TfSmallLearningGroup
  Left = 0
  Top = 0
  Caption = #1052#1077#1083#1082#1086#1075#1088#1091#1087#1087#1086#1074#1099#1077' '#1079#1072#1085#1103#1090#1080#1103
  ClientHeight = 541
  ClientWidth = 1200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    1200
    541)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 1184
    Height = 89
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086' '#1082#1088#1080#1090#1088#1080#1103#1084': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 526
      Top = 24
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 16
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
    end
    object Label3: TLabel
      Left = 326
      Top = 24
      Width = 51
      Height = 16
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
    end
    object Label4: TLabel
      Left = 666
      Top = 24
      Width = 89
      Height = 16
      Caption = #1057#1090#1072#1090#1091#1089' '#1075#1088#1091#1087#1087#1099':'
    end
    object cmbChooseAcademicYear: TComboBox
      Left = 526
      Top = 46
      Width = 110
      Height = 24
      Style = csDropDownList
      TabOrder = 2
      OnChange = cmbChooseAcademicYearChange
    end
    object cmbChooseEducationProgram: TComboBox
      Left = 16
      Top = 46
      Width = 280
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbChooseEducationProgramChange
    end
    object cmbChoosePedagogue: TComboBox
      Left = 326
      Top = 46
      Width = 170
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbChoosePedagogueChange
    end
    object cmbChooseStatus: TComboBox
      Left = 666
      Top = 46
      Width = 150
      Height = 24
      Style = csDropDownList
      TabOrder = 3
      OnChange = cmbChooseStatusChange
    end
  end
  object lvSmallLearningGroup: TListView
    Left = 8
    Top = 112
    Width = 1184
    Height = 268
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Caption = #1057#1086#1089#1090#1072#1074'/'#1085#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
        Width = 464
      end
      item
        Caption = #1059#1088#1086#1074#1077#1085#1100
        Width = 70
      end
      item
        Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
        Width = 220
      end
      item
        Caption = #1063#1072#1089#1086#1074
        Width = 55
      end
      item
        Caption = #1055#1077#1076#1072#1075#1086#1075
        Width = 130
      end
      item
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
        Width = 100
      end
      item
        Width = 46
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnCustomDrawItem = lvSmallLearningGroupCustomDrawItem
    OnSelectItem = lvSmallLearningGroupSelectItem
  end
  object bClose: TButton
    Left = 1044
    Top = 509
    Width = 148
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bCloseClick
  end
  object bNewRecord: TButton
    Left = 969
    Top = 397
    Width = 223
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = bNewRecordClick
  end
  object bGroupMembers: TButton
    Left = 969
    Top = 428
    Width = 223
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1086#1083#1085#1103#1077#1084#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = bGroupMembersClick
  end
  object bDeleteGroup: TButton
    Left = 969
    Top = 459
    Width = 223
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bDeleteGroupeClick
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 392
    Width = 923
    Height = 142
    Anchors = [akLeft, akBottom]
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'/'#1089#1086#1079#1076#1072#1090#1100' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    DesignSize = (
      923
      142)
    object Label5: TLabel
      Left = 17
      Top = 72
      Width = 79
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 362
      Top = 72
      Width = 89
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1057#1090#1072#1090#1091#1089' '#1075#1088#1091#1087#1087#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 165
      Top = 72
      Width = 103
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 550
      Top = 72
      Width = 54
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1059#1088#1086#1074#1077#1085#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 414
      Top = 20
      Width = 69
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 677
      Top = 72
      Width = 40
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1063#1072#1089#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 725
      Top = 20
      Width = 51
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 17
      Top = 20
      Width = 330
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1057#1086#1089#1090#1072#1074'/'#1085#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' ('#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')'
    end
    object bSave: TButton
      Left = 804
      Top = 82
      Width = 115
      Height = 45
      Anchors = [akLeft, akBottom]
      BiDiMode = bdLeftToRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageAlignment = iaCenter
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = bSaveClick
    end
    object cmbAcademicYear: TComboBox
      Left = 17
      Top = 95
      Width = 108
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cmbEducationProgram: TComboBox
      Left = 414
      Top = 43
      Width = 283
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      DropDownCount = 14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cmbHoursAmount: TComboBox
      Left = 677
      Top = 95
      Width = 109
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cmbLearningForm: TComboBox
      Left = 165
      Top = 95
      Width = 175
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cmbLearningLevel: TComboBox
      Left = 550
      Top = 95
      Width = 100
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      DropDownCount = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object cmbPedagogue: TComboBox
      Left = 725
      Top = 43
      Width = 175
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object cmbStatus: TComboBox
      Left = 367
      Top = 95
      Width = 159
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object eGroupName: TEdit
      Left = 17
      Top = 43
      Width = 378
      Height = 24
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 8
    end
  end
end
