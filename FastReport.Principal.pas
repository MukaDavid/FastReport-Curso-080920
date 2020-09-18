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
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    OpenDialog1: TOpenDialog;
    btnAbrirRelatório: TButton;
    btnBiolife: TButton;
    chxMostraChild: TCheckBox;
    btnDesignRelatorio: TButton;
    Button1: TButton;
    procedure btnListagemColaboradoresClick(Sender: TObject);
    procedure btnRelatorioColaboradoresSalarioClick(Sender: TObject);
    procedure btnRelatorioVendasClick(Sender: TObject);
    procedure btnRelatorioDepartamentoClick(Sender: TObject);
    procedure btnAbrirRelatórioClick(Sender: TObject);
    procedure btnBiolifeClick(Sender: TObject);
    procedure btnDesignRelatorioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnAbrirRelatórioClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    dmdRelatorios.PreviewRelatorioArquivo(OpenDialog1.FileName);
  end;
end;

procedure TfrmPrincipal.btnBiolifeClick(Sender: TObject);
begin
  dmdRelatorios.PreviewRelatorioBiolife(chxMostraChild.Checked);
end;

procedure TfrmPrincipal.btnDesignRelatorioClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    dmdRelatorios.DesignRelatorioArquivo(OpenDialog1.FileName);
  end;
end;

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

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  //dmdRelatorios.PreviewCadastroSemDB;
  dmdRelatorios.PreviewGenerico(dmdRelatorios.qryCountry);
end;

end.
