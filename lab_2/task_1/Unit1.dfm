object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 487
  ClientWidth = 753
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
    Left = 560
    Top = 8
    Width = 47
    Height = 13
    Caption = 'F(1.87) ='
  end
  object Label2: TLabel
    Left = 560
    Top = 103
    Width = 50
    Height = 13
    Caption = 'F(1.93) = '
  end
  object Chart1: TChart
    Left = 8
    Top = 0
    Width = 488
    Height = 330
    Title.Text.Strings = (
      'TChart')
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPointSeries
      ClickableLine = False
      Pointer.Draw3D = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series3: TPointSeries
      ClickableLine = False
      Pointer.Draw3D = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object PlotPoints: TButton
    Left = 8
    Top = 352
    Width = 113
    Height = 49
    Caption = 'PlotPoints'
    TabOrder = 1
    OnClick = PlotPointsClick
  end
  object Interpolate: TButton
    Left = 192
    Top = 352
    Width = 113
    Height = 49
    Caption = 'Interpolate'
    TabOrder = 2
    OnClick = InterpolateClick
  end
  object PrintValue: TButton
    Left = 383
    Top = 352
    Width = 113
    Height = 49
    Caption = 'PrintValue'
    TabOrder = 3
    OnClick = Button3Click
  end
end
