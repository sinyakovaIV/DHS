object fOrders: TfOrders
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1082#1072#1079#1099
  ClientHeight = 509
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    813
    509)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 297
    Width = 609
    Height = 204
    Anchors = [akLeft, akBottom]
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 70
      Width = 95
      Height = 16
      Caption = #1057#1090#1072#1090#1091#1089' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label3: TLabel
      Left = 487
      Top = 14
      Width = 87
      Height = 16
      Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103':'
    end
    object Label5: TLabel
      Left = 7
      Top = 70
      Width = 78
      Height = 16
      Caption = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label2: TLabel
      Left = 7
      Top = 14
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label4: TLabel
      Left = 221
      Top = 14
      Width = 86
      Height = 16
      Caption = #1044#1072#1090#1072' '#1080#1079#1076#1072#1085#1080#1103':'
    end
    object Label6: TLabel
      Left = 360
      Top = 14
      Width = 93
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label7: TLabel
      Left = 7
      Top = 125
      Width = 83
      Height = 16
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object Label11: TLabel
      Left = 487
      Top = 70
      Width = 65
      Height = 16
      Caption = #1044#1083#1080#1090#1089#1103' '#1076#1086':'
    end
    object cmbStatusOrder2: TComboBox
      Left = 256
      Top = 92
      Width = 205
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbTypeOrders2: TComboBox
      Left = 7
      Top = 93
      Width = 224
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbTypeOrders2Change
    end
    object cmbAcademicYear2: TComboBox
      Left = 7
      Top = 37
      Width = 186
      Height = 24
      Style = csDropDownList
      TabOrder = 2
    end
    object eNumberOrder: TEdit
      Left = 360
      Top = 36
      Width = 101
      Height = 24
      TabOrder = 3
    end
    object dtpDateOrder: TDateTimePicker
      Left = 221
      Top = 37
      Width = 111
      Height = 24
      Date = 42072.508098379630000000
      Time = 42072.508098379630000000
      TabOrder = 4
    end
    object dtpDateEvent: TDateTimePicker
      Left = 487
      Top = 36
      Width = 114
      Height = 24
      Date = 42072.508098379630000000
      Time = 42072.508098379630000000
      TabOrder = 5
    end
    object mCommentOrder: TMemo
      Left = 7
      Top = 149
      Width = 454
      Height = 45
      TabOrder = 6
    end
    object dtpEventEnding: TDateTimePicker
      Left = 487
      Top = 92
      Width = 114
      Height = 24
      Date = 42072.508098379630000000
      Time = 42072.508098379630000000
      TabOrder = 7
    end
  end
  object bSave: TButton
    Left = 494
    Top = 462
    Width = 114
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bSaveClick
  end
  object bClose: TButton
    Left = 655
    Top = 462
    Width = 151
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 7
    Width = 798
    Height = 83
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1082#1072#1079#1086#1074' '#1087#1086' '#1082#1088#1080#1090#1077#1088#1080#1103#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label10: TLabel
      Left = 230
      Top = 21
      Width = 78
      Height = 16
      Caption = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 546
      Top = 21
      Width = 95
      Height = 16
      Caption = #1057#1090#1072#1090#1091#1089' '#1087#1088#1080#1082#1072#1079#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 7
      Top = 23
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cmbTypeOrders1: TComboBox
      Left = 230
      Top = 44
      Width = 279
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbTypeOrders1Change
    end
    object cmbStatusOrder1: TComboBox
      Left = 546
      Top = 44
      Width = 232
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbStatusOrder1Change
    end
    object cmbAcademicYear1: TComboBox
      Left = 7
      Top = 44
      Width = 186
      Height = 24
      Style = csDropDownList
      TabOrder = 2
      OnChange = cmbAcademicYear1Change
    end
  end
  object lvOrders: TListView
    Left = 7
    Top = 103
    Width = 795
    Height = 187
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
        Width = 102
      end
      item
        Caption = #8470
        Width = 46
      end
      item
        Caption = #1044#1072#1090#1072' '#1080#1079#1076#1072#1085#1080#1103
        Width = 111
      end
      item
        Caption = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072
        Width = 325
      end
      item
        Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103
        Width = 111
      end
      item
        Caption = #1044#1083#1080#1090#1089#1103' '#1076#1086
        Width = 93
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
    TabOrder = 4
    ViewStyle = vsReport
    OnSelectItem = lvOrdersSelectItem
  end
  object bAddOrder: TButton
    Left = 654
    Top = 306
    Width = 148
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bAddOrderClick
  end
end
