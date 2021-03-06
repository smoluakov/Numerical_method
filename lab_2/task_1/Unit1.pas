unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.Series,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    PlotPoints: TButton;
    Interpolate: TButton;
    Series1: TPointSeries;
    Series2: TLineSeries;
    Series3: TPointSeries;
    Label1: TLabel;
    Label2: TLabel;
    PrintValue: TButton;
    procedure PlotPointsClick(Sender: TObject);
    procedure InterpolateClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const n = 6;
x:array[0..6] of real = (1.8, 1.83, 1.86, 1.89, 1.92, 1.95, 1.98);
y:array[0..6] of real = (-3.1107, -2.5626, -2.1197, -1.7535, -1.4417, -1.1738, -0.9396);

implementation

{$R *.dfm}

function f(x1:real):real;
var
  i,j:integer;
  G: array [0..6, 0..6] of real;
  P:real;

begin
  for i := 0 to n do
    begin
      G[i,0] := y[i];
    end;
  for i := 1 to n do
    begin
      for j := 1 to i do
        begin
          G[i,j] := (G[i,j-1] - G[j-1, j-1]) / (x[i] - x[j-1]);
        end;
    end;

    P := G[n,n];

    for i := 1 to n do
      begin
        P := P * (x1 - x[n - i]) + G[n - i, n - i];
      end;

    f := P;
end;


procedure TForm1.PlotPointsClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to n do
    begin
      Chart1.Series[0].AddXY(x[i], y[i]);
    end;

end;

procedure TForm1.InterpolateClick(Sender: TObject);
var
  x1, e, f1: real;
begin
  x1 := 1.8;
  e := 0.0005;

  repeat
    f1 := f(x1);
    Chart1.Series[1].AddXY(x1, f1);
    x1 := x1 + e;
  until x1 > 1.98;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Chart1.Series[2].AddXY(1.87, f(1.87));
  Chart1.Series[2].AddXY(1.93, f(1.93));
  Label1.Caption := Label1.Caption + FloatToStrF(f(1.87), ffFixed,4,4);
  Label2.Caption := Label2.Caption + FloatToStrF(f(1.93), ffFixed,4,4);
end;

End.
