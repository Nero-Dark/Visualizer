program VIsualisator;

uses
  Vcl.Forms,
  Main_Unit in 'Main_Unit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
