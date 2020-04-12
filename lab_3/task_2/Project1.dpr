program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  math;

function F(x:real):real;
  begin
    result := ((x*x) + 1)*sin(x-0/5);
  end;
var
  a,b,h,S,S1,e,x:real;
  N,i: integer;

begin
  a := 0.8;
  b := 1.6;
  N := 51;
  h := (b - a) / N;
  S := (F(a) + F(b)) / 2;

  for i := 1 to N - 1 do
    begin
      x := a + i*h;
      S := S + F(x);
    end;

  S := S*h;
  writeln('S = ', S:5:3);

  h := (b - a) / (2*N);
  S1 := (F(a) + F(b)) / 2;
  for i := 1 to N -1 do
    begin
      x := a + i*h;
      S1 := S1 + F(x);
    end;
  S1 := S1*h;
  e := (1/3) * (S1 - S);
  writeln('E = ', S:5:3);
  readln;
end.
