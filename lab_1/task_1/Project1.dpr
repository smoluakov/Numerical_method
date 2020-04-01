program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  l,i,k,j,m,n:integer;
  g,s:real;
  x,y,f,f0:array [1..4] of real;
  c,a,a0: array [1..4, 1..4] of real;


begin
  m := 4;
  a[1][1]:=8;
  a[1][2]:=-2;
  a[1][3]:=-14;
  a[1][4]:=4;
  a[2][1]:=3;
  a[2][2]:=8;
  a[2][3]:=-2;
  a[2][4]:=-13;
  a[3][1]:=14;
  a[3][2]:=2;
  a[3][3]:=2;
  a[3][4]:=0;
  a[4][1]:=-6;
  a[4][2]:=0;
  a[4][3]:=4;
  a[4][4]:=-10;

  f[1]:=-104;
  f[2]:=-154;
  f[3]:=-162;
  f[4]:=-28;


  for I := 1 to m do
   begin
     f0[i] := f[i];
     for J := 1 to m do
       begin
         a0[i,j] := a[i,j];
       end;
   end;

  writeln('Исходная матрица');
  for i := 1 to m do
    begin
      for j := 1 to m do
        write(a[i][j]:8:0);
        writeln;
    end;


  for k := 1 to m do
    begin
      l := k;
      for n := k + 1 to m do
        begin
          if (abs(a[n][k]) > abs(a[l][k])) then
            l := n;
        end;

        if (l <> k) then
          begin
            for j := k to m do
              begin
                g := a[k][j];
                a[k][j] := a[l][j];
                a[l][j] := g;
              end;

              g := f[k];
              f[k] := f[l];
              f[l] := g;
          end;

      y[k] := f[k] / a[k][k];
      for j := k + 1 to m do
        begin
          c[k][j] := a[k][j] / a[k][k];
          for i := k + 1 to m do
            begin
              a[i][j] := a[i][j] - (a[i][k] * c[k][j]);
            end;

            f[j] := f[j] - (a[j][k] * y[k]);
        end;
    end;

  writeln('Треугольная');
  for I := 1 to m do
   begin
     c[i,i] := 1;
     for J := 1 to m do
       begin
         write(c[i][j]:7:2);
       end;
     writeln;
   end;
   writeln;


   x[m] := y[m];
   for k := m-1 downto 1 do
     begin
       s := 0;
       for j := k + 1 to m do
         begin
           s := s + c[k][j] * x[j];
         end;

         x[k] := y[k] - s;
     end;

  writeln('Правая часть');
  for i := 1 to m do
    begin
      writeln(y[i]:5:2);
    end;


  writeln('Корни ');
  for i := 1 to m do
   begin
     writeln(x[i]:5:2);
   end;


  writeln('Ошибки');   //вектор невязки
  for I := 1 to m do
    begin
      s := 0;
      for j := 1 to m do
        begin
          s := s + a0[i,j]*x[j]
        end;
      s := s - f0[i];
      writeln(s:5:5);
    end;


  readln;
end.

