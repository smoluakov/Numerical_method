object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 489
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 511
    Top = 266
    Width = 49
    Height = 23
    Caption = 'x=0.4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 583
    Top = 266
    Width = 43
    Height = 23
    Caption = 'f(x)='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 511
    Top = 303
    Width = 49
    Height = 23
    Caption = 'x=1.1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 583
    Top = 303
    Width = 43
    Height = 23
    Caption = 'f(x)='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 497
    Height = 473
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPointSeries
      ClickableLine = False
      Pointer.Brush.Color = clBlue
      Pointer.HorizSize = 5
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 5
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      SeriesColor = clRed
      LinePen.Color = clRed
      LinePen.Width = 2
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series3: TPointSeries
      Legend.Text = #1047#1085#1072#1095#1077#1085#1080#1103' '#1080#1089#1093#1086#1076#1085#1086#1081' '#1092#1091#1085#1082#1094#1080#1080
      Legend.Visible = False
      LegendTitle = #1047#1085#1072#1095#1077#1085#1080#1103' '#1080#1089#1093#1086#1076#1085#1086#1081' '#1092#1091#1085#1082#1094#1080#1080
      ShowInLegend = False
      ClickableLine = False
      Pointer.Brush.Color = clLime
      Pointer.HorizSize = 5
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 5
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button1: TButton
    Left = 511
    Top = 8
    Width = 214
    Height = 89
    Caption = 'Plot Dots'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 511
    Top = 198
    Width = 214
    Height = 62
    Caption = 'Print Values'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 511
    Top = 103
    Width = 214
    Height = 89
    Caption = 'Interpolate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
end
