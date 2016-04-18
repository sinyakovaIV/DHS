object fNonWorkingDays: TfNonWorkingDays
  Left = 0
  Top = 0
  Caption = #1053#1077#1088#1072#1073#1086#1095#1080#1077' '#1076#1085#1080
  ClientHeight = 530
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    237
    530)
  PixelsPerInch = 106
  TextHeight = 18
  object bClose: TButton
    Left = 56
    Top = 490
    Width = 129
    Height = 32
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = bCloseClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 221
    Height = 472
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    DesignSize = (
      221
      472)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 18
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object LVNonWorkingDays: TListView
      Left = 8
      Top = 64
      Width = 204
      Height = 289
      Anchors = [akLeft, akTop, akBottom]
      Columns = <
        item
          Caption = #8470
        end
        item
          Caption = #1044#1072#1090#1072
          Width = 150
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = LVNonWorkingDaysSelectItem
    end
    object cmbAcademicYear: TComboBox
      Left = 8
      Top = 32
      Width = 204
      Height = 26
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbAcademicYearChange
    end
    object bAdd: TButton
      Left = 8
      Top = 391
      Width = 204
      Height = 32
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = bAddClick
    end
    object bDelete: TButton
      Left = 8
      Top = 429
      Width = 204
      Height = 32
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = bDeleteClick
    end
    object dtpWirkOffDay: TDateTimePicker
      Left = 8
      Top = 359
      Width = 204
      Height = 26
      Anchors = [akLeft, akBottom]
      Date = 42202.649321967590000000
      Time = 42202.649321967590000000
      TabOrder = 4
    end
  end
end
