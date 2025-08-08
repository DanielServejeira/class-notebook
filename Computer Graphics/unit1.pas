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
    Label1: TLabel;
    Label2: TLabel;
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
    operation: Integer;
    draw: boolean;
  end;

var
  Form1: TForm1;

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
     if(operation = 2) then Image1.Canvas.LineTo[X,Y];
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if(operation = 1) and (draw = true) then Image1.Canvas.Pixels[X,Y] := clred;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if(operation = 1) then draw := false;
     if(operation = 2) then
     begin
       Image1.Canvas.Pen.Color := clred;
       Image1.Canvas.LineTo[X,Y];
     end;
end;

end.

