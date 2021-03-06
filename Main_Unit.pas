unit Main_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons,DateUtils;

type
  TForm1 = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    TrackBar1: TTrackBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    AboutProgram1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    Edit1: TEdit;
    Label2: TLabel;
    Button5: TButton;
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    loaded:boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;
  BtmImgArr: array of TBitmap;
  BtmImgArr_Temp: array of TBitmap;
  FileCount:integer;
  timei: integer;


implementation

{$R *.dfm}

function Remap(sbm:TBitMap; pfNbit:TPixelFormat):TBitmap;
var dbm: TBitMap;
begin
  dbm := TBitmap.Create;
  dbm.Width  := sbm.Width ;
  dbm.Height := sbm.Height;
  dbm.PixelFormat := pfNbit;
  dbm.Canvas.Draw(0, 0, sbm);
  result:=dbm;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  timei:=0;
  TrackBar1.Enabled:=false;
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  if loaded then
    Image1.Picture.Bitmap:=BtmImgArr_Temp[TrackBar1.Position];
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if loaded then
    begin
          Image1.Picture.Bitmap:=BtmImgArr_Temp[TrackBar1.Position];
          //Image1.Picture.Bitmap.PixelFormat:=pf32bit;
          Image1.Canvas.Pen.Color:=clRed;
          Image1.Canvas.MoveTo(X,0);
          Image1.Canvas.LineTo(X,Image1.Height);
          Image1.Canvas.MoveTo(0,Y);
          Image1.Canvas.LineTo(Image1.Width,Y);
          image1.Canvas.TextOut(x+10,y-50, 'X: '+ IntToStr(X));
          image1.Canvas.TextOut(x+10,y-35, 'Y: '+ IntToStr(Y));
          image1.Canvas.TextOut(x+10,y-20, 'C: '+ IntToStr(BtmImgArr_Temp[TrackBar1.Position].Canvas.Pixels[x,y]));
    end;
end;

procedure TForm1.Open1Click(Sender: TObject);
var i,x,y: integer;
    time1,time2:extended;
    spb:PByteArray;
begin
  OpenDialog1.Options := [ofAllowMultiSelect, ofFileMustExist];
  OpenDialog1.Filter := 'BitMap (*.bmp)|*.bmp|All files (*.*)|*.*';
  if not OpenDialog1.Execute then Exit
  else
    begin
      time1:=now();
      SetLength(BtmImgArr, OpenDialog1.Files.Count);
      SetLength(BtmImgArr_Temp, OpenDialog1.Files.Count);
      FileCount:=OpenDialog1.Files.Count;
      for i := 0 to OpenDialog1.Files.Count - 1 do
        begin
          BtmImgArr[i] := TBitmap.Create;
          BtmImgArr_Temp[i] := TBitmap.Create;
          BtmImgArr[i].LoadFromFile(OpenDialog1.Files.Strings[i]);
          BtmImgArr_Temp[i].LoadFromFile(OpenDialog1.Files.Strings[i]);
          BtmImgArr_Temp[i]:=Remap(BtmImgArr_Temp[i],pf24bit);
        end;

      //////////////////////////////////////////////////////////////////////////////
      Image1.Height:=BtmImgArr[0].Height;
      Image1.Width:=BtmImgArr[0].Width;
      image1.Picture.Bitmap:=BtmImgArr[0];
      TrackBar1.Top:=Image1.Top+Image1.Height+6;
      TrackBar1.Width:=Image1.Width+16;
      TrackBar1.Max:=FileCount-1;
      Button1.Top:=TrackBar1.Top+32;
      Button2.Top:=TrackBar1.Top+32;
      Button3.Top:=TrackBar1.Top+32;
      Button4.Top:=TrackBar1.Top+32;
      Button5.Top:=TrackBar1.Top+32;
      Label2.Top:=TrackBar1.Top+37;
      Edit1.Top:=TrackBar1.Top+32;
      Form1.Width:= Image1.Left+Image1.Width+25;
      Form1.Height:= Button1.Top+105;
      Button1.Enabled:=true;
      Button2.Enabled:=true;
      Button3.Enabled:=true;
      Button4.Enabled:=true;
      TrackBar1.Enabled:=true;
      //////////////////////////////////////////////////////////////////////////////
      loaded:=True;
      TrackBar1.Enabled:=true;

      time2:= now();

      //ShowMessage('Time spend:'+inttostr(MilliSecondsBetween(Time2,time1))+'ms');
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Inc(timei);
  TrackBar1.Position:=timei;
  if TrackBar1.Position = TrackBar1.Max then
    TrackBar1.Position:=0;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[timei];
  Image1.Repaint;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  timei:=TrackBar1.Position;
  Image1.Picture.Bitmap:= BtmImgArr_temp[TrackBar1.Position];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TrackBar1.Position:=TrackBar1.Position-1;
  if TrackBar1.Position = 0 then
    TrackBar1.Position:=TrackBar1.Max;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[TrackBar1.Position];
  Image1.Repaint;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    exit;
  Timer1.Interval:= Round(1000/StrToInt(Edit1.Text));
  Timer1.Enabled:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Timer1.Enabled:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  TrackBar1.Position:=TrackBar1.Position+1;
  if TrackBar1.Position = TrackBar1.Max then
    TrackBar1.Position:=0;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[TrackBar1.Position];
  Image1.Repaint;
end;

procedure TForm1.Button5Click(Sender: TObject);
var time1,time2:extended;
    spb: PByteArray; // spb ?????? Source Pointer Byte, ????? ?????? ?? ????????
    dpb: PByteArray; // dpb ?????? Dest Pointer Byte, ????? ?????? ?? ????????
    x,y,i,t: integer;
begin
  time1:=now();
  for i := 0 to Length(BtmImgArr) - 1 do
        begin
          for y := 0 to BtmImgArr[i].Height-1 do
            begin
              BtmImgArr_Temp[i].Width:=BtmImgArr[i].Width;
              BtmImgArr_Temp[i].Height:=BtmImgArr[i].Height;
              spb:=BtmImgArr[i].ScanLine[y];
              dpb:= BtmImgArr_Temp[i].ScanLine[y];
              t:=0;
              for x:=0 to (BtmImgArr[i].Width-1) do
                begin
                  if spb^[x] = 0 then
                    begin
                      dpb^[t]:=0;
                      dpb^[t+1]:=0;                          //??????
                      dpb^[t+2]:=0;
                      t:=t+3;
                      continue;
                    end;
                  if spb^[x] = 255 then
                    begin
                      dpb^[t]:=255;
                      dpb^[t+1]:=255;                         //?????
                      dpb^[t+2]:=255;
                      t:=t+3;
                      continue;
                    end;
                  if (spb^[x]>0) and (spb^[x]<85) then
                    begin
                      dpb^[t]:=0;
                      dpb^[t+1]:=0;
                      dpb^[t+2]:=spb^[x]*3;
                      t:=t+3;
                      continue;
                    end;
                  if (spb^[x]>85) and (spb^[x]<170) then
                    begin
                      dpb^[t]:=0;
                      dpb^[t+1]:=(spb^[x]-85)*3;
                      dpb^[t+2]:=255;
                      t:=t+3;
                      continue;
                    end;
                  if (spb^[x]>170) and (spb^[x]<255) then
                    begin
                      dpb^[t]:=(spb^[x]-170)*3;
                      dpb^[t+1]:=255;
                      dpb^[t+2]:=255;
                      t:=t+3;
                      continue;
                    end;
                  t:=t+3;
                end;
            end;
        end;

  Image1.Picture.Bitmap:=BtmImgArr_Temp[TrackBar1.Position];
  Image1.Repaint;
  time2:=now();
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Edit1.Text = '' then
    exit;
  Timer1.Interval:= Round(1000/StrToInt(Edit1.Text));
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
