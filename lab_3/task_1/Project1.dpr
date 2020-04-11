program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const n=100000000;
function f(x,y:real):real;
  begin
    f := (x * x) / (1 + (y * y));
  end;
var a,b,c,d,k,fc1,fc2,fc3,s,e,s1,s2,s0: real;
    i: integer;
    x: array [0..100000000] of real;
    y: array [0..100000000] of real;
    fs: array [0..100000000] of real;
begin
  a := 0;
  b := 1;
  c := 0;
  d := 3;
  randomize;

  for i := 1 to n do
    begin
      x[i] := 1 * random;
      y[i] := 3 * random;
      s1 := s1 + f(x[i], y[i]);
      s2 := s2 + (f(x[i], y[i]) * f(x[i],y[i]));
    end;
  fc1 := s1 / n;  //medium
   //witeln(fc1);
  fc3 := (b - a)*(d - c) * fc1;
  writeln('I = ',fc3);
  fc2 := s2 / n;
   //writeln(fc2);
  e := (b-a) * (d-c) * sqrt(((fc2) - (fc1 * fc1)) / n);
  writeln('e = ',e:5:3);
  readln;
end.





