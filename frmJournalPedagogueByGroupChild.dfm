object fJournalPedagogueByGroupChild: TfJournalPedagogueByGroupChild
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1076#1072#1075#1086#1075#1072
  ClientHeight = 563
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 106
  TextHeight = 18
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 505
    Align = alTop
    TabOrder = 0
    DesignSize = (
      963
      505)
    object Panel1: TPanel
      Left = 6
      Top = 8
      Width = 950
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = #1060#1048#1054' '#1087#1077#1076#1072#1075#1086#1075#1072', '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076', '#1084#1077#1089#1103#1094' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 6
      Top = 47
      Width = 950
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Caption = ' '#1059#1095#1072#1097#1080#1081#1089#1103'/'#1075#1088#1091#1087#1087#1072', '#1087#1088#1086#1075#1088#1072#1084#1084#1072', '#1091#1088#1086#1074#1077#1085#1100'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object ListView1: TListView
      Left = 6
      Top = 86
      Width = 950
      Height = 379
      Anchors = [akLeft, akTop, akRight]
      Columns = <
        item
          Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          Caption = #1044'/'#1085
          Width = 60
        end
        item
          Caption = #1063#1072#1089#1086#1074
          Width = 60
        end
        item
          Caption = #1058#1077#1084#1072' '#1079#1072#1085#1103#1090#1080#1103' / '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 740
        end>
      GridLines = True
      ReadOnly = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
end
