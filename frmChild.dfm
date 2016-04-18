object fChild: TfChild
  Left = 0
  Top = 0
  Caption = #1054#1073#1091#1095#1072#1102#1097#1080#1077#1089#1103
  ClientHeight = 662
  ClientWidth = 1004
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 317
    Top = 0
    Height = 662
    AutoSnap = False
    MinSize = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 662
    Align = alLeft
    Constraints.MinWidth = 254
    TabOrder = 0
    DesignSize = (
      317
      662)
    object Panel3: TPanel
      Left = 6
      Top = 9
      Width = 305
      Height = 22
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1091#1095#1072#1102#1097#1080#1093#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 6
      Top = 500
      Width = 305
      Height = 155
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      DesignSize = (
        305
        155)
      object Label1: TLabel
        Left = 16
        Top = 75
        Width = 83
        Height = 16
        Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1060#1048#1054
      end
      object rgSaerchCriteria: TRadioGroup
        Left = 14
        Top = 6
        Width = 276
        Height = 63
        Anchors = [akLeft, akTop, akRight]
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
        ItemIndex = 0
        Items.Strings = (
          #1085#1072#1095#1080#1085#1072#1102#1090#1089#1103' '#1089#1086' '#1089#1090#1088#1086#1082#1080' '#1087#1086#1080#1089#1082#1072
          #1089#1086#1076#1077#1088#1078#1072#1090' '#1089#1090#1088#1086#1082#1091' '#1087#1086#1080#1089#1082#1072)
        TabOrder = 0
      end
      object eSearchFIO: TEdit
        Left = 14
        Top = 95
        Width = 276
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 20
        TabOrder = 1
        OnChange = eSearchFIOChange
      end
      object chbExpelled: TCheckBox
        Left = 14
        Top = 132
        Width = 174
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1090#1095#1080#1089#1083#1077#1085#1085#1099#1093
        TabOrder = 2
        OnClick = eSearchFIOChange
      end
    end
    object lvLearningChild: TListView
      Left = 6
      Top = 37
      Width = 305
      Height = 457
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = #1060#1040#1052#1048#1051#1048#1071
          Width = 107
        end
        item
          Caption = #1048#1052#1071
          Width = 97
        end
        item
          Caption = #1044'/'#1056
          Width = 80
        end
        item
          Caption = #1089#1090#1072#1090#1091#1089
          Width = 0
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnCustomDrawItem = lvLearningChildCustomDrawItem
      OnSelectItem = lvLearningChildSelectItem
    end
  end
  object Panel2: TPanel
    Left = 320
    Top = 0
    Width = 684
    Height = 662
    Align = alClient
    Constraints.MinWidth = 50
    TabOrder = 1
    DesignSize = (
      684
      662)
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 9
      Width = 672
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1044#1072#1085#1085#1099#1077' '#1086#1073#1091#1095#1072#1102#1097#1077#1075#1086#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 6
      Top = 37
      Width = 672
      Height = 160
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      object Label2: TLabel
        Left = 14
        Top = 8
        Width = 58
        Height = 16
        Caption = #1060#1072#1084#1080#1083#1080#1103':'
      end
      object Label3: TLabel
        Left = 230
        Top = 8
        Width = 28
        Height = 16
        Caption = #1048#1084#1103':'
      end
      object Label4: TLabel
        Left = 444
        Top = 8
        Width = 60
        Height = 16
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      end
      object Label5: TLabel
        Left = 14
        Top = 58
        Width = 27
        Height = 16
        Caption = #1055#1086#1083':'
      end
      object Label6: TLabel
        Left = 230
        Top = 58
        Width = 97
        Height = 16
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
      end
      object Label7: TLabel
        Left = 444
        Top = 58
        Width = 44
        Height = 16
        Caption = #1057#1090#1072#1090#1091#1089':'
      end
      object eSurname: TEdit
        Left = 14
        Top = 28
        Width = 187
        Height = 24
        Constraints.MinWidth = 40
        TabOrder = 0
      end
      object eName: TEdit
        Left = 230
        Top = 28
        Width = 187
        Height = 24
        Constraints.MinWidth = 30
        TabOrder = 1
      end
      object ePatronomic: TEdit
        Left = 444
        Top = 28
        Width = 187
        Height = 24
        Constraints.MinWidth = 30
        TabOrder = 2
      end
      object cmbGender: TComboBox
        Left = 14
        Top = 78
        Width = 187
        Height = 24
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          #1052
          #1046)
      end
      object meBirthday: TMaskEdit
        Left = 230
        Top = 78
        Width = 186
        Height = 24
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  .  .    '
      end
      object cmbLearningStatus: TComboBox
        Left = 444
        Top = 78
        Width = 187
        Height = 24
        Style = csDropDownList
        TabOrder = 5
      end
      object bNewRecord: TButton
        Left = 14
        Top = 120
        Width = 187
        Height = 25
        Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        TabOrder = 6
        OnClick = bNewRecordClick
      end
      object bSave: TButton
        Left = 230
        Top = 120
        Width = 186
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 7
        OnClick = bSaveClick
      end
      object bParent: TButton
        Left = 444
        Top = 120
        Width = 182
        Height = 24
        Caption = #1056#1054#1044#1048#1058#1045#1051#1048
        TabOrder = 8
        OnClick = bParentClick
      end
    end
    object Button4: TButton
      Left = 549
      Top = 628
      Width = 131
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      TabOrder = 2
      OnClick = Button4Click
    end
    object PageControl1: TPageControl
      Left = 6
      Top = 203
      Width = 674
      Height = 419
      ActivePage = tshAdditionalData
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      object tshAdditionalData: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        object Label8: TLabel
          Left = 10
          Top = 12
          Width = 82
          Height = 16
          Caption = #1054#1089#1085#1086#1074#1085#1086#1077' '#1054#1059':'
        end
        object Label9: TLabel
          Left = 10
          Top = 62
          Width = 61
          Height = 16
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        end
        object Label10: TLabel
          Left = 226
          Top = 12
          Width = 107
          Height = 16
          Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1080#1085#1076#1077#1082#1089':'
        end
        object Label11: TLabel
          Left = 226
          Top = 62
          Width = 105
          Height = 16
          Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089':'
        end
        object Label12: TLabel
          Left = 10
          Top = 133
          Width = 38
          Height = 16
          Caption = #1050#1083#1072#1089#1089':'
        end
        object Label13: TLabel
          Left = 10
          Top = 183
          Width = 42
          Height = 16
          Caption = #1057#1084#1077#1085#1072':'
        end
        object Label14: TLabel
          Left = 226
          Top = 133
          Width = 60
          Height = 16
          Caption = #1050#1086#1085#1090#1072#1082#1090#1099':'
        end
        object Label15: TLabel
          Left = 10
          Top = 280
          Width = 77
          Height = 16
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        end
        object cmbEducationalOrgType: TComboBox
          Left = 10
          Top = 32
          Width = 187
          Height = 24
          Style = csDropDownList
          TabOrder = 0
        end
        object mEducationName: TMemo
          Left = 10
          Top = 82
          Width = 187
          Height = 45
          Constraints.MinWidth = 100
          TabOrder = 1
        end
        object ePostcode: TEdit
          Left = 226
          Top = 32
          Width = 187
          Height = 24
          Constraints.MinWidth = 6
          NumbersOnly = True
          TabOrder = 4
        end
        object mHomeAddress: TMemo
          Left = 226
          Top = 82
          Width = 336
          Height = 45
          Constraints.MinWidth = 100
          TabOrder = 5
        end
        object eClass: TEdit
          Left = 10
          Top = 153
          Width = 187
          Height = 24
          TabOrder = 2
        end
        object lvChildContact: TListView
          Left = 226
          Top = 153
          Width = 336
          Height = 95
          Columns = <>
          TabOrder = 7
        end
        object bAddContact: TButton
          Left = 226
          Top = 254
          Width = 108
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ...'
          TabOrder = 8
        end
        object cmbShift: TComboBox
          Left = 10
          Top = 203
          Width = 187
          Height = 24
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            'I'
            'II')
        end
        object mNote: TMemo
          Left = 10
          Top = 300
          Width = 324
          Height = 60
          Constraints.MinWidth = 255
          TabOrder = 6
        end
        object bChangeContact: TButton
          Left = 340
          Top = 254
          Width = 108
          Height = 25
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' ...'
          TabOrder = 9
        end
        object bRemoveContact: TButton
          Left = 454
          Top = 254
          Width = 108
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 10
        end
        object bSaveChange: TButton
          Left = 384
          Top = 335
          Width = 187
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          TabOrder = 11
          OnClick = bSaveChangeClick
        end
      end
      object tshStatisticsData: TTabSheet
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 24
          Top = 24
          Width = 537
          Height = 137
          Caption = #1040#1085#1072#1083#1080#1079' '#1088#1072#1073#1086#1090#1099' '#1055#1044#1054
          TabOrder = 0
          object chbAnotherDOD: TCheckBox
            Left = 32
            Top = 32
            Width = 353
            Height = 17
            Caption = #1055#1072#1088#1072#1083#1083#1077#1083#1100#1085#1086' '#1086#1073#1091#1095#1072#1077#1090#1089#1103' '#1085#1072' '#1073#1072#1079#1077' '#1076#1088#1091#1075#1080#1093' '#1054#1059' '#1044#1054#1044
            TabOrder = 0
          end
          object chbLimitedPossible: TCheckBox
            Left = 32
            Top = 64
            Width = 353
            Height = 17
            Caption = #1054#1073#1083#1072#1076#1072#1077#1090' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1099#1084#1080' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1103#1084#1080' '#1079#1076#1086#1088#1086#1074#1100#1103
            TabOrder = 1
          end
          object chbWithoutParents: TCheckBox
            Left = 32
            Top = 96
            Width = 489
            Height = 17
            Caption = 
              #1054#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1076#1077#1090#1077#1081' '#1089#1080#1088#1086#1090' '#1080#1083#1080' '#1086#1089#1090#1072#1074#1096#1080#1093#1089#1103' '#1073#1077#1079' '#1087#1086#1087#1077#1095#1077#1085#1080#1103' '#1088 +
              #1086#1076#1080#1090#1077#1083#1077#1081
            TabOrder = 2
          end
        end
        object chbReceivCertificate: TCheckBox
          Left = 24
          Top = 184
          Width = 497
          Height = 17
          Caption = 
            #1055#1088#1086#1096#1077#1083' '#1087#1086#1083#1085#1099#1081' '#1082#1091#1088#1089' '#1086#1073#1091#1095#1077#1085#1080#1103', '#1074#1099#1076#1072#1085#1086' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1074#1086' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1044#1061 +
            #1057
          TabOrder = 1
        end
        object bSaveStat: TButton
          Left = 212
          Top = 237
          Width = 187
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          TabOrder = 2
          OnClick = bSaveStatClick
        end
      end
    end
  end
end
