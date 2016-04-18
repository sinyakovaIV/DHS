object fLearningGroupList: TfLearningGroupList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1091#1095#1077#1073#1085#1099#1093' '#1075#1088#1091#1087#1087
  ClientHeight = 541
  ClientWidth = 1074
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 1058
    Height = 89
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087' '#1087#1086' '#1082#1088#1080#1090#1088#1080#1103#1084': '
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
  object lvLearningGroup: TListView
    Left = 8
    Top = 112
    Width = 1058
    Height = 385
    Columns = <
      item
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
        Width = 225
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
        Caption = #1057#1090#1072#1090#1091#1089
        Width = 125
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
    OnCustomDrawItem = lvLearningGroupCustomDrawItem
    OnSelectItem = lvLearningGroupSelectItem
  end
  object Button3: TButton
    Left = 918
    Top = 508
    Width = 149
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object bNewRecord: TButton
    Left = 8
    Top = 508
    Width = 168
    Height = 25
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
  object bChangeRecord: TButton
    Left = 204
    Top = 508
    Width = 167
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = bChangeRecordClick
  end
  object bGroupMembers: TButton
    Left = 399
    Top = 508
    Width = 223
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1086#1083#1085#1103#1077#1084#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bGroupMembersClick
  end
  object bDeleteGroup: TButton
    Left = 651
    Top = 508
    Width = 149
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = bDeleteGroupeClick
  end
end
