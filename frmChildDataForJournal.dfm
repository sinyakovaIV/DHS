object fChildDataForJournal: TfChildDataForJournal
  Left = 0
  Top = 0
  Caption = #1057#1074#1076#1077#1085#1080#1103' '#1086#1073' '#1091#1095#1072#1097#1080#1093#1089#1103' '#1076#1083#1103' '#1078#1091#1088#1085#1072#1083#1072' '#1087#1077#1076#1072#1075#1086#1075#1072
  ClientHeight = 722
  ClientWidth = 475
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
    475
    722)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 183
    Width = 186
    Height = 16
    Caption = #1057#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1081':'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 209
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 68
      Width = 69
      Height = 16
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 16
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
    end
    object Label4: TLabel
      Left = 8
      Top = 120
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object cmbEducationProgram: TComboBox
      Left = 8
      Top = 90
      Width = 193
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbEducationProgramChange
    end
    object cmbPedagogue: TComboBox
      Left = 8
      Top = 38
      Width = 193
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbPedagogueChange
    end
    object cmbAcademicYear: TComboBox
      Left = 8
      Top = 142
      Width = 193
      Height = 24
      Style = csDropDownList
      TabOrder = 2
    end
  end
  object lvChildList: TListView
    Left = 227
    Top = 124
    Width = 240
    Height = 523
    Anchors = [akLeft, akTop, akRight]
    Checkboxes = True
    Columns = <
      item
        Caption = #8470
      end
      item
        Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103
        Width = 120
      end
      item
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Width = 70
      end>
    GridLines = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object ListBox1: TListBox
    Left = 8
    Top = 205
    Width = 209
    Height = 444
    TabOrder = 2
  end
  object bClear: TButton
    Left = 8
    Top = 658
    Width = 209
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 3
  end
  object bAdd: TButton
    Left = 227
    Top = 658
    Width = 240
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    TabOrder = 4
  end
  object GroupBox2: TGroupBox
    Left = 227
    Top = 0
    Width = 240
    Height = 118
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    DesignSize = (
      240
      118)
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 13
      Width = 224
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1091#1095#1072#1097#1080#1093#1089#1103': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #1080#1079' '#1086#1073#1097#1077#1075#1086' '#1089#1087#1080#1089#1082#1072' '
        #1080#1079' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1081' '#1075#1088#1091#1087#1087#1099' ')
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object cmbLearningGroup: TComboBox
      Left = 8
      Top = 83
      Width = 224
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = cmbLearningGroupChange
    end
  end
  object bExport: TButton
    Left = 8
    Top = 689
    Width = 209
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
    TabOrder = 6
  end
  object bClose: TButton
    Left = 227
    Top = 689
    Width = 240
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    TabOrder = 7
    OnClick = bCloseClick
  end
end
