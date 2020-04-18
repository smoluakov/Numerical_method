unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Math;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Button1: TButton;
    Series1: TLineSeries;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function f(x,y:real):real;
  begin
    f := (9*sqr(x)*y) + (power(x,5)+sqr(x))*power(y, 2/3);
  end;

var
  k1,k2,k3,k4,y0,x0,xmax,dx,x,y1: real;

procedure TForm1.Button1Click(Sender: TObject);
begin
  dx := 0.001;
  xmax := 1;
  x0 := 0.1;
  y0 := 0.1;
  while x0 <= xmax do
    begin
      k1 := f(x0, y0);
      k2 := f(x0+dx/3, y0+k1*dx/3);
      k3 := f(x0+dx/3, y0+k2*dx/3);
      k4 := f(x0+dx, y0+k3*dx);
      y1 := y0+dx*(k1 + 3*k2 + 3*k3 + k4)/8;
      y0 := y1;
      x0 := x0 + dx;
      Chart1.Series[0].AddXY(x0,y0);
    end;
end;

end.
