unit FastReport.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FastReport.Relatorios, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    btnListagemColaboradores: TButton;
    btnRelatorioColaboradoresSalario: TButton;
    edtCidade: TEdit;
    Label1: TLabel;
    cbxExportarPdf: TCheckBox;
    btnRelatorioVendas: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    btnRelatorioDepartamento: TButton;
    CheckBox1: TCheckBox;
    procedure btnListagemColaboradoresClick(Sender: TObject);
    procedure btnRelatorioColaboradoresSalarioClick(Sender: TObject);
    procedure btnRelatorioVendasClick(Sender: TObject);
    procedure btnRelatorioDepartamentoClick(Sender: TObject);
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
  //dmdRelatorios.PreviewListagemColaboradores(edtCidade.Text);
  dmdRelatorios.PreviewRelatorio('ListagemColaboradores');
end;

procedure TfrmPrincipal.btnRelatorioColaboradoresSalarioClick(Sender: TObject);
begin
  if cbxExportarPdf.Checked then
    dmdRelatorios.ExportRelatorioColaboradoresSalario(edtCidade.Text)
  else
    dmdRelatorios.PreviewRelatorioColaboradoresSalario(edtCidade.Text);
end;

procedure TfrmPrincipal.btnRelatorioDepartamentoClick(Sender: TObject);
begin
  dmdRelatorios.PreviewRelatorio('RelatorioDepartamento');
end;

procedure TfrmPrincipal.btnRelatorioVendasClick(Sender: TObject);
begin
  //dmdRelatorios.PreviewRelatorio('RelatorioVendas');
  //dmdRelatorios.PreviewRelatorioVendas;

  dmdRelatorios.PreviewRelatorioDepartamento(CheckBox1.Checked);
end;

end.
