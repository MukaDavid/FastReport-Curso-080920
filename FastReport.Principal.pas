unit FastReport.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FastReport.Relatorios;

type
  TfrmPrincipal = class(TForm)
    btnListagemColaboradores: TButton;
    btnRelatorioColaboradoresSalario: TButton;
    edtCidade: TEdit;
    Label1: TLabel;
    cbxExportarPdf: TCheckBox;
    procedure btnListagemColaboradoresClick(Sender: TObject);
    procedure btnRelatorioColaboradoresSalarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnListagemColaboradoresClick(Sender: TObject);
begin
  dmdRelatorios.PreviewListagemColaboradores;
end;

procedure TfrmPrincipal.btnRelatorioColaboradoresSalarioClick(Sender: TObject);
begin
  if cbxExportarPdf.Checked then
    dmdRelatorios.ExportRelatorioColaboradoresSalario(edtCidade.Text)
  else
    dmdRelatorios.PreviewRelatorioColaboradoresSalario(edtCidade.Text);
end;

end.
