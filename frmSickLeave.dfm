object fSickLeave: TfSickLeave
  Left = 0
  Top = 0
  Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1099
  ClientHeight = 500
  ClientWidth = 712
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
    712
    500)
  PixelsPerInch = 106
  TextHeight = 18
  object Label3: TLabel
    Left = 8
    Top = 47
    Width = 59
    Height = 18
    Caption = #1055#1077#1076#1072#1075#1086#1075':'
  end
  object Label1: TLabel
    Left = 206
    Top = 47
    Width = 91
    Height = 18
    Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
  end
  object Panel1: TPanel
    Left = 6
    Top = 8
    Width = 701
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Caption = #1060#1048#1054' '#1087#1077#1076#1072#1075#1086#1075#1072', '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object cmbPedagogue: TComboBox
    Left = 8
    Top = 71
    Width = 177
    Height = 26
    Style = csDropDownList
    TabOrder = 1
    OnChange = cmbPedagogueChange
  end
  object cmbAcademicYear: TComboBox
    Left = 206
    Top = 71
    Width = 111
    Height = 26
    Style = csDropDownList
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = cmbAcademicYearChange
  end
  object lvSickLeave: TListView
    Left = 8
    Top = 120
    Width = 574
    Height = 249
    Columns = <
      item
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
        Width = 120
      end
      item
        Caption = #1055#1077#1076#1072#1075#1086#1075
        Width = 200
      end
      item
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Width = 125
      end
      item
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Width = 125
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    OnSelectItem = lvSickLeaveSelectItem
  end
  object bAddSickLeave: TButton
    Left = 589
    Top = 71
    Width = 118
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 4
    OnClick = bAddSickLeaveClick
  end
  object Button3: TButton
    Left = 589
    Top = 466
    Width = 118
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object bDeleteSickLeave: TButton
    Left = 589
    Top = 167
    Width = 118
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = #1059#1076#1072#1083#1080#1090#1100' '
    TabOrder = 6
    OnClick = bDeleteSickLeaveClick
  end
  object Panel2: TPanel
    Left = 8
    Top = 384
    Width = 573
    Height = 108
    TabOrder = 7
    DesignSize = (
      573
      108)
    object Label5: TLabel
      Left = 198
      Top = 10
      Width = 91
      Height = 18
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label6: TLabel
      Left = 8
      Top = 10
      Width = 59
      Height = 18
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
    end
    object Label2: TLabel
      Left = 338
      Top = 10
      Width = 55
      Height = 18
      Caption = #1053#1072#1095#1072#1083#1086':'
    end
    object Label4: TLabel
      Left = 455
      Top = 10
      Width = 79
      Height = 18
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
    end
    object cmbAcademicYear2: TComboBox
      Left = 198
      Top = 34
      Width = 111
      Height = 26
      Style = csDropDownList
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cmbPedagogue2: TComboBox
      Left = 8
      Top = 34
      Width = 169
      Height = 26
      Style = csDropDownList
      TabOrder = 1
    end
    object dtpDateBegining: TDateTimePicker
      Left = 330
      Top = 34
      Width = 108
      Height = 26
      Date = 42072.508098379630000000
      Time = 42072.508098379630000000
      TabOrder = 2
    end
    object dtpDateEnding: TDateTimePicker
      Left = 459
      Top = 34
      Width = 108
      Height = 26
      Date = 42072.508098379630000000
      Time = 42072.508098379630000000
      TabOrder = 3
    end
    object bSaveSickLeave: TButton
      Left = 198
      Top = 72
      Width = 187
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
      TabOrder = 4
      OnClick = bSaveSickLeaveClick
    end
  end
  object bChange: TButton
    Left = 589
    Top = 120
    Width = 118
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 8
    OnClick = bChangeClick
  end
end
