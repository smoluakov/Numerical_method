unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const h=0.08;
      l=0.08;
      n=10;
      eps=0.0001;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Uy0(x:real):real;
  begin
    Uy0:= Sqr(x);
  end;

function Uy1(x:real):real;
  begin
    Uy1:=sqr(x) + 0.64;
  end;

function Ux0(y:real):real;
  begin
    Ux0:=sqr(y);
  end;

function Ux1(y:real):real;
  begin
    Ux1:= sqr(y) + 0.64;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var U:array[0..n,0..n] of real;
    i,j:integer;
    Uk,M:real;
    x,y:real;
    t:real;
begin
  t:=sqr(h)/sqr(l);
  for i := 0 to n do
    for j:= 0 to n do
      U[i,j]:=0;

  for i := 0 to n do
    begin
      x:=i*h;
      y:=i*l;
      U[i,0]:=Uy0(x);
      U[i,n]:=Uy1(x);
      U[0,i]:=Ux0(y);
      U[n,i]:=Ux1(y);
    end;

  repeat
    M:=0;
    for i := 1 to n-1 do
      for j:= 1 to n-1 do
        begin
            Uk:=U[i,j];
            U[i,j]:=(U[i+1,j]+U[i-1,j]+t*(U[i,j+1]+U[i,j-1]))/(2+2*t);
            if Abs(U[i,j]-Uk)>=M then M:=Abs(U[i,j]-Uk);                     //отклонение на соседих шагах было < eps
        end;
  until M<eps;


  for i := 1 to n+1 do
    for j := 1 to n+1 do
      StringGrid1.Cells[i,j]:=FloatToStrF(U[j-1,i-1],FFfixed,4,4);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    xy:real;
begin
  StringGrid1.Cells[0,0]:='X  /  Y';
  xy:=0;
  for i := 1 to n+1 do
    begin
      StringGrid1.Cells[i,0]:=FloatToStr(xy);
      xy:=xy+l;
    end;
  xy:=0;
  for i := 1 to n+1 do
    begin
      StringGrid1.Cells[0,i]:=FloatToStr(xy);
      xy:=xy+h;
    end;
end;

end.
