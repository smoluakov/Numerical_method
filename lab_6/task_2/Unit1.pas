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
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const h=0.1;
      tau=0.05;
      a=0.25;  //tau^2/h^2
      n=10;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function f(x1,t1:real):real;
begin
  f:=(1.3*t1 - 1)/(1+Sqr(-2.55)*Sqr(x1));
end;

function m1(t1:real):real;
begin
  m1:=-1.6+Sin(Pi*t1);
end;

function m2(t1:real):real;
begin
  m2:=-1.6+Power(t1,3);
end;

function Phi(x1:real):real;
begin
  Phi:=Sqr(x1)-x1-1.6;
end;

function Psi(x1:real):real;
begin
  Psi:=2.56+Exp(1.89*x1);
end;

procedure TForm1.Button1Click(Sender: TObject);
var x,t:array[0..n] of real;
    U:array[0..n,0..n] of real;
    i,k:integer;

begin
  for i := 0 to n do
    for k := 0 to n do
        U[i,k]:=0;

  for i := 0 to n do
    begin
      x[i]:=i*h;
      t[i]:=i*tau;
      U[0,i]:=m1(t[i]);
      U[n,i]:=m2(t[i]);
      U[i,0]:=Phi(x[i]);                                                                                // на нулевом временном слое
    end;

  for i := 1 to n-1 do
     U[i,1]:=U[i,0]+tau*Psi(x[i]);                                                                        // на первом слое

  for k := 1 to n-1 do
    for i := 1 to n-1 do
      U[i,k+1]:=a*(U[i+1,k]+U[i-1,k])+2*(1-a)*U[i,k]-U[i,k-1]+Sqr(tau)*f(x[i],t[k]);                      // для всех

  for i := 0 to n do
    begin
      Chart1.Series[0].AddXY(x[i],U[i,0]);
      Chart1.Series[2].AddXY(x[i],U[i,5]);
      Chart1.Series[1].AddXY(x[i],U[i,n]);
    end;

end;

end.
