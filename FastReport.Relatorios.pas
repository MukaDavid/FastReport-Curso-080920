unit FastReport.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, frxClass,
  frxDBSet, frxExportBaseDialog, frxExportPDF, frxExportRTF, Winapi.Windows;

type
  TdmdRelatorios = class(TDataModule)
    FDConnection1: TFDConnection;
    qryEmployee: TFDQuery;
    frxReport1: TfrxReport;
    frxDBEmployee: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
  private
    { Private declarations }
  public
    procedure PreviewListagemColaboradores;
    procedure PreviewRelatorioColaboradoresSalario(pCidade: string);
    procedure ExportRelatorioColaboradoresSalario(pCidade: string);

    { Public declarations }
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdRelatorios }

procedure TdmdRelatorios.ExportRelatorioColaboradoresSalario(pCidade: string);
begin
  frxReport1.LoadFromFile('..\..\RelatorioColaboradoresSalario.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);

  frxPDFExport1.FileName := 'RelatorioColaboradoresSalario.pdf';
  frxPDFExport1.ShowDialog := False;

  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);


  WinExec('C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe RelatorioColaboradoresSalario.pdf',SW_SHOWNORMAL);

end;

procedure TdmdRelatorios.PreviewListagemColaboradores;
begin
  frxReport1.LoadFromFile('..\..\ListagemColaboradores.fr3');
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioColaboradoresSalario(pCidade: string);
begin
  frxReport1.LoadFromFile('..\..\RelatorioColaboradoresSalario.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  frxReport1.ShowReport;
end;

end.
