program CursoFastReport;

uses
  Vcl.Forms,
  FastReport.Principal in 'FastReport.Principal.pas' {frmPrincipal},
  FastReport.Relatorios in 'FastReport.Relatorios.pas' {dmdRelatorios: TDataModule},
  FastReport.Preview in 'FastReport.Preview.pas' {frmPreview};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdRelatorios, dmdRelatorios);
  Application.Run;
end.
