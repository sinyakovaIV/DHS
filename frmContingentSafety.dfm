object fContingentSafety: TfContingentSafety
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1091#1095#1072#1097#1080#1093#1089#1103
  ClientHeight = 598
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    972
    598)
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 6
    Width = 943
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 14
      Top = 9
      Width = 51
      Height = 16
      Caption = #1055#1077#1076#1072#1075#1086#1075':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 462
      Top = 9
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label2: TLabel
      Left = 184
      Top = 9
      Width = 69
      Height = 16
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
    end
    object Label6: TLabel
      Left = 598
      Top = 9
      Width = 54
      Height = 16
      Caption = #1059#1088#1086#1074#1077#1085#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cmbPedagogue: TComboBox
      Left = 14
      Top = 30
      Width = 147
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbPedagogueChange
    end
    object cmbAcademicYear: TComboBox
      Left = 462
      Top = 30
      Width = 115
      Height = 24
      Style = csDropDownList
      TabOrder = 1
    end
    object cmbEducationProgram: TComboBox
      Left = 184
      Top = 30
      Width = 257
      Height = 24
      Style = csDropDownList
      TabOrder = 2
      OnChange = cmbEducationProgramChange
    end
    object cmbLearningLevel: TComboBox
      Left = 598
      Top = 30
      Width = 93
      Height = 24
      Style = csDropDownList
      DropDownCount = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = cmbLearningLevelChange
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 77
    Width = 943
    Height = 470
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1090#1095#1077#1090' '#1086' '#1089#1086#1093#1088#1072#1085#1085#1086#1089#1090#1080' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072
      DesignSize = (
        935
        439)
      object Panel2: TPanel
        Left = 3
        Top = 3
        Width = 414
        Height = 440
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          414
          440)
        object lvInlist: TListView
          Left = 6
          Top = 40
          Width = 401
          Height = 317
          Anchors = [akLeft, akTop, akRight, akBottom]
          Checkboxes = True
          Columns = <
            item
              Caption = #8470
              Width = 55
            end
            item
              Caption = #1060#1048' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
              Width = 140
            end
            item
              Caption = #1087#1088#1086#1075#1088'.'
              Width = 60
            end
            item
              Caption = #1091#1088#1086#1074'.'
            end
            item
              Caption = #1076#1072#1090#1072' '#1079#1072#1095#1080#1089#1083'.'
              Width = 100
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object Panel3: TPanel
          Left = 6
          Top = 8
          Width = 401
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          Caption = #1042' '#1089#1087#1080#1089#1082#1072#1093' '#1075#1088#1091#1087#1087
          TabOrder = 1
        end
        object cmbOrderOut: TComboBox
          Left = 6
          Top = 403
          Width = 401
          Height = 24
          Style = csDropDownList
          Anchors = [akLeft, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object bOutGroup: TButton
          Left = 6
          Top = 368
          Width = 401
          Height = 25
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1080#1079' '#1075#1088#1091#1087#1087#1099' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1082#1072#1079#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object Panel4: TPanel
        Left = 420
        Top = 3
        Width = 512
        Height = 340
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        DesignSize = (
          512
          340)
        object Panel5: TPanel
          Left = 6
          Top = 8
          Width = 499
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          Caption = #1054#1090#1095#1080#1089#1083#1077#1085#1099' '#1080#1079' '#1075#1088#1091#1087#1087
          TabOrder = 0
        end
        object lvOut: TListView
          Left = 6
          Top = 39
          Width = 499
          Height = 197
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 45
            end
            item
              Caption = #1060#1048' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
              Width = 140
            end
            item
              Caption = #1087#1088#1086#1075#1088'.'
              Width = 60
            end
            item
              Caption = #1091#1088#1086#1074'.'
            end
            item
              Caption = #1076#1072#1090#1072' '#1079#1072#1095#1080#1089#1083'.'
              Width = 100
            end
            item
              Caption = #1076#1072#1090#1072' '#1086#1090#1095#1080#1089#1083'.'
              Width = 100
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object Panel6: TPanel
          Left = 6
          Top = 255
          Width = 379
          Height = 25
          Anchors = [akLeft, akBottom]
          BevelOuter = bvLowered
          Caption = #1057#1086#1093#1088#1072#1085#1085#1086#1089#1090#1100' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072
          TabOrder = 2
        end
        object lvContingentSafety: TListView
          Left = 6
          Top = 286
          Width = 379
          Height = 43
          Anchors = [akLeft, akBottom]
          Columns = <
            item
              Caption = #1085#1072' '#1089#1077#1085#1090'.'
              Width = 75
            end
            item
              Caption = #1085#1072' 31.12'
              Width = 75
            end
            item
              Caption = #1089#1086#1093#1088'. %'
              Width = 75
            end
            item
              Caption = #1085#1072' 31.05'
              Width = 75
            end
            item
              Caption = #1089#1086#1093#1088'. %'
              Width = 75
            end>
          ColumnClick = False
          GridLines = True
          ReadOnly = True
          TabOrder = 3
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1087#1080#1089#1086#1082' '#1091#1095#1072#1097#1080#1093#1089#1103' '#1074' '#1044#1061#1057
      ImageIndex = 1
      DesignSize = (
        935
        439)
      object Panel8: TPanel
        Left = 3
        Top = 3
        Width = 414
        Height = 400
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          414
          400)
        object lvListActualContingent: TListView
          Left = 6
          Top = 12
          Width = 401
          Height = 305
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 55
            end
            item
              Caption = #1060#1048' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
              Width = 140
            end
            item
              Caption = #1076#1072#1090#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              Width = 120
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel10: TPanel
        Left = 423
        Top = 11
        Width = 512
        Height = 340
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        DesignSize = (
          512
          340)
        object Panel11: TPanel
          Left = 6
          Top = 8
          Width = 499
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          Caption = #1054#1090#1095#1080#1089#1083#1077#1085#1099' '#1080#1079' '#1075#1088#1091#1087#1087
          TabOrder = 0
        end
        object lvListActualContingentOut: TListView
          Left = 6
          Top = 39
          Width = 499
          Height = 197
          Anchors = [akLeft, akTop, akRight, akBottom]
          Checkboxes = True
          Columns = <
            item
              Caption = #8470
              Width = 45
            end
            item
              Caption = #1060#1048' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
              Width = 140
            end
            item
              Caption = #1076#1072#1090#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103
              Width = 120
            end
            item
              Caption = #1087#1088#1086#1075#1088'.'
              Width = 70
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object Button1: TButton
          Left = 6
          Top = 283
          Width = 401
          Height = 25
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1080#1079' '#1089#1090#1091#1076#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object Panel7: TPanel
        Left = 442
        Top = 414
        Width = 304
        Height = 25
        Anchors = [akLeft, akBottom]
        BevelOuter = bvLowered
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1087#1080#1089#1086#1082' '#1076#1077#1090#1077#1081' '#1085#1072':'
        TabOrder = 2
      end
      object lvActualContingent: TListView
        Left = 458
        Top = 365
        Width = 304
        Height = 43
        Anchors = [akLeft, akBottom]
        Columns = <
          item
            Caption = #1089#1077#1085#1090#1103#1073#1088#1100
            Width = 100
          end
          item
            Caption = '31 '#1076#1077#1082#1072#1073#1088#1103
            Width = 100
          end
          item
            Caption = '31 '#1084#1072#1103
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        TabOrder = 3
        ViewStyle = vsReport
        OnColumnClick = lvActualContingentColumnClick
      end
    end
  end
end
