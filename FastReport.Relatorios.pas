unit FastReport.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, frxClass,
  frxDBSet, frxExportBaseDialog, frxExportPDF, frxExportRTF, Winapi.Windows, Datasnap.DBClient,
  frxDBXComponents, midaslib, Data.DBXFirebird, Data.SqlExpr, frxDCtrl;

type
  TdmdRelatorios = class(TDataModule)
    FDConnection1: TFDConnection;
    qryEmployee: TFDQuery;
    frxReport1: TfrxReport;
    frxDBEmployee: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    qrySales: TFDQuery;
    frxDBSales: TfrxDBDataset;
    qryDepartament: TFDQuery;
    qryEmployeeDept: TFDQuery;
    dscDepartament: TDataSource;
    frxDBDepartament: TfrxDBDataset;
    frxDBEmployeeDept: TfrxDBDataset;
    cdsBiolife: TClientDataSet;
    frxDBBiolife: TfrxDBDataset;
    qryCountry: TFDQuery;
    qryEmployeeCountry: TFDQuery;
    qrySalesCountry: TFDQuery;
    dscCountry: TDataSource;
    frxDBCountry: TfrxDBDataset;
    frxDBEmployeeCountry: TfrxDBDataset;
    frxDBSalesCountry: TfrxDBDataset;
    frxDialogControls1: TfrxDialogControls;
  private
    const CIDADE = 'Florianópolis';
    { Private declarations }
  public
    procedure PreviewListagemColaboradores(pCidade: string);
    procedure PreviewRelatorioColaboradoresSalario(pCidade: string);
    procedure ExportRelatorioColaboradoresSalario(pCidade: string);
    procedure PreviewRelatorioVendas;
    procedure PreviewRelatorio(pNomeRelatotio: String; pCidade: string = '');
    procedure PreviewRelatorioDepartamento(bAnalitico: Boolean);
    procedure PreviewRelatorioArquivo(pNomeArquivo: String; pCidade: string = '');
    procedure PreviewRelatorioBiolife(pMostraChild: boolean);


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
  frxReport1.LoadFromFile('..\..\RelatorioColaboradoresSalario2.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);

  frxPDFExport1.FileName := 'RelatorioColaboradoresSalario.pdf';
  frxPDFExport1.ShowDialog := False;

  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);


  WinExec('C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe RelatorioColaboradoresSalario.pdf',SW_SHOWNORMAL);

end;

procedure TdmdRelatorios.PreviewListagemColaboradores(pCidade: string);
begin
  frxReport1.LoadFromFile('..\..\ListagemColaboradores.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorio(pNomeRelatotio, pCidade: string);
begin
  frxReport1.LoadFromFile('..\..\'+pNomeRelatotio+'.fr3');
  if pCidade = '' then
    pCidade := CIDADE;
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioArquivo(pNomeArquivo, pCidade: string);
begin
  frxReport1.LoadFromFile(pNomeArquivo);
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioBiolife(pMostraChild: boolean);
begin
  frxReport1.LoadFromFile('..\..\RelBiolife.fr3');

  TfrxDetailData(frxReport1.FindObject('DetailData')).OnBeforePrint := '';

  //frxReport1.ScriptText :=


  frxReport1.Report.Variables['Cidade'] := QuotedStr(CIDADE);
  if pMostraChild then
    frxReport1.Report.Variables['MostraChild'] := QuotedStr('S')
  else
    frxReport1.Report.Variables['MostraChild'] := QuotedStr('N');
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioColaboradoresSalario(pCidade: string);
begin
  frxReport1.LoadFromFile('..\..\RelatorioColaboradoresSalario2.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioDepartamento(bAnalitico: Boolean);
begin
  frxReport1.LoadFromFile('..\..\RelatorioDepartamento.fr3');

  TfrxDetailData(frxReport1.FindObject('DetailData')).Visible := bAnalitico;
  TfrxHeader(frxReport1.FindObject('Header')).Visible := bAnalitico;
  TfrxFooter(frxReport1.FindObject('Footer')).Visible := bAnalitico;
  TfrxMemoView(frxReport1.FindObject('memSalarioTotal')).Visible := not bAnalitico;


  if not bAnalitico then
    frxReport1.Report.Variables['Sintetico'] := QuotedStr('S')
  else
    frxReport1.Report.Variables['Sintetico'] := QuotedStr('');

  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewRelatorioVendas;
begin
  frxReport1.LoadFromFile('..\..\RelatorioVendas.fr3');
  frxReport1.ShowReport;
end;

end.
