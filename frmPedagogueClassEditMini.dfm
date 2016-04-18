object fPedagogueClassEditMini: TfPedagogueClassEditMini
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'fPedagogueClassEditMini'
  ClientHeight = 173
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 130
    TabOrder = 0
    DesignSize = (
      900
      130)
    object Panel4: TPanel
      Left = 577
      Top = 47
      Width = 315
      Height = 70
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 12
        Width = 262
        Height = 16
        Caption = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1080#1079' '#1082#1083#1072#1089#1089#1072' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1082#1072#1079#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbOrderOut: TComboBox
        Left = 8
        Top = 36
        Width = 300
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 8
      Top = 49
      Width = 315
      Height = 70
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 248
        Height = 16
        Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1074' '#1082#1083#1072#1089#1089' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1082#1072#1079#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbOrderIn: TComboBox
        Left = 8
        Top = 36
        Width = 300
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 8
      Top = 8
      Width = 884
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1060'.'#1048'. '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103', '#1087#1077#1076#1072#1075#1086#1075', '#1087#1088#1086#1075#1088#1072#1084#1084#1072', '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 331
      Top = 49
      Width = 238
      Height = 70
      TabOrder = 3
      object Label2: TLabel
        Left = 10
        Top = 12
        Width = 72
        Height = 16
        Caption = #1053#1072' '#1091#1088#1086#1074#1077#1085#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 128
        Top = 12
        Width = 100
        Height = 16
        Caption = #1063#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbHoursAmount: TComboBox
        Left = 128
        Top = 36
        Width = 100
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cmbLearningLevel: TComboBox
        Left = 8
        Top = 36
        Width = 100
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object bSave: TButton
    Left = 370
    Top = 140
    Width = 155
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bSaveClick
  end
  object Button1: TButton
    Left = 738
    Top = 140
    Width = 155
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
