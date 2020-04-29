unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Math;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const h=0.1;
      n=10;
      //Коэффициенты первого граничного условия
      g1=1;
      g2=-1.2;
      g3=1;
      //Коэффициенты второго граничного условия
      g4=3.75;
      g5=0.6;
      g6=4.7;
      b = 1.53;
      a = 1.38;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var p,q,r:array[0..n] of real;
    k,l:array[0..n] of real;
    y:array[0..n] of real;
    x:real;
    i:integer;
begin
  for i := 0 to n do
    begin
      x:=i*h;
      p[i]:=x/b + x*x;
      q[i]:=-(1+sin(x))/(sqrt(a*a + x*x));
      r[i]:=exp(a*x*x);
    end;
  //Прямой ход метода прогонки
  k[0]:=(Sqr(h)*r[0]*g2+h*(2-h*p[0])*g3)/((Sqr(h)*q[0]-2)*g2+h*(2-h*p[0])*g1);

  l[0]:=2*g2/((Sqr(h)*q[0]-2)*g2+h*(2-h*p[0])*g1);

  for i := 1 to n do
    begin
      k[i]:=(2*Sqr(h)*r[i]-(2-h*p[i])*k[i-1])/(2*Sqr(h)*q[i]-4-(2-h*p[i])*l[i-1]);

      l[i]:=(2+h*p[i])/(2*Sqr(h)*q[i]-4-(2-h*p[i])*l[i-1]);
    end;

  //Обратный ход метода прогонки
  y[n]:=(2*h*g6+(k[n-1]-k[n]/l[n])*g5)/(2*h*g4+(l[n-1]-1/l[n])*g5);

  for i := n-1 downto 0 do
    y[i]:=k[i]-l[i]*y[i+1];

  //Построение графика
  for i := 0 to n do
    begin
      x:=i*h;
      Chart1.Series[0].AddXY(x,y[i]);
    end;

end;

end.
