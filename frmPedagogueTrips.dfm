object fPedagogueTrips: TfPedagogueTrips
  Left = 0
  Top = 0
  Caption = #1055#1077#1076#1072#1075#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
  ClientHeight = 537
  ClientWidth = 573
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
  PixelsPerInch = 106
  TextHeight = 18
  object Panel1: TPanel
    Left = 6
    Top = 6
    Width = 562
    Height = 75
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 167
      Height = 18
      Caption = #1055#1088#1080#1082#1072#1079' '#1086' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1077':'
    end
    object Label2: TLabel
      Left = 440
      Top = 12
      Width = 91
      Height = 18
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object cmbOrders: TComboBox
      Left = 8
      Top = 36
      Width = 409
      Height = 26
      TabOrder = 0
      OnChange = cmbOrdersChange
    end
    object cmbAcademicYear: TComboBox
      Left = 440
      Top = 36
      Width = 113
      Height = 26
      TabOrder = 1
      OnChange = cmbAcademicYearChange
    end
  end
  object Panel2: TPanel
    Left = 6
    Top = 95
    Width = 274
    Height = 34
    BevelOuter = bvLowered
    Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1084#1072#1085#1076#1080#1088#1091#1077#1084#1099#1093':'
    TabOrder = 1
  end
  object lvTriping: TListView
    Left = 6
    Top = 135
    Width = 274
    Height = 310
    Checkboxes = True
    Columns = <
      item
        Caption = #8470
        Width = 70
      end
      item
        Caption = #1060#1048#1054' '#1055#1077#1076#1072#1075#1086#1075#1072
        Width = 200
      end>
    GridLines = True
    TabOrder = 2
    ViewStyle = vsReport
  end
  object Panel3: TPanel
    Left = 294
    Top = 95
    Width = 274
    Height = 34
    BevelOuter = bvLowered
    Caption = #1055#1077#1076#1072#1075#1086#1075#1080' '#1044#1061#1057':'
    TabOrder = 3
  end
  object lvPedagogue: TListView
    Left = 294
    Top = 135
    Width = 274
    Height = 310
    Checkboxes = True
    Columns = <
      item
        Caption = #8470
        Width = 70
      end
      item
        Caption = #1060#1048#1054' '#1055#1077#1076#1072#1075#1086#1075#1072
        Width = 200
      end>
    GridLines = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object bClose: TButton
    Left = 438
    Top = 502
    Width = 130
    Height = 27
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bCloseClick
  end
  object bToTrip: TButton
    Left = 294
    Top = 451
    Width = 274
    Height = 27
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = bToTripClick
  end
  object bDeleteRecord: TButton
    Left = 6
    Top = 451
    Width = 274
    Height = 27
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = bDeleteRecordClick
  end
end
