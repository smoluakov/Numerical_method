program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
m,e,kmax,s:double;
a,a0: array [1..4,1..4] of real;
f,x,y,f0: array [1..4] of real;
i,j,k: integer;
begin
  a[1][1] := 10;
  a[1][2] := -2.4;
  a[1][3] := 4.8;
  a[1][4] := 2.3;
  a[2][1] := 0.5;
  a[2][2] := 11;
  a[2][3] := -4.4;
  a[2][4] := -3.1;
  a[3][1] := 1;
  a[3][2] := -0.3;
  a[3][3] := 9;
  a[3][4] := 5.5;
  a[4][1] := -1.2;
  a[4][2] := 0.7;
  a[4][3] := -1.1;
  a[4][4] := 10;

  f[1] := -5.5;
  f[2] := 21.4;
  f[3] := -77.9;
  f[4] := -48.4;

  k := 1;
  kmax := 1000;
  e := 0.0001;

  for i := 1 to 4 do
   begin
     f0[i] := f[i];
     for j := 1 to 4 do
       begin
         a0[i,j] := a[i,j];
       end;
   end;


  writeln('�������� �������');
  for i := 1 to 4 do
    begin
      for j := 1 to 4 do
        write(a[i][j]:7:1);
        writeln;
    end;

  for i := 1 to 4 do
    begin
      x[i] := f[i] / a[i][i];
    end;

  while k <= kmax do
    begin
      m := 0;
      for i := 1 to 4 do
        begin
          s := 0;
          for j := 1 to 4 do
            begin
              s := s + a[i][j] * x[j];
            end;

          y[i] := x[i] + (f[i] -s) / a[i][i];
          if abs(x[i] - y[i]) > m then
            m := abs(x[i] - y[i]);
            x[i] := y[i];
        end;
      if (m <= e) then
        break;
        inc(k);
    end;

  if k >= kmax then writeln('�������� ����������')
  else
    begin
      writeln('������-������� �������');
      for i := 1 to 4 do
        begin
          writeln('x[',i, '] = ',x[i]:2:2);
        end;
    end;

  writeln('������ �������');
  for I := 1 to 4 do
    begin
      s := 0;
      for j := 1 to 4 do
        begin
          s := s + a0[i,j]*x[j]
        end;
      s := s - f0[i];
      writeln(abs(s):8:5);
    end;



  writeln('k = ', k);
  writeln('e = ', e:2:4);
  readln;
end.
