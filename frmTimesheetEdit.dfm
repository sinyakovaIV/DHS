object fTimesheetEdit: TfTimesheetEdit
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 552
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel4: TPanel
    Left = 8
    Top = 8
    Width = 305
    Height = 30
    BevelOuter = bvLowered
    Caption = #1044#1083#1103' '#1075#1088#1091#1087#1087#1099' / '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103':'
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 44
    Width = 305
    Height = 416
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 253
      Width = 126
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090' '#8470':'
    end
    object Label3: TLabel
      Left = 32
      Top = 305
      Width = 101
      Height = 16
      Caption = #1050#1086#1085#1094#1077#1088#1090#1084#1077#1081#1089#1090#1077#1088':'
    end
    object Label5: TLabel
      Left = 32
      Top = 15
      Width = 81
      Height = 16
      Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080':'
    end
    object Label2: TLabel
      Left = 32
      Top = 125
      Width = 41
      Height = 16
      Caption = #1042#1088#1077#1084#1103':'
    end
    object Label4: TLabel
      Left = 32
      Top = 357
      Width = 44
      Height = 16
      Caption = #1057#1090#1072#1090#1091#1089':'
    end
    object cmbChooseStudyRoom: TComboBox
      Left = 32
      Top = 275
      Width = 241
      Height = 24
      Style = csDropDownList
      TabOrder = 1
    end
    object cmbChooseAccompanist: TComboBox
      Left = 32
      Top = 327
      Width = 241
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbWeekday: TComboBox
      Left = 32
      Top = 37
      Width = 241
      Height = 24
      Style = csDropDownList
      TabOrder = 2
    end
    object cmbTimesheetGrid: TComboBox
      Left = 32
      Top = 149
      Width = 241
      Height = 24
      Style = csDropDownList
      TabOrder = 3
    end
    object rgLessonLength: TRadioGroup
      Left = 32
      Top = 69
      Width = 241
      Height = 50
      Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1091#1088#1086#1082#1072':'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '40 '#1084#1080#1085#1091#1090
        '30 '#1084#1080#1085#1091#1090)
      TabOrder = 4
    end
    object rgGridMode: TRadioGroup
      Left = 32
      Top = 179
      Width = 241
      Height = 68
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100':'
      ItemIndex = 0
      Items.Strings = (
        #1054#1089#1085#1086#1074#1085#1091#1102' '#1089#1077#1090#1082#1091
        #1040#1083#1100#1090#1077#1088#1085#1072#1090#1080#1074#1085#1091#1102)
      TabOrder = 5
      OnClick = rgGridModeClick
    end
    object cmbHourDay: TComboBox
      Left = 176
      Top = 216
      Width = 89
      Height = 24
      Style = csDropDownList
      DropDownCount = 12
      TabOrder = 6
      Visible = False
      OnChange = cmbHourDayChange
      Items.Strings = (
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19')
    end
    object Panel1: TPanel
      Left = 175
      Top = 192
      Width = 85
      Height = 22
      BevelOuter = bvNone
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1095#1072#1089':'
      TabOrder = 7
      Visible = False
    end
    object cmbStatus: TComboBox
      Left = 32
      Top = 379
      Width = 241
      Height = 24
      Style = csDropDownList
      TabOrder = 8
    end
  end
  object bSave: TButton
    Left = 80
    Top = 478
    Width = 153
    Height = 30
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = bSaveClick
  end
  object Button2: TButton
    Left = 80
    Top = 514
    Width = 153
    Height = 30
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
end
