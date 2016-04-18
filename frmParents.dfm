object fParents: TfParents
  Left = 0
  Top = 0
  Caption = 'fParents'
  ClientHeight = 446
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    787
    446)
  PixelsPerInch = 106
  TextHeight = 14
  object Label20: TLabel
    Left = 6
    Top = 6
    Width = 56
    Height = 14
    Caption = #1060#1072#1084#1080#1083#1080#1103':'
  end
  object Label26: TLabel
    Left = 230
    Top = 60
    Width = 90
    Height = 14
    Caption = #1057#1090#1072#1090#1091#1089' '#1088#1086#1076#1089#1090#1074#1072':'
  end
  object Label25: TLabel
    Left = 230
    Top = 6
    Width = 74
    Height = 14
    Caption = #1042#1080#1076' '#1088#1086#1076#1089#1090#1074#1072':'
  end
  object Label24: TLabel
    Left = 6
    Top = 113
    Width = 58
    Height = 14
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
  end
  object Label23: TLabel
    Left = 6
    Top = 60
    Width = 27
    Height = 14
    Caption = #1048#1084#1103':'
  end
  object Label19: TLabel
    Left = 230
    Top = 166
    Width = 75
    Height = 14
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object Label18: TLabel
    Left = 6
    Top = 234
    Width = 69
    Height = 14
    Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103':'
  end
  object Label17: TLabel
    Left = 6
    Top = 166
    Width = 84
    Height = 14
    Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
  end
  object Label16: TLabel
    Left = 421
    Top = 6
    Width = 57
    Height = 14
    Caption = #1050#1086#1085#1090#1072#1082#1090#1099':'
  end
  object mWorkplace: TMemo
    Left = 6
    Top = 187
    Width = 199
    Height = 43
    TabOrder = 4
  end
  object mNoteR: TMemo
    Left = 230
    Top = 187
    Width = 388
    Height = 43
    TabOrder = 6
  end
  object lvParentContact: TListView
    Left = 421
    Top = 28
    Width = 299
    Height = 110
    Columns = <
      item
        Caption = #1050#1054#1053#1058#1040#1050#1058
        Width = 181
      end
      item
        Caption = #1042#1080#1076' '#1082#1086#1085#1090#1072#1082#1090#1072
        Width = 115
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ShowWorkAreas = True
    TabOrder = 7
    ViewStyle = vsReport
    OnSelectItem = lvParentContactSelectItem
  end
  object lvParent: TListView
    Left = 6
    Top = 291
    Width = 775
    Height = 147
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = #1060#1040#1052#1048#1051#1048#1071
        Width = 128
      end
      item
        Caption = #1048#1052#1071
        Width = 128
      end
      item
        Caption = #1054#1058#1063#1045#1057#1058#1042#1054
        Width = 128
      end
      item
        Caption = #1042#1080#1076' '#1088#1086#1076#1089#1090#1074#1072
        Width = 128
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ShowWorkAreas = True
    TabOrder = 8
    ViewStyle = vsReport
    OnSelectItem = lvParentSelectItem
  end
  object eSurnameR: TEdit
    Left = 6
    Top = 28
    Width = 197
    Height = 22
    MaxLength = 40
    TabOrder = 1
  end
  object eProfession: TEdit
    Left = 6
    Top = 255
    Width = 199
    Height = 22
    MaxLength = 40
    TabOrder = 5
  end
  object ePatronomicR: TEdit
    Left = 6
    Top = 134
    Width = 199
    Height = 22
    MaxLength = 30
    TabOrder = 3
  end
  object eNameR: TEdit
    Left = 6
    Top = 81
    Width = 199
    Height = 22
    MaxLength = 30
    TabOrder = 2
  end
  object cmbParentStatus: TComboBox
    Left = 230
    Top = 81
    Width = 162
    Height = 22
    Style = csDropDownList
    TabOrder = 9
    Items.Strings = (
      '')
  end
  object cmbParentKind: TComboBox
    Left = 230
    Top = 28
    Width = 162
    Height = 22
    Style = csDropDownList
    TabOrder = 10
    Items.Strings = (
      '')
  end
  object bSaveR: TButton
    Left = 437
    Top = 254
    Width = 180
    Height = 27
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 11
    OnClick = bSaveRClick
  end
  object bRemoveContactR: TButton
    Left = 625
    Top = 145
    Width = 95
    Height = 26
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 12
    OnClick = bRemoveContactRClick
  end
  object bNewRecordR: TButton
    Left = 230
    Top = 254
    Width = 180
    Height = 27
    Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
    TabOrder = 0
    OnClick = bNewRecordRClick
  end
  object bChangeContactR: TButton
    Left = 523
    Top = 145
    Width = 95
    Height = 26
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' ...'
    TabOrder = 13
    OnClick = bChangeContactRClick
  end
  object bAddContactR: TButton
    Left = 421
    Top = 145
    Width = 95
    Height = 26
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ...'
    TabOrder = 14
    OnClick = bAddContactRClick
  end
end
