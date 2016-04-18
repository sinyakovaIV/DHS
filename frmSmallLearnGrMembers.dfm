object fSmallLearnGrMembers: TfSmallLearnGrMembers
  Left = 0
  Top = 0
  Caption = #1057#1086#1089#1090#1072#1074' '#1091#1095#1077#1073#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 636
  ClientWidth = 991
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
    Left = 566
    Top = 0
    Height = 636
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 636
    Align = alLeft
    Constraints.MaxWidth = 650
    Constraints.MinWidth = 375
    TabOrder = 0
    DesignSize = (
      566
      636)
    object lvSmallGroupMemberList: TListView
      Left = 8
      Top = 230
      Width = 550
      Height = 277
      Anchors = [akLeft, akTop, akRight]
      Checkboxes = True
      Columns = <
        item
          Caption = #8470
          Width = 51
        end
        item
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103
          Width = 244
        end
        item
          Caption = #1044#1072#1090#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Width = 125
        end
        item
          Caption = #1044#1072#1090#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103
          Width = 125
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvSmallGroupMemberListSelectItem
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 550
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1059#1095#1077#1073#1085#1072#1103' '#1075#1088#1091#1087#1087#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 8
      Top = 512
      Width = 550
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        550
        81)
      object bOutGroup: TButton
        Left = 6
        Top = 8
        Width = 538
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1080#1079' '#1075#1088#1091#1087#1087#1099' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1082#1072#1079#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bOutGroupClick
      end
      object cmbOrderOut: TComboBox
        Left = 6
        Top = 48
        Width = 538
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
      end
    end
    object bBackInGroup: TButton
      Left = 8
      Top = 600
      Width = 268
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1086#1073' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bBackInGroupClick
    end
    object bDeleteRecord: TButton
      Left = 402
      Top = 599
      Width = 159
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bDeleteRecordClick
    end
    object Panel8: TPanel
      Left = 8
      Top = 46
      Width = 550
      Height = 65
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object lGroupName: TLabel
        Left = 8
        Top = 22
        Width = 5
        Height = 21
      end
    end
    object gbChooseMode: TGroupBox
      Left = 8
      Top = 127
      Width = 327
      Height = 65
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = False
      object chbExpelled: TCheckBox
        Left = 23
        Top = 32
        Width = 253
        Height = 16
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1090#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1080#1079' '#1075#1088#1091#1087#1087#1099
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 569
    Top = 0
    Width = 422
    Height = 636
    Align = alClient
    Constraints.MinWidth = 298
    TabOrder = 1
    DesignSize = (
      422
      636)
    object lvChildList: TListView
      Left = 8
      Top = 174
      Width = 406
      Height = 329
      Anchors = [akLeft, akTop, akRight]
      Checkboxes = True
      Columns = <
        item
          Caption = #8470
          Width = 51
        end
        item
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103
          Width = 244
        end
        item
          Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Width = 107
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnCustomDrawItem = lvChildListCustomDrawItem
    end
    object Panel5: TPanel
      Left = 8
      Top = 8
      Width = 406
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1091#1095#1072#1102#1097#1080#1093#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 8
      Top = 512
      Width = 406
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        406
        81)
      object bInGroup: TButton
        Left = 7
        Top = 8
        Width = 390
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1082#1072#1079#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bInGroupClick
      end
      object cmbOrderIn: TComboBox
        Left = 6
        Top = 48
        Width = 390
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
      end
    end
    object bClose: TButton
      Left = 239
      Top = 599
      Width = 156
      Height = 25
      Anchors = [akTop]
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bCloseClick
    end
    object Panel7: TPanel
      Left = 8
      Top = 46
      Width = 406
      Height = 117
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        406
        117)
      object Label2: TLabel
        Left = 7
        Top = 8
        Width = 204
        Height = 16
        Caption = #1050#1083#1072#1089#1089#1072' '#1087#1077#1076#1072#1075#1086#1075#1072' '#1074' '#1091#1095#1077#1073#1085#1086#1084#1091' '#1075#1086#1076#1091': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 7
        Top = 60
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
      object cmbChoose: TComboBox
        Left = 7
        Top = 31
        Width = 388
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = cmbChooseChange
      end
      object eSearchFIO: TEdit
        Left = 7
        Top = 81
        Width = 388
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 20
        TabOrder = 1
        OnChange = eSearchFIOChange
      end
    end
  end
end
