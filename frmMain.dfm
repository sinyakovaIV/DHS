object fMain: TfMain
  Left = 0
  Top = 0
  Caption = #1044#1077#1090#1089#1082#1072#1103' '#1093#1086#1088#1086#1074#1072#1103' '#1089#1090#1091#1076#1080#1103' '
  ClientHeight = 710
  ClientWidth = 1294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    1294
    710)
  PixelsPerInch = 96
  TextHeight = 18
  object StatusBar1: TStatusBar
    Left = 0
    Top = 685
    Width = 1294
    Height = 25
    Panels = <>
    SimplePanel = True
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 1289
    Height = 641
    ActivePage = TabSheet2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083' '
      DesignSize = (
        1281
        610)
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1267
        Height = 611
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clMenuBar
        ParentBackground = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 1281
        Height = 699
        ActivePage = TabSheet8
        BiDiMode = bdLeftToRight
        MultiLine = True
        ParentBiDiMode = False
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet7: TTabSheet
          Caption = #1055#1086#1076#1088#1086#1073#1085#1086#1077'  '
          DesignSize = (
            1251
            691)
          object lvDetailTimesheet: TListView
            Left = 3
            Top = -1
            Width = 924
            Height = 669
            Anchors = [akLeft, akTop, akBottom]
            Columns = <
              item
                Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
                Width = 90
              end
              item
                Caption = #1042#1088#1077#1084#1103
                Width = 90
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1086#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 240
              end
              item
                Caption = #1059#1088#1086#1074#1077#1085#1100
                Width = 69
              end
              item
                Caption = #8470' '#1082#1072#1073'.'
                Width = 69
              end
              item
                Caption = #1055#1088#1077#1076#1084#1077#1090
                Width = 230
              end
              item
                Caption = #1050#1086#1085#1094#1077#1088#1090#1084#1077#1081#1089#1090#1077#1088
                Width = 170
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
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet8: TTabSheet
          Caption = #1050#1083#1072#1089#1089#1080#1095#1077#1089#1082#1080#1081' '#1074#1080#1076'  '
          ImageIndex = 1
          object lvClassicTimesheet1: TListView
            Left = 8
            Top = 39
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
          end
          object Panel5: TPanel
            Left = 423
            Top = 8
            Width = 409
            Height = 24
            BevelOuter = bvLowered
            Caption = #1042#1090#1086#1088#1085#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Panel6: TPanel
            Left = 838
            Top = 8
            Width = 409
            Height = 24
            BevelOuter = bvLowered
            Caption = #1057#1088#1077#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object Panel7: TPanel
            Left = 8
            Top = 308
            Width = 409
            Height = 25
            BevelOuter = bvLowered
            Caption = #1063#1077#1090#1074#1077#1088#1075
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object Panel8: TPanel
            Left = 423
            Top = 308
            Width = 409
            Height = 25
            BevelOuter = bvLowered
            Caption = #1055#1103#1090#1085#1080#1094#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object Panel9: TPanel
            Left = 838
            Top = 308
            Width = 409
            Height = 25
            BevelOuter = bvLowered
            Caption = #1057#1091#1073#1073#1086#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object Panel3: TPanel
            Left = 8
            Top = 8
            Width = 409
            Height = 25
            BevelOuter = bvLowered
            Caption = #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object lvClassicTimesheet2: TListView
            Left = 423
            Top = 39
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 7
            ViewStyle = vsReport
          end
          object lvClassicTimesheet3: TListView
            Left = 838
            Top = 39
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 8
            ViewStyle = vsReport
          end
          object lvClassicTimesheet4: TListView
            Left = 8
            Top = 339
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 9
            ViewStyle = vsReport
          end
          object lvClassicTimesheet5: TListView
            Left = 423
            Top = 339
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 10
            ViewStyle = vsReport
          end
          object lvClassicTimesheet6: TListView
            Left = 838
            Top = 339
            Width = 409
            Height = 263
            Columns = <
              item
                Caption = #1042#1088#1077#1084#1103
              end
              item
                Caption = #1043#1088#1091#1087#1087#1072' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                Width = 235
              end
              item
                Caption = #1059#1088#1086#1074'.'
                Width = 45
              end
              item
                Caption = #1055#1088'-'#1084#1072
                Width = 75
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
            ShowWorkAreas = True
            TabOrder = 11
            ViewStyle = vsReport
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1072#1075#1088#1091#1079#1082#1072' '
      ImageIndex = 2
      object Panel2: TPanel
        Left = 4
        Top = 6
        Width = 806
        Height = 530
        Color = clMenuBar
        ParentBackground = False
        TabOrder = 0
        object PageControl2: TPageControl
          Left = 8
          Top = 48
          Width = 785
          Height = 470
          ActivePage = TabSheet6
          BiDiMode = bdLeftToRight
          MultiLine = True
          ParentBiDiMode = False
          TabOrder = 0
          TabPosition = tpLeft
          object TabSheet4: TTabSheet
            Caption = #1055#1086' '#1075#1088#1091#1087#1087#1072#1084' / '#1054#1073#1091#1095#1072#1102#1097#1080#1084#1089#1103' '
            object lvByGroupChild: TListView
              Left = 8
              Top = 8
              Width = 744
              Height = 445
              Columns = <
                item
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' / '#1054#1073#1091#1095#1072#1102#1097#1080#1081#1089#1103
                  Width = 240
                end
                item
                  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
                  Width = 220
                end
                item
                  Caption = #1059#1088#1086#1074#1077#1085#1100
                  Width = 65
                end
                item
                  Caption = #1063#1072#1089#1086#1074
                  Width = 65
                end
                item
                  Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
                  Width = 150
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
              ShowWorkAreas = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1055#1086' '#1091#1088#1086#1074#1085#1103#1084' '
            ImageIndex = 1
            object lvByLevel: TListView
              Left = 8
              Top = 8
              Width = 604
              Height = 424
              Columns = <
                item
                  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
                  Width = 220
                end
                item
                  Caption = #1059#1088#1086#1074#1077#1085#1100
                  Width = 65
                end
                item
                  Caption = #1043#1088#1091#1087#1087' / '#1044#1077#1090#1077#1081
                  Width = 100
                end
                item
                  Caption = #1063#1072#1089#1086#1074
                  Width = 65
                end
                item
                  Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
                  Width = 150
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
              ShowWorkAreas = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object TabSheet6: TTabSheet
            Caption = #1055#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1072#1084'  '
            ImageIndex = 2
            DesignSize = (
              755
              462)
            object lvByProgram: TListView
              Left = 8
              Top = 8
              Width = 604
              Height = 424
              Anchors = [akLeft, akTop, akBottom]
              Columns = <
                item
                  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
                  Width = 235
                end
                item
                  Caption = #1043#1088#1091#1087#1087' / '#1044#1077#1090#1077#1081
                  Width = 96
                end
                item
                  Caption = #1063#1072#1089#1086#1074
                  Width = 65
                end
                item
                  Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
                  Width = 204
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
              ShowWorkAreas = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 415
          Top = 3
          Width = 378
          Height = 39
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100
          Columns = 3
          Items.Strings = (
            #1074#1089#1077' '#1095#1072#1089#1099
            #1075#1088#1091#1087#1087#1086#1074#1099#1077
            #1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077)
          TabOrder = 1
        end
      end
    end
  end
  object pPedagogueDate: TPanel
    Left = -3
    Top = 4
    Width = 1290
    Height = 29
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Caption = '    '#1060#1048#1054' '#1087#1077#1076#1072#1075#1086#1075#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    AlignWithMargins = True
    Left = 1867
    Top = 1001
    Width = 44
    Height = 46
    Hint = #1069#1082#1089#1087#1086#1088#1090
    Align = alCustom
    BiDiMode = bdLeftToRight
    Glyph.Data = {
      12140000424D1214000000000000360000002800000029000000290000000100
      180000000000DC130000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFE
      FEFEFEFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFBFBFBF9F9F9F8F8F8F8F8F8F6F6
      F6F5F5F5F8F8F8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFD
      FDFDFDFDFCFCFCFAFAFAF9F9F9F8F8F8F7F7F7F5F5F5F3F3F3F1F1F1EFEFEFED
      EDEDEAEBEBE7E8E8E5E6E6E4E6E6E2E4E4DFE1E1DDDFDFDADDDDD7DBDAD3D7D6
      DFE0E0F6F6F6FFFFFFFFFFFFFFFEFFFFFCFEFDFBFEFCFBFDFBF9FBF9F8F9F8F7
      F7F7F6F6F6F4F5F4F3F3F3F2F2F2F1F1F1EFEFEFECEDEDEBEBEBE8E9E8E6E7E7
      E3E5E5E0E3E2DEE0E0DDDFDFDADDDCD7DBDAD5D9D8D4D9D8D2D8D7D0D7D6CFD7
      D5CDD6D5CDD6D5CBD8D5CBD8D6CAD8D6CAD8D5C9D8D5C6D6D4BCCAC8C9CDCDEF
      F0F0FEFEFEFFFEFFFFF4FCF7D3EEDBC8E9D2CBE7D4C9DED0C8D8CDCBD8D0CDD8
      D1CED7D2CFD7D3D2D8D5D4D8D7D4D8D7D3D9D8D2D8D7D0D7D6D0D7D6CFD8D7CF
      DAD8CFDAD8D0DBDACFDCDACFDEDBD0E0DDD1E2DFD2E3E1D2E4E2D2E6E3D3E8E5
      D3E9E6D3EAE6D4ECE8D4EDE9D4EDE9D5EDE9D0E9E5C0D2CFC6CBCBEDEEEEFDFD
      FDFFFEFFFEE5F5EA9AD8AD9ED8B0B2DCC0B7D5C3B9D2C4C3D6CCC8DAD1CCDBD5
      CFDED9D4E1DED9E4E2DAE6E4DBE8E6DCE9E7DCEAE8DCECE9DEEEEBDEEFECDEF0
      EDDEF1EEDEF2EEDFF3F0DFF4F1DEF4F0DEF3F0DDF4F0DCF3EFDBF4EFD9F3EFD7
      F1ECD4F0E9D1EEE7CEECE4D2EFE9D4EEE9C3D7D3C4CAC9EBECECFDFDFDFFFEFF
      FEE1F3E694D5A8ADD9BCBCDCC9D9EDE4E3F2EDE5F3EFE5F3F0E5F4F0E6F5F1E7
      F6F2E6F5F3E6F6F3E7F7F4E8F8F5E3F6F2DCF3EDD9F1EAD4EEE6CFEBE1C8E6DC
      C2E2D5BFE1D2CDE9E0DEF5F1DAF3EFC4E8DDB1DECDA8D8C4A0D1BC97CBB28FC4
      A887BEA087BD9EAAD5C1CFEAE5C5D9D6C2C8C7E9E9E9FDFDFDFFFEFFFEE1F3E6
      96D4A99CCCAD92C1A5D5EAE1EDFBF7DBF1EAD0EBE2CBE8DEC6E7DBC2E6D8BDE3
      D5BDE3D5D1EEE4E7F8F5D1EDE4ADDAC89ED1BC96CBB28DC4A783BC9D79B49279
      B391A4CFBAD8F1EBD6F1EBA9D9C789C7AC7FC1A078B99870B28E69AC8563A67D
      65A67E96C7ADCBE9E1C7DCD9C1C9C7E7E8E7FDFDFDFFFEFFFEE1F3E695D4A896
      C8A77BB391C5E1D3E9F8F3B1DCCA95CEB690CCB38FCBB18CCBB08BCAAF8ECBB1
      B7DFCFE4F7F3CAE9DE94CDB37FC1A378BB9971B48F69AD8662A77D64A67D94C4
      AAD4EEE6D7F2EBA9D9C684C4A87ABE9D74B7956CB08B67AB8460A57C61A47A91
      C3A8CAE8E0C8DEDBC1C9C7E6E7E6FDFDFDFFFEFFFEE1F3E695D4A896C8A86EAC
      86B5D7C5EAF8F5ACD9C686C7AB83C6A983C6A983C6A983C6A986C7ABAADAC8E0
      F5F0CFECE396CEB67DC0A176BA986FB38F68AC8662A67C62A47B8EC0A5D0ECE3
      DAF4EEAEDCCB86C6AA7ABF9D74B7956DB18C67AB8460A57C5FA2798BBFA2C8E6
      DEC9E0DDBEC7C5E2E3E2FCFCFCFFFEFFFEE1F3E695D4A896C9A865A67EA4CCB6
      E9F7F2B6DFCD88C8AD83C6A983C6A983C6A983C6A985C7AAA4D7C2DAF3ECD5EF
      E89BD1BA7EC2A278BC9970B49169AD8863A77E61A57B88BD9ECBEADEDBF5EFB4
      DFD089C7AB7CC09E76B8976EB28E68AD8663A67E60A27A89BEA0C7E7DDCBE3DF
      BEC7C5E0E1E1FBFBFBFFFEFFFEE1F3E695D4A897C9A85EA27893C2A7E4F4EEC0
      E5D78CCBB084C6AA84C6AA84C7AA84C7AA86C8ABA0D5C0D6F0E8DBF3ECA3D6C1
      84C4A87DBF9E77B89771B28F6DAD876CAB848BBFA2CAE8DCDDF4F0BDE4D796CE
      B68BC7AB87C3A583BFA080BB9B7DB8977DB6959BCAB2CAE9E1CCE5E1BDC7C6DF
      E0E0FBFBFBFFFEFFFEE1F3E695D4A897C9A85A9F7485B99ADCEFE8CEEBE19FD4
      BE97D0B897D0B899D1B99BD2BB9ED3BEB2DDCDD9F2EAE2F6F1BEE3D6A7D7C3A4
      D4BFA3D1BBA1CFB9A1CEB8A3CFB9B4D9C8D5EFE7E0F6F2D2F0E8C1E6D9BEE4D7
      BDE3D6BFE4D7C1E4D7C3E5D9C4E5DACBEAE1D6F0ECCEE8E4BDC7C6DCDDDDFBFB
      FBFFFEFFFEE1F3E695D4A898CAA9579C7174AF8BD3E9DFE5F6F0D1ECE3CEEBE1
      CEECE2D0EDE2D2EEE4D5EFE6DBF2ECE6F9F4E9F9F7E0F5F0DBF2ECDAF2EBDAF1
      EBDAF2EBDAF2ECDBF2ECDCF3EEDFF6F1E1F8F4DEF6F2D7F2ECD5F0E9D1F0E8CF
      EDE6CCEBE2C9EAE0C6E7DDC9E9E0D4EFEACFE9E5BCC7C5D9DADAFAFAFAFFFEFF
      FEE1F3E696D4A899CAA9559A6E66A67EC9E2D6EFFBF9F0FDF9EFFCFAEFFCFAEE
      FCF9EEFCF9EDFCF9ECFBF9EBFBF8EAFAF8E9F9F7E1F4EFCFE8E0C8E3D9C4E0D5
      BEDBCFB9D7CAB7D6C9C7E4D9DDF4EFD4F0EAB6E0D2A8D8C5A2D4BE9ACDB693C7
      AD8CC2A685BC9E95C7ADC5E5DBD1EAE7BDC8C7D7D8D8F8F8F8FFFEFFFEE1F3E6
      96D4A899CAA9559B6D5A9F73BDDBCBEDFAF7F0FDFAEFFBF9EFFBF9EDFBF9ECFB
      F8EBFAF7E8F9F6E7F9F4E6F7F4DBEFEAA8CBBA73A488659A7A609574588F6B56
      8D686FA080B0D1C2DBF3EDCDEDE499D0BA83C3A67CBD9D74B5936DB08A66A982
      5FA37975B18EB9DED0D2ECE8BDCAC9D5D7D6F7F7F7FFFEFFFEE1F3E696D4A89A
      CAA9569B6D509869ADD2BDE8F7F3E4F7F2D5EEE6CCE9DEC7E7DAC3E5D7BEE2D3
      B9DECFB6DBCBAFD7C490BDA5518D672D6F44256A3B2367372265353C794D89B3
      9ACCE6DEE0F7F2D0EEE698D0B97FC1A378BB9A70B4916AAE8963A8805DA27770
      AE88B5DBCBD2ECE8BECCCAD2D4D4F7F7F7FFFEFFFEE1F3E696D4A99ACAAA579B
      6E499463A1CBB1E4F5EFDFF3EDB6DFCF92CCB28CC8AC88C5A784C2A480BFA07C
      BA9A69A88441845B276C3D1F64341C62311C602E2B6C3C79A78ACAE4DCE1F6F3
      E2F8F4D3F0E99BD2BC80C2A379BC9B71B4916BAE8964A8815EA3796DAB85B1D8
      C7D2ECE8BFCECCD0D2D2F6F6F6FFFEFFFEE1F3E696D4A99BCAAA589C6F438F5D
      91BFA3E1F2ECEEFCF9DDF4EDABD9C786C5A87BBE9E78BB9A74B79564A8823F85
      59246B3B1E64331B602F195E2C1F622F43835792C0A6D2ECE5E1F7F3E2F8F4D6
      F1EBA0D4BF81C3A579BC9B72B5926BAF8A65A9815EA37969A982ACD5C3D2ECE7
      C1D0CECED1D1F5F5F5FFFEFFFEE1F3E696D4A99BCBAB5A9D703E8C5780B493DA
      EEE6F1FDFBEFFCFAE1F4EFB9DFD08BC6AA79BB9B69AD89458A5F266C3C1D6330
      1A602D185D2A1D5F2C37794A579A706CAB859AC8B0CCE9DFE0F6F2DBF4EFB5E0
      D19ED3BD9ACFB797CCB495C9AF93C6AC92C5AA99C9B0BEE1D5D3EDE9C0D1CECB
      CECEF3F4F4FFFEFFFEE1F3E696D5A99ECCAD61A174428E5975AC88D5EAE0F1FD
      FBF1FDFAF0FCFAE7F7F4C0E2D486C0A34F936A266C3C1C602F1A5E2B185C281E
      602E4F875F80B5968ABFA18BBFA095C5AAB9DDCDDBF4EDE0F7F3D9F3EED5F0EA
      D3F0EAD3F0EAD3F0E9D3F0E9D3F0E9D3F0EAD7F2EED5EFEBC0D2D0C9CDCCF1F2
      F1FFFEFFFEE1F3E696D4A9A2CEAF69A57C4A92606EA880CEE6D9F0FCFAF1FDFA
      F0FCFAEEFCF9D8ECE586B3983273461B5F2D195C29175A261A5C283B7A4D9AC3
      ACD3ECE3DBF2ECDCF4EDDCF4EDDEF4F0E1F7F3E0F7F3D0EEE6BFE6D9B9E1D4B5
      DECFB1DAC9ACD6C4A7D3BEA7D3BFC0E2D7D2EDE9C2D4D2C8CCCBF1F1F1FFFEFF
      FEE1F3E697D5AAA5D0B271AA8253976769A57BC7E1D2F0FCF9F1FDFAF0FCFAE5
      F4F0A7C7B44981591E612F185B271759251A5B282F724156996F7BB694AED6C1
      D6EFE7E3F7F4E5F9F5E3F8F5E2F8F4DFF5F2B9E2D58FCBB285C4A77DBD9D77B7
      9570B18C6AAA846CAB86A0CDB8CEEBE4C4D6D3C6CAC9EEEEEEFFFEFFFEE1F3E6
      97D4AAA9D2B57AAF895E9D6F68A47ABFDCCCEEFBF8F1FDFBE9F7F3B7D2C45389
      621E612F175A251657221D5D2937754755976E64A88165AA8173B28C9FCCB5CA
      E8DDE1F6F1E4F8F5E2F8F4DFF6F2BAE3D587C6AB7BBE9E73B7956DB18C66AB83
      60A47B62A57B97C8AECDEAE3C4D8D5C4C8C8ECECECFFFEFFFEE1F3E697D4AAAC
      D4B883B49069A3786CA57CB6D5C3ECF9F6F0FCF9C3DBCE639471226331175A26
      1657221D5A274D805886B39780BA9B6BAE8864A98063A87E6DAC8791C3A8C2E2
      D5DDF4EFE2F8F4E0F7F3C1E6DA89C8AC7CBF9F74B8966EB28D67AB8460A47C61
      A47A94C5ABCCE9E2C6DAD7C4C9C8EBEBEBFFFEFFFEE1F3E798D5ABB0D7BB8EBA
      9A74A98275AA83AED0BAE9F7F2E9F7F39DBEA95C8D684C80584A7E55497D5461
      8E6CA6C5B2D3EAE2BFE1D393C7AC84BC9D82BB9B82B99989BDA0A7D0BCCEEAE1
      E0F7F2E1F7F3C7EADF8CCAAF7DC0A075BA9870B38F6AAD8763A67F63A57D91C3
      A9CAE8E0C7DCD9C2C8C7E9E9E9FFFEFFFEE3F4E89AD6ACB3DABE9AC2A580B18D
      7FB18CA9CCB4E5F4EEECF9F5CADFD4BDD5C7BBD3C4BAD3C4BAD3C4C6DDD2E0F1
      ECEAFAF7E5F7F4D1ECE3C8E6DAC6E5D9C6E5D9C6E4D9CAE7DDD7F0EAE2F7F4E2
      F7F4D1EFE7A6D8C49AD1B995CCB491C7AD8CC3A887BFA187BEA0A6D2BECEEBE4
      C8DEDAC1C8C7E6E8E8FFFFFFFFE8F6EC9ED8AFB5DCC0A8C9B08BB8978AB796A6
      C9B1E0F0E9F0FCFAEEFAF7ECF9F6ECF9F6EBF9F6EAF9F5EAF9F7ECFBF8EBFBF8
      EAFAF8E8F9F6E6F9F5E5F8F5E5F8F4E4F8F4E3F8F4E3F7F4E3F8F5E2F7F4DDF5
      F1D2F0E8CFEDE5CDECE4CBEBE3CAEAE1C9E9DFC8E9DECEEDE5D6F2ECCAE0DDC1
      C9C7E4E6E6FFFFFFFFEFF8F1A7DBB6ADDABAB5D3BC97BFA195BDA0A7C9B0D6E9
      DFE8F6F2E9F7F2E8F6F2E8F6F2E7F6F2E6F6F1E5F5F1E4F5F0E3F5F0E2F4F0E1
      F4EFE1F4EFE1F4EFE1F3EEE0F3EEDFF3EEDEF2EDDDF2EDDCF2ECDBF2ECDAF2EC
      D8F1EBD8F1EBD9F1ECDBF3EDD7F2EBDBF4EFDEF5F1DDF4F1D4E8E5CFD7D5EBEC
      ECFFFFFFFFF5FBF7B5E2C3A1D8B1C2DBC9A5C6ADA0C3A8A4C6ACB4D1BCBBD5C3
      BBD5C3BAD5C3BAD5C3BAD5C3BAD5C3B9D4C3B9D4C2B9D4C2B9D4C2B8D4C2B8D4
      C2B8D4C2B8D4C2B7D4C2B7D4C2B7D4C1B6D4C1B5D4C1B5D4C1B5D4C1B4D4C1B4
      D4C1BFD9C9CBE6D7B6E1C7D9EFE4F0F9F7F0F8F8EFF5F5F0F2F1F9F9F9FFFFFF
      FFFAFDFBC9EAD398D6ABC9E3D0B7D2BDABCBB2ABCBB2ACCCB2ACCBB3ACCBB3AC
      CBB3ACCBB3ACCBB3ACCBB3ACCBB3ACCBB3ACCBB3ACCBB3ABCBB3ABCBB3ABCBB3
      ABCBB3ABCBB3ABCBB3ABCBB3ABCBB3ABCBB3ABCBB3ABCBB3ABCBB3ACCBB3BAD4
      BFC7E4CFA4DBB5DAF1E1FDFFFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFDFEFD
      DCF1E29DD8AFBFE2C9CBDECFB8D2BEB5D0BBB4D1BAB5D0BBB5D0BBB5D0BBB5D0
      BBB5D0BBB5D0BBB5D0BBB5D1BBB5D0BBB5D0BBB5D0BBB5D0BBB5D1BBB5D0BBB5
      D1BBB5D0BBB5D0BBB5D1BBB5D0BBB5D1BBB5D1BBB5D0BBB5D1BBC1D9C6CAE5D2
      A4DBB5DAF1E1FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEEFF8F2B2
      E1C0A8DBB7D0E6D6CADECEBFD7C5BDD6C2BDD5C3BDD5C2BDD6C2BDD6C2BDD5C2
      BDD6C2BDD5C2BDD6C2BDD5C2BDD6C2BDD6C2BDD5C2BDD6C2BDD6C2BDD6C2BDD5
      C2BDD5C2BDD6C2BDD6C2BDD5C2BDD6C2BDD5C2BDD6C2C8DDCCCCE7D3A4DBB5DA
      F1E1FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFCDCF1E2A5DC
      B6B3DFC1D5E9DAD2E3D6CADECEC6DBCBC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6
      DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCA
      C6DBCAC6DBCAC6DBCAC6DBCAC6DBCAC6DBCACFE1D2CEE8D5A4DBB5DAF1E1FEFF
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEF8FCF9D1ECD9A4DBB4
      AFDEBCD0E8D7DBEADFD7E6DAD1E2D4D0E1D3CFE0D1CEDFD1CEDFD1CEDFD1CEDF
      D1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CEDFD1CE
      DFD1CEDFD1CEDFD1CEDFD1CEDFD1D5E5D8D0E9D8A4DBB5DAF1E1FEFFFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FBF8D6EEDDACDEBBA2
      D9B3B2E0C0C7E6D0D3EADADAEBDFDCEADFDBE9DEDAE9DEDAE9DEDAE9DEDAE9DE
      DAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9DEDAE9
      DEDAE9DEDAE9DEDAE9DEDEECE1D0EAD8A2DAB4DAF1E1FEFFFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFBE7F6EBC2E7CDA9DE
      B99FD9B19CD8AE9ED8AFA5DAB6A8DBB7A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9
      DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8A9DBB8
      A9DBB8A9DBB8A9DCB89BD7AD91D4A5DAF1E0FEFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6FCF8E9F7EEDCF1E2
      CEECD7C2E7CDBAE4C8B9E3C5B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3
      C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8E3C4B8
      E3C4B8E3C4B6E2C3C2E7CEEDF8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFDFEFEFBFEFCF9
      FDFAF6FCF8F6FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7
      F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FB
      F7F6FBF7F8FCF9FDFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphRight
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 1112
    Top = 4
    Width = 174
    Height = 45
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 4
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 472
    Top = 8
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object Settings1_1: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        object N15: TMenuItem
          AutoCheck = True
          Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077' '#1089#1080#1089#1090#1077#1084#1099
          Checked = True
        end
        object N16: TMenuItem
          AutoCheck = True
          Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1090#1100' '#1086' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1080' '#1078#1091#1088#1085#1072#1083#1072
          Checked = True
        end
        object N18: TMenuItem
          Caption = #1047#1074#1086#1085#1082#1080
          object N19: TMenuItem
            AutoCheck = True
            Caption = #1047#1074#1086#1085#1086#1082' '#1074' '#1085#1072#1095#1072#1083#1077' '#1091#1088#1086#1082#1072
            Checked = True
          end
          object N20: TMenuItem
            AutoCheck = True
            Caption = #1047#1074#1086#1085#1086#1082' '#1074' '#1082#1086#1085#1094#1077' '#1091#1088#1086#1082#1072
            Checked = True
          end
          object N21: TMenuItem
            Caption = #1042#1099#1073#1086#1088' '#1084#1077#1083#1086#1076#1080#1080' '#1079#1074#1086#1085#1082#1072
          end
        end
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Exit1_2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = Exit1_2Click
      end
    end
    object Data2: TMenuItem
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103
      object Pedagogue2_1: TMenuItem
        Caption = #1055#1077#1076#1072#1075#1086#1075#1080
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object LearningChild2_2: TMenuItem
        Caption = #1054#1073#1091#1095#1072#1102#1097#1080#1077#1089#1103
        OnClick = LearningChild2_2Click
      end
    end
    object EducationalPart3: TMenuItem
      Caption = #1059#1095#1077#1073#1085#1072#1103' '#1095#1072#1089#1090#1100
      object N1_LeaningGroup: TMenuItem
        Caption = #1059#1095#1077#1073#1085#1099#1077' '#1075#1088#1091#1087#1087#1099
        object LearningGropeList_N23: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1091#1095#1077#1073#1085#1099#1093' '#1075#1088#1091#1087#1087
          OnClick = LearningGropeList_N23Click
        end
        object LearningGroupFilling_N24: TMenuItem
          Caption = #1053#1072#1087#1086#1083#1085#1103#1077#1084#1086#1089#1090#1100' '#1091#1095#1077#1073#1085#1099#1093' '#1075#1088#1091#1087#1087
        end
      end
      object PedagogueClassList_N2: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1072#1089#1089#1072' '#1087#1077#1076#1072#1075#1086#1075#1086#1074
        object Individual_N2: TMenuItem
          Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' '#1079#1072#1085#1103#1090#1080#1103
          OnClick = Individual_N2Click
        end
        object SmalGroup_N3: TMenuItem
          Caption = #1052#1077#1083#1082#1086#1075#1088#1091#1087#1087#1086#1074#1099#1077' '#1079#1072#1085#1103#1090#1080#1103
          OnClick = SmalGroup_N3Click
        end
      end
      object TimeSheet_N3: TMenuItem
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
        OnClick = TimeSheet_N3Click
      end
      object JournalPedagogue_N2: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1076#1072#1075#1086#1075#1072
        object N3_CollectiveJournal: TMenuItem
          Caption = #1057#1074#1086#1076#1085#1099#1081
          OnClick = N3_CollectiveJournalClick
        end
        object N23_NavigateStatisticsPage: TMenuItem
          Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1086#1085#1085#1086'-'#1089#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
          OnClick = N23_NavigateStatisticsPageClick
        end
        object N24_IndividualPageJournal: TMenuItem
          Caption = #1057#1090#1088#1072#1085#1080#1094#1072' '#1075#1088#1091#1087#1087#1099' / '#1091#1095#1072#1097#1077#1075#1086#1089#1103
          OnClick = N24_IndividualPageJournalClick
        end
        object N3_OpenJournal: TMenuItem
          Caption = #1054#1090#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083
          OnClick = N3_OpenJournalClick
        end
      end
      object N2: TMenuItem
        Caption = #1057#1086#1073#1099#1090#1080#1103
        object Orders_N3: TMenuItem
          Caption = #1055#1088#1080#1082#1072#1079#1099
          OnClick = Orders_N3Click
        end
        object N10: TMenuItem
          Caption = #1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
          object TripPedagogue_N24: TMenuItem
            Caption = #1055#1077#1076#1072#1075#1086#1075#1080#1095#1077#1089#1082#1080#1077
            OnClick = TripPedagogue_N24Click
          end
          object TripLearningChild_N25: TMenuItem
            Caption = #1059#1095#1077#1085#1080#1095#1077#1089#1082#1080#1077
            OnClick = TripLearningChild_N25Click
          end
        end
        object SickLeave_N23: TMenuItem
          Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
          OnClick = SickLeave_N23Click
        end
        object HolidayWorkOff_N24: TMenuItem
          Caption = #1042#1099#1093#1086#1076#1085#1099#1077'/'#1087#1088#1072#1079#1076#1085#1080#1095#1085#1099#1077
          OnClick = HolidayWorkOff_N24Click
        end
      end
      object MonitoringSUN_N3: TMenuItem
        Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1047#1059#1053#1086#1074
        OnClick = MonitoringSUN_N3Click
      end
    end
    object MethodicalWork4: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1080#1095#1077#1089#1082#1072#1103' '#1088#1072#1073#1086#1090#1072
    end
    object Reports5: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object RealizationVolume_N11: TMenuItem
        Caption = #1054#1073#1098#1077#1084' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1044#1054#1055
        OnClick = RealizationVolume_N11Click
      end
      object N12: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1080#1074#1085#1086#1089#1090#1100' '#1086#1089#1074#1086#1077#1085#1080#1103' '#1044#1054#1055
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1085#1086#1089#1090#1100' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072
        OnClick = N13Click
      end
      object N17: TMenuItem
        Caption = #1053#1072#1075#1088#1091#1079#1082#1072
        OnClick = N17Click
      end
      object TimeSheetReport: TMenuItem
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
        OnClick = TimeSheetReportClick
      end
      object N1: TMenuItem
        Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1081' '#1089#1086#1089#1090#1072#1074
        OnClick = N1Click
      end
      object GroupComposition_N3: TMenuItem
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087
        OnClick = GroupComposition_N3Click
      end
      object ChildDataForJournal_N3: TMenuItem
        Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1091#1095#1072#1097#1080#1093#1089#1103
        OnClick = ChildDataForJournal_N3Click
      end
    end
    object Directory6: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    object SMK7: TMenuItem
      Caption = #1057#1052#1050
    end
    object N4: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N5: TMenuItem
        Caption = #1055#1086#1084#1086#1097#1100
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      end
      object N14: TMenuItem
        Caption = #1042#1088#1077#1084#1077#1085#1085#1086#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1092#1086#1088#1084#1099
        OnClick = N14Click
      end
    end
  end
end
