object fTimesheet: TfTimesheet
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 686
  ClientWidth = 1252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 382
    Width = 1252
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 1169
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1252
    Height = 382
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1252
      382)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 490
      Height = 70
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
        Left = 215
        Top = 12
        Width = 79
        Height = 16
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
      end
      object Label3: TLabel
        Left = 14
        Top = 13
        Width = 51
        Height = 16
        Caption = #1055#1077#1076#1072#1075#1086#1075':'
      end
      object Label5: TLabel
        Left = 345
        Top = 12
        Width = 81
        Height = 16
        Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080':'
      end
      object cmbChooseAcademicYear: TComboBox
        Left = 215
        Top = 35
        Width = 110
        Height = 24
        Style = csDropDownList
        TabOrder = 1
        OnChange = cmbChooseAcademicYearChange
      end
      object cmbChoosePedagogue: TComboBox
        Left = 14
        Top = 35
        Width = 179
        Height = 24
        Style = csDropDownList
        TabOrder = 0
        OnChange = cmbChoosePedagogueChange
      end
      object cmbWeekday: TComboBox
        Left = 345
        Top = 35
        Width = 130
        Height = 24
        Style = csDropDownList
        TabOrder = 2
        OnChange = cmbWeekdayChange
      end
    end
    object lvTimesheet: TListView
      Left = 8
      Top = 88
      Width = 945
      Height = 283
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = #1044'/'#1085#1077#1076
        end
        item
          Caption = #1042#1088#1077#1084#1103
          Width = 85
        end
        item
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
          Width = 240
        end
        item
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          Width = 90
        end
        item
          Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
          Width = 90
        end
        item
          Caption = #1059#1088#1086#1074
        end
        item
          Caption = #1055#1088#1086#1075#1088
        end
        item
          Caption = #1057#1090#1072#1090#1091#1089
          Width = 170
        end
        item
          Caption = #8470' '#1082#1072#1073'.'
          Width = 60
        end
        item
          Caption = #1050#1086#1085#1094#1077#1088#1090#1084#1077#1081#1089#1090#1077#1088
          Width = 110
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
      TabOrder = 1
      ViewStyle = vsReport
      OnCustomDrawItem = lvTimesheetCustomDrawItem
      OnSelectItem = lvTimesheetSelectItem
    end
    object GroupBox3: TGroupBox
      Left = 968
      Top = 100
      Width = 271
      Height = 271
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        271
        271)
      object Label7: TLabel
        Left = 45
        Top = 3
        Width = 173
        Height = 16
        Caption = #1044#1083#1103' '#1075#1088#1091#1087#1087#1099' / '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103':'
      end
      object Label8: TLabel
        Left = 16
        Top = 206
        Width = 164
        Height = 16
        Caption = #1042' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1089' '#1087#1088#1080#1082#1072#1079#1086#1084':'
      end
      object bChange: TButton
        Left = 16
        Top = 70
        Width = 237
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        Caption = #1059#1090#1074#1077#1088#1076#1080#1090#1100'/'#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 0
        OnClick = bChangeClick
      end
      object Panel4: TPanel
        Left = 16
        Top = 30
        Width = 237
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 1
      end
      object bDelete: TButton
        Left = 16
        Top = 110
        Width = 237
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
        TabOrder = 2
        OnClick = bDeleteClick
      end
      object bReplace: TButton
        Left = 16
        Top = 170
        Width = 237
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1085#1072' '#1085#1086#1074#1086#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 3
        OnClick = bReplaceClick
      end
      object cmbChooseOrder1: TComboBox
        Left = 16
        Top = 228
        Width = 237
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        OnChange = cmbChooseOrder2Change
      end
    end
    object GroupBox4: TGroupBox
      Left = 968
      Top = 8
      Width = 271
      Height = 70
      Anchors = [akTop, akRight]
      TabOrder = 3
      object Label2: TLabel
        Left = 14
        Top = 18
        Width = 91
        Height = 16
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1085#1072':'
      end
      object meStateOnDay: TMaskEdit
        Left = 122
        Top = 9
        Width = 104
        Height = 24
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '08.09.2014'
      end
      object bToShow: TButton
        Left = 122
        Top = 40
        Width = 105
        Height = 23
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100
        TabOrder = 1
        OnClick = bToShowClick
      end
      object chbAllRecord: TCheckBox
        Left = 15
        Top = 42
        Width = 94
        Height = 16
        Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chbAllRecordClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 385
    Width = 1252
    Height = 301
    Align = alClient
    TabOrder = 1
    DesignSize = (
      1252
      301)
    object lvGroupChild: TListView
      Left = 8
      Top = 8
      Width = 681
      Height = 284
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
          Width = 245
        end
        item
          Caption = #1059#1088#1086#1074
        end
        item
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
          Width = 80
        end
        item
          Caption = #1063#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102
          Width = 110
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
      OnSelectItem = lvGroupChildSelectItem
    end
    object GroupBox2: TGroupBox
      Left = 814
      Top = 6
      Width = 425
      Height = 173
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        425
        173)
      object Label4: TLabel
        Left = 14
        Top = 110
        Width = 164
        Height = 16
        Caption = #1042' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1089' '#1087#1088#1080#1082#1072#1079#1086#1084':'
      end
      object Label6: TLabel
        Left = 125
        Top = 3
        Width = 173
        Height = 16
        Caption = #1044#1083#1103' '#1075#1088#1091#1087#1087#1099' / '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103':'
      end
      object cmbChooseOrder2: TComboBox
        Left = 16
        Top = 135
        Width = 391
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = cmbChooseOrder2Change
      end
      object bInsert: TButton
        Left = 16
        Top = 66
        Width = 391
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        Caption = #1057#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 1
        OnClick = bInsertClick
      end
      object Panel3: TPanel
        Left = 16
        Top = 30
        Width = 391
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 2
      end
    end
    object Button4: TButton
      Left = 986
      Top = 241
      Width = 169
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = Button4Click
    end
  end
end
