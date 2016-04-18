object fGroupComposition: TfGroupComposition
  Left = 0
  Top = 0
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087
  ClientHeight = 554
  ClientWidth = 976
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
    976
    554)
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 481
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 14
      Top = 11
      Width = 51
      Height = 16
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
    end
    object Label1: TLabel
      Left = 210
      Top = 11
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label4: TLabel
      Left = 358
      Top = 11
      Width = 78
      Height = 16
      Caption = #1044#1072#1090#1072' '#1086#1090#1095#1077#1090#1072':'
    end
    object cmbPedagogue: TComboBox
      Left = 14
      Top = 36
      Width = 173
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbPedagogueChange
    end
    object cmbAcademicYear: TComboBox
      Left = 210
      Top = 36
      Width = 119
      Height = 24
      Style = csDropDownList
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 358
      Top = 36
      Width = 108
      Height = 24
      Date = 41864.414781226850000000
      Time = 41864.414781226850000000
      TabOrder = 2
    end
  end
  object lvGroups: TListView
    Left = 8
    Top = 87
    Width = 481
    Height = 346
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = #1043#1088#1091#1087#1087#1072' '
        Width = 200
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvGroupsSelectItem
  end
  object lvGroupMembers: TListView
    Left = 495
    Top = 8
    Width = 474
    Height = 489
    Anchors = [akLeft, akTop, akRight]
    Columns = <
      item
        Caption = #8470
        Width = 60
      end
      item
        Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103
        Width = 180
      end
      item
        Caption = #1044#1072#1090#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Width = 115
      end
      item
        Caption = #1044#1072#1090#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103
        Width = 115
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
    TabOrder = 2
    ViewStyle = vsReport
  end
  object bExportOneGroup: TButton
    Left = 8
    Top = 439
    Width = 187
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel (1 '#1075#1088#1091#1087#1087#1072')'
    TabOrder = 3
    OnClick = bExportOneGroupClick
  end
  object bExportAllGroup: TButton
    Left = 280
    Top = 439
    Width = 209
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel ('#1074#1077#1089#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 4
    OnClick = bExportAllGroupClick
  end
  object Memo1: TMemo
    Left = 136
    Top = 470
    Width = 185
    Height = 81
    TabOrder = 5
  end
end
