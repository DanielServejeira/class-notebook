unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    XLabel: TLabel;
    YLabel: TLabel;
    XValue: TLabel;
    YValue: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuDrawPixel: TMenuItem;
    MenuDrawLine: TMenuItem;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuDrawPixelClick(Sender: TObject);
    procedure MenuDrawLineClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  operation: Integer;
  draw: boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuDrawPixelClick(Sender: TObject);
begin
  operation := 1; //draw pixels on the image
end;

procedure TForm1.MenuDrawLineClick(Sender: TObject);
begin
  operation := 2; //draw lines on the image
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if(operation = 1) then draw := true;
     if(operation = 2) then Image1.Canvas.LineTo(X,Y);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if(operation = 1) and (draw = true) then Image1.Canvas.Pixels[X,Y] := clred;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     Image1.Canvas.Pen.Color := clred;

     if(operation = 1) then draw := false;
     if(operation = 2) then
     begin

       Image1.Canvas.LineTo(X,Y);

       if(x1 < x2) then inc = 1
       else inc = -1;

       x=x1;
       y=y1;
       while (x <> x2) do
       begin
         y = m(x-x1)+y1;
         Image1.Canvas.Pixels(X,Y);
         x = x+inc;
       end;
     end;
end;

end.

