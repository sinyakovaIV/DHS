object fMonitoringSUN: TfMonitoringSUN
  Left = 0
  Top = 0
  Caption = 'fMonitoringSUN'
  ClientHeight = 730
  ClientWidth = 945
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
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 6
    Top = 6
    Width = 662
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
      Left = 514
      Top = 9
      Width = 79
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
    end
    object Label2: TLabel
      Left = 212
      Top = 9
      Width = 69
      Height = 16
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
    end
    object cmbPedagogue: TComboBox
      Left = 14
      Top = 30
      Width = 173
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbAcademicYear: TComboBox
      Left = 514
      Top = 30
      Width = 127
      Height = 24
      Style = csDropDownList
      TabOrder = 1
    end
    object cmbEducationProgram: TComboBox
      Left = 212
      Top = 30
      Width = 280
      Height = 24
      Style = csDropDownList
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 6
    Top = 77
    Width = 524
    Height = 604
    TabOrder = 1
    object ListView1: TListView
      Left = 6
      Top = 6
      Width = 510
      Height = 569
      Columns = <
        item
          Caption = #8470
          Width = 40
        end
        item
          Caption = #1043#1088#1091#1087#1087#1072' / '#1091#1095#1072#1097#1080#1081#1089#1103
          Width = 190
        end
        item
          Caption = #1055#1088'-'#1084#1072
          Width = 65
        end
        item
          Caption = #1059#1088#1086#1074'.'
          Width = 45
        end
        item
          Caption = '1'
          Width = 28
        end
        item
          Caption = '2'
          Width = 28
        end
        item
          Caption = '3'
          Width = 28
        end
        item
          Caption = '4'
          Width = 28
        end
        item
          Caption = '5'
          Width = 28
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel3: TPanel
    Left = 536
    Top = 77
    Width = 394
    Height = 604
    TabOrder = 2
    object Panel4: TPanel
      Left = 6
      Top = 6
      Width = 379
      Height = 41
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 6
      Top = 86
      Width = 379
      Height = 41
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 352
      Top = 95
      Width = 25
      Height = 24
      TabOrder = 2
    end
    object Panel6: TPanel
      Left = 6
      Top = 133
      Width = 379
      Height = 41
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 352
      Top = 142
      Width = 25
      Height = 24
      TabOrder = 4
    end
    object Panel7: TPanel
      Left = 6
      Top = 180
      Width = 379
      Height = 41
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 352
      Top = 189
      Width = 25
      Height = 24
      TabOrder = 6
    end
    object Panel8: TPanel
      Left = 6
      Top = 227
      Width = 379
      Height = 41
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 7
    end
    object Edit4: TEdit
      Left = 352
      Top = 236
      Width = 25
      Height = 24
      TabOrder = 8
    end
    object Panel9: TPanel
      Left = 6
      Top = 274
      Width = 379
      Height = 41
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 9
    end
    object Edit5: TEdit
      Left = 352
      Top = 283
      Width = 25
      Height = 24
      TabOrder = 10
    end
    object Button1: TButton
      Left = 128
      Top = 328
      Width = 145
      Height = 26
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 11
    end
  end
  object Button2: TButton
    Left = 816
    Top = 696
    Width = 114
    Height = 26
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
  end
end
