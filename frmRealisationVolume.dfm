object fRealisationVolume: TfRealisationVolume
  Left = 0
  Top = 0
  Caption = #1054#1073#1098#1077#1084' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1044#1054#1055
  ClientHeight = 730
  ClientWidth = 1007
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
    1007
    730)
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 6
    Width = 950
    Height = 65
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
    end
    object Label1: TLabel
      Left = 378
      Top = 9
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label2: TLabel
      Left = 210
      Top = 9
      Width = 42
      Height = 16
      Caption = #1052#1077#1089#1103#1094':'
    end
    object cmbPedagogue: TComboBox
      Left = 14
      Top = 30
      Width = 173
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbPedagogueChange
    end
    object cmbAcademicYear: TComboBox
      Left = 378
      Top = 30
      Width = 127
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbAcademicYearChange
    end
    object cbMonth: TComboBox
      Left = 210
      Top = 30
      Width = 145
      Height = 24
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 2
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
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 75
    Width = 991
    Height = 654
    ActivePage = TabSheet4
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 950
    object tsPedagogueByMonth_1: TTabSheet
      Caption = #1055#1077#1076#1072#1075#1086#1075' / '#1084#1077#1089#1103#1094' '
      ImageIndex = 4
      ExplicitWidth = 942
      object Splitter1: TSplitter
        Left = 0
        Top = 481
        Width = 983
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 62
        ExplicitWidth = 390
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 481
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 942
        DesignSize = (
          983
          481)
        object lvPedagogueByMonth1: TListView
          Left = 10
          Top = 8
          Width = 631
          Height = 464
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1043#1088#1091#1087#1087#1072' / '#1091#1095#1072#1097#1080#1081#1089#1103
              Width = 300
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 100
            end
            item
              Caption = #1095#1072#1089'/'#1085#1077#1076
              Width = 60
            end
            item
              Caption = #1095#1072#1089'/'#1084#1077#1089
              Width = 60
            end
            item
              Caption = '%'
              Width = 60
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object Memo1: TMemo
          Left = 754
          Top = 194
          Width = 185
          Height = 89
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 484
        Width = 983
        Height = 139
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 942
        DesignSize = (
          983
          139)
        object lvPedagogueByMonth2: TListView
          Left = 10
          Top = 8
          Width = 631
          Height = 121
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1086#1073#1097#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 400
            end
            item
              Caption = #1095#1072#1089'/'#1085#1077#1076
              Width = 60
            end
            item
              Caption = #1095#1072#1089'/'#1084#1077#1089
              Width = 60
            end
            item
              Caption = '%'
              Width = 60
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object bExportPedagogueByMonth: TButton
          Left = 746
          Top = 97
          Width = 185
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'bExportPedagogueByMonth'
          TabOrder = 1
          OnClick = bExportPedagogueByMonthClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1055#1077#1076#1072#1075#1086#1075' / I '#1087#1086#1083#1091#1075#1086#1076#1080#1077' '
      ImageIndex = 4
      ExplicitWidth = 942
      object Splitter2: TSplitter
        Left = 0
        Top = 481
        Width = 983
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 942
      end
      object Panel4: TPanel
        Left = 0
        Top = 484
        Width = 983
        Height = 139
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 942
        DesignSize = (
          983
          139)
        object lvPedagogueByYear2: TListView
          Left = 10
          Top = 8
          Width = 867
          Height = 123
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 300
            end
            item
              Caption = #1089#1077#1085#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1086#1082#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1085#1086#1103#1073
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1076#1077#1082
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'I '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end
            item
              Caption = #1101#1082#1089#1087
              Width = 0
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 481
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitWidth = 942
        DesignSize = (
          983
          481)
        object lvPedagogueByYear1: TListView
          Left = 10
          Top = 8
          Width = 867
          Height = 463
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1043#1088#1091#1087#1087#1072' / '#1091#1095#1072#1097#1080#1081#1089#1103
              Width = 220
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 80
            end
            item
              Caption = #1089#1077#1085#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1086#1082#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1085#1086#1103#1073
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1076#1077#1082
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'I '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end
            item
              Caption = #1101#1082#1089#1087
              Width = 0
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1061#1057' / I '#1087#1086#1083#1091#1075#1086#1076#1080#1077' '
      ImageIndex = 4
      ExplicitWidth = 942
      object Splitter3: TSplitter
        Left = 0
        Top = 300
        Width = 983
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 481
        ExplicitWidth = 942
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 300
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 942
        DesignSize = (
          983
          300)
        object lvDHSByYear1: TListView
          Left = 10
          Top = 8
          Width = 767
          Height = 282
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1077#1076#1072#1075#1086#1075
              Width = 200
            end
            item
              Caption = #1089#1077#1085#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1086#1082#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1085#1086#1103#1073
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1076#1077#1082
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'I '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 303
        Width = 983
        Height = 320
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 942
        DesignSize = (
          983
          320)
        object lvDHSByYear2: TListView
          Left = 10
          Top = 8
          Width = 767
          Height = 305
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 200
            end
            item
              Caption = #1089#1077#1085#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1086#1082#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1085#1086#1103#1073
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1076#1077#1082
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'I '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1077#1076#1072#1075#1086#1075' / II '#1087#1086#1083#1091#1075#1086#1076#1080#1077' '
      ImageIndex = 3
      ExplicitWidth = 942
      object Splitter4: TSplitter
        Left = 0
        Top = 481
        Width = 983
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 942
      end
      object Panel8: TPanel
        Left = 0
        Top = 484
        Width = 983
        Height = 139
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 942
        DesignSize = (
          983
          139)
        object lvPedagogueByYearII2: TListView
          Left = 10
          Top = 6
          Width = 964
          Height = 123
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 300
            end
            item
              Caption = #1103#1085#1074
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1092#1074#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1088#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1072#1087#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1081
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'II '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end
            item
              Caption = #1101#1082#1089#1087
              Width = 0
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 481
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitTop = 8
        ExplicitWidth = 942
        DesignSize = (
          983
          481)
        object lvPedagogueByYearII1: TListView
          Left = 10
          Top = 12
          Width = 964
          Height = 463
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1043#1088#1091#1087#1087#1072' / '#1091#1095#1072#1097#1080#1081#1089#1103
              Width = 220
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 80
            end
            item
              Caption = #1103#1085#1074
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1092#1074#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1088#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1072#1087#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1081
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'II '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end
            item
              Caption = #1101#1082#1089#1087
              Width = 0
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1044#1061#1057' / II '#1087#1086#1083#1091#1075#1086#1076#1080#1077' '
      ImageIndex = 4
      ExplicitWidth = 942
      object Splitter5: TSplitter
        Left = 0
        Top = 300
        Width = 983
        Height = 3
        Cursor = crVSplit
        Hint = '0'
        Align = alTop
        ExplicitWidth = 942
      end
      object Panel10: TPanel
        Left = 0
        Top = 303
        Width = 983
        Height = 320
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 942
        DesignSize = (
          983
          320)
        object lvDHSByYearII2: TListView
          Left = 10
          Top = 8
          Width = 864
          Height = 305
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
              Width = 200
            end
            item
              Caption = #1103#1085#1074
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1092#1074#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1088#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1072#1087#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1081
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'II '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 300
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitTop = 8
        ExplicitWidth = 942
        DesignSize = (
          983
          300)
        object lvDHSByYearII1: TListView
          Left = 10
          Top = 8
          Width = 864
          Height = 282
          Anchors = [akLeft, akTop, akBottom]
          Columns = <
            item
              Caption = #8470
              Width = 40
            end
            item
              Caption = #1055#1077#1076#1072#1075#1086#1075
              Width = 200
            end
            item
              Caption = #1103#1085#1074
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1092#1074#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1088#1090
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1072#1087#1088
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = #1084#1072#1081
              Width = 40
            end
            item
              Caption = '%'
              Width = 60
            end
            item
              Caption = 'II '#1087'/'#1075
            end
            item
              Caption = '%'
              Width = 70
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
end
