object fJournalPedagogueByIndividualGroupChild: TfJournalPedagogueByIndividualGroupChild
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1076#1072#1075#1086#1075#1072'. '#1057#1090#1088#1072#1085#1080#1094#1072' '#1075#1088#1091#1087#1087#1099' /'#1091#1095#1072#1097#1077#1075#1086#1089#1103
  ClientHeight = 720
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    910
    720)
  PixelsPerInch = 96
  TextHeight = 17
  object sbDisplacement: TSpeedButton
    Left = 243
    Top = 683
    Width = 192
    Height = 32
    AllowAllUp = True
    GroupIndex = 1
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1084#1077#1097#1077#1085#1080#1103
    OnClick = sbDisplacementClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 495
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      910
      495)
    object pPedagogue_: TPanel
      Left = 6
      Top = 8
      Width = 896
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1060#1048#1054' '#1087#1077#1076#1072#1075#1086#1075#1072', '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076', '#1084#1077#1089#1103#1094'. '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pGroup_: TPanel
      Left = 6
      Top = 44
      Width = 896
      Height = 32
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = ' '#1059#1095#1072#1097#1080#1081#1089#1103'/'#1075#1088#1091#1087#1087#1072', '#1087#1088#1086#1075#1088#1072#1084#1084#1072', '#1091#1088#1086#1074#1077#1085#1100'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pTimesheet_: TPanel
      Left = 6
      Top = 82
      Width = 896
      Height = 32
      BevelOuter = bvLowered
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077', '#1080#1079#1084'. '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object PageControl1: TPageControl
      Left = 6
      Top = 120
      Width = 896
      Height = 363
      ActivePage = TSh_10
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 4
      OnChange = PageControl1Change
      object TSh_9: TTabSheet
        Caption = #1057#1077#1085#1090#1103#1073#1100' '
      end
      object TSh_10: TTabSheet
        Caption = #1054#1082#1090#1103#1073#1088#1100' '
        ImageIndex = 1
      end
      object TSh_11: TTabSheet
        Caption = #1053#1086#1103#1073#1088#1100' '
        ImageIndex = 2
      end
      object TSh_12: TTabSheet
        Caption = #1044#1077#1082#1072#1073#1088#1100' '
        ImageIndex = 3
      end
      object TSh_1: TTabSheet
        Caption = #1071#1085#1074#1072#1088#1100' '
        ImageIndex = 4
      end
      object TSh_2: TTabSheet
        Caption = #1060#1077#1074#1088#1072#1083#1100' '
        ImageIndex = 5
      end
      object TSh_3: TTabSheet
        Caption = #1052#1072#1088#1090' '
        ImageIndex = 6
      end
      object TSh_4: TTabSheet
        Caption = #1040#1087#1088#1077#1083#1100' '
        ImageIndex = 7
      end
      object TSh_5: TTabSheet
        Caption = #1052#1072#1081
        ImageIndex = 8
      end
    end
    object lvIndividualJournal: TListView
      Left = 12
      Top = 154
      Width = 888
      Height = 315
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = #1044#1072#1090#1072
          Width = 120
        end
        item
          Caption = #1044'/'#1085
        end
        item
          Caption = #1063#1072#1089#1086#1074
        end
        item
          Caption = #8470
        end
        item
          Caption = #1058#1077#1084#1072' '#1079#1072#1085#1103#1090#1080#1103' / '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 715
        end>
      ColumnClick = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnSelectItem = lvIndividualJournalSelectItem
    end
  end
  object Button4: TButton
    Left = 784
    Top = 687
    Width = 118
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 502
    Width = 910
    Height = 45
    Hint = #1042#1087#1080#1089#1072#1090#1100' '#1090#1077#1084#1099' '#1080#1079' '#1050#1058#1055' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1081' '#1075#1088#1091#1087#1087#1099' / '#1091#1095'-'#1089#1103
    Anchors = [akLeft, akBottom]
    BorderStyle = bsSingle
    TabOrder = 2
    object sbDelete: TSpeedButton
      Left = 536
      Top = 8
      Width = 177
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1077#1081
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1080
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDeleteClick
    end
    object Button1: TButton
      Left = 10
      Top = 8
      Width = 177
      Height = 25
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1090#1088#1072#1085#1080#1094#1091' '#1078#1091#1088#1085#1072#1083#1072
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 177
      Height = 25
      Hint = #1042#1087#1080#1089#1072#1090#1100' '#1090#1077#1084#1099' '#1080#1079' '#1050#1058#1055' '#1076#1083#1103' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1078#1091#1088#1085#1072#1083#1072
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object bDelete: TButton
      Left = 734
      Top = 8
      Width = 166
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1076#1085#1091' '#1079#1072#1087#1080#1089#1100
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 552
    Width = 910
    Height = 125
    Anchors = [akLeft, akBottom]
    BorderStyle = bsSingle
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 17
      Caption = #1044#1072#1090#1072' '#1091#1088#1086#1082#1072':'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 17
      Caption = #1057#1090#1072#1090#1091#1089':'
    end
    object Label3: TLabel
      Left = 122
      Top = 9
      Width = 50
      Height = 17
      Caption = #8470' '#1050#1058#1055':'
    end
    object Label4: TLabel
      Left = 241
      Top = 8
      Width = 192
      Height = 17
      Caption = #1058#1077#1084#1072' '#1079#1072#1085#1103#1090#1080#1103' / '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object cmbStatusLesson: TComboBox
      Left = 8
      Top = 88
      Width = 207
      Height = 25
      TabOrder = 0
    end
    object eDateLesson: TEdit
      Left = 8
      Top = 31
      Width = 93
      Height = 25
      TabOrder = 1
    end
    object mThemeComment: TMemo
      Left = 240
      Top = 31
      Width = 521
      Height = 81
      Lines.Strings = (
        '')
      TabOrder = 2
    end
    object eNumberTheme: TEdit
      Left = 122
      Top = 31
      Width = 93
      Height = 25
      TabOrder = 3
    end
    object bChangeTheme: TButton
      Left = 782
      Top = 32
      Width = 118
      Height = 50
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1084#1091' / '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = bChangeThemeClick
    end
    object bSave: TButton
      Left = 782
      Top = 88
      Width = 118
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
      OnClick = bSaveClick
    end
  end
  object cbMonth: TComboBox
    Left = 10
    Top = 687
    Width = 207
    Height = 25
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    DropDownCount = 9
    TabOrder = 4
    OnChange = cbMonthChange
    Items.Strings = (
      #1089#1077#1085#1090#1103#1073#1088#1100
      #1086#1082#1090#1103#1073#1088#1100
      #1085#1086#1103#1073#1088#1100
      #1076#1077#1082#1072#1073#1088#1100
      #1103#1085#1074#1072#1088#1100
      #1092#1077#1074#1088#1072#1083#1100
      #1084#1072#1088#1090
      #1072#1087#1088#1077#1083#1100
      #1084#1072#1081)
  end
  object cmbPedagogue: TComboBox
    Left = 441
    Top = 687
    Width = 154
    Height = 25
    Style = csDropDownList
    TabOrder = 5
    Visible = False
  end
  object bSaveDisplacement: TBitBtn
    Left = 601
    Top = 683
    Width = 64
    Height = 32
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 6
    Visible = False
    OnClick = bSaveDisplacementClick
  end
end
