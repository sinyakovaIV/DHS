object fPedagogueClassEdit: TfPedagogueClassEdit
  Left = 0
  Top = 0
  Caption = #1050#1083#1072#1089#1089' '#1087#1077#1076#1072#1075#1086#1075#1072
  ClientHeight = 551
  ClientWidth = 985
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
  object Splitter1: TSplitter
    Left = 606
    Top = 0
    Height = 551
  end
  object Panel2: TPanel
    Left = 609
    Top = 0
    Width = 376
    Height = 551
    Align = alClient
    Anchors = []
    Constraints.MinWidth = 376
    TabOrder = 0
    DesignSize = (
      376
      551)
    object lvChildList: TListView
      Left = 8
      Top = 215
      Width = 359
      Height = 294
      Anchors = [akLeft, akTop, akRight, akBottom]
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
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
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
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvChildListSelectItem
    end
    object Panel5: TPanel
      Left = 8
      Top = 8
      Width = 359
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1057#1087#1080#1086#1082' '#1086#1073#1091#1095#1072#1102#1097#1080#1093#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object bClose: TButton
      Left = 216
      Top = 515
      Width = 150
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bCloseClick
    end
    object Panel7: TPanel
      Left = 8
      Top = 50
      Width = 359
      Height = 159
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        359
        159)
      object Label3: TLabel
        Left = 7
        Top = 105
        Width = 114
        Height = 16
        Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rgChooseMode: TRadioGroup
        Left = 6
        Top = 8
        Width = 347
        Height = 61
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1087#1080#1089#1086#1082': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1082#1083#1072#1089#1089#1072' '#1087#1077#1076#1072#1075#1086#1075#1072' '#1087#1086' '#1091#1095#1077#1073#1085#1086#1084#1091' '#1075#1086#1076#1091
          #1087#1086' '#1075#1086#1076#1091' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103)
        ParentFont = False
        TabOrder = 0
        OnClick = rgChooseModeClick
      end
      object cmbChoose: TComboBox
        Left = 6
        Top = 75
        Width = 347
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
        OnChange = cmbChooseChange
      end
      object eSearchFIO: TEdit
        Left = 6
        Top = 125
        Width = 347
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 2
        OnChange = eSearchFIOChange
      end
    end
    object bInGroup: TButton
      Left = 8
      Top = 515
      Width = 150
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1074' '#1082#1083#1072#1089#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bInGroupClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 551
    Align = alLeft
    Constraints.MaxWidth = 620
    Constraints.MinWidth = 375
    TabOrder = 1
    DesignSize = (
      606
      551)
    object lvClassList: TListView
      Left = 8
      Top = 124
      Width = 589
      Height = 385
      Anchors = [akLeft, akTop, akRight, akBottom]
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
          Caption = #1059#1088#1086#1074#1077#1085#1100
          Width = 65
        end
        item
          Caption = #1063#1072#1089#1086#1074
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
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvClassListSelectItem
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 590
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1050#1083#1072#1089#1089' '#1087#1077#1076#1072#1075#1086#1075#1072', '#1087#1088#1086#1075#1088#1072#1084#1084#1072', '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object bEditRecord: TButton
      Left = 8
      Top = 515
      Width = 303
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100'   ('#1086#1090#1095#1080#1089#1083#1080#1090#1100' '#1080#1079' '#1082#1083#1072#1089#1089#1072')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bEditRecordClick
    end
    object bDeleteRecord: TButton
      Left = 385
      Top = 515
      Width = 215
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bDeleteRecordClick
    end
    object Panel8: TPanel
      Left = 8
      Top = 50
      Width = 589
      Height = 67
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      object GroupBox1: TGroupBox
        Left = 6
        Top = 8
        Width = 432
        Height = 52
        Caption = '??? '#1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object chbExpelled: TCheckBox
          Left = 24
          Top = 24
          Width = 273
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1090#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1080#1079' '#1082#1083#1072#1089#1089#1072
          TabOrder = 0
        end
      end
    end
  end
end
