unit FastReport.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, frxClass,
  frxDBSet, frxExportBaseDialog, frxExportPDF, frxExportRTF, Winapi.Windows, Datasnap.DBClient, frxPreview,
  frxDBXComponents, midaslib, Data.DBXFirebird, Data.SqlExpr, frxDCtrl, frxCrypt, frxDesgn, FastReport.Preview,
  Vcl.Forms, Vcl.Dialogs, ConverterQR2FR;

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
    frxDBXComponents1: TfrxDBXComponents;
    frxDesigner1: TfrxDesigner;
    FDMemPessoa: TFDMemTable;
    FDMemPessoaCodigo: TIntegerField;
    FDMemPessoaNome: TStringField;
    FDMemPessoaEndereco: TStringField;
    fxrDBMemPessoa: TfrxDBDataset;
    frxDBGenerico: TfrxDBDataset;
    qryCountryCOUNTRY: TStringField;
    qryCountryCURRENCY: TStringField;
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
    procedure DesignRelatorioArquivo(pNomeArquivo: String; pCidade: string = '');
    procedure PreviewRelatorioBiolife(pMostraChild: boolean);
    procedure PreviewCadastroSemDB;
    procedure PreviewRelPessoa;
    procedure PreviewGenerico(pDataset: TDataSet);

    { Public declarations }
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdRelatorios }

procedure TdmdRelatorios.DesignRelatorioArquivo(pNomeArquivo, pCidade: string);
begin

  frxReport1.LoadFromFile(pNomeArquivo);
  frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
  //frxReport1.ShowReport;
  //frxReport1.PrepareReport;
  frxReport1.DesignReport;
  frxReport1.ShowReport;
end;

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

procedure TdmdRelatorios.PreviewCadastroSemDB;
begin
  frxReport1.LoadFromFile('..\..\RelCadastroSemDB.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr('Floripa');
  TfrxMemoView(frxReport1.FindObject('memCodigo')).Text := '0001';
  TfrxMemoView(frxReport1.FindObject('memNome')).Text := 'Samuel David';
  TfrxMemoView(frxReport1.FindObject('memEndereco')).Text := 'Rua das Nações, 1234, Florianópolis';
  frxReport1.ShowReport;
end;

procedure TdmdRelatorios.PreviewGenerico(pDataset: TDataSet);
var
  li: Integer;
  lfrxMemoView: TfrxMemoView;
  lfrxHeader: TfrxHeader;
  lfrxMasterData: TfrxMasterData;
  lpos: Extended;
begin
  frxReport1.LoadFromFile('..\..\RelGenerico.fr3');
  //frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);

  lfrxHeader := TfrxHeader(frxReport1.FindObject('Header1'));

  frxDBGenerico.DataSet := pDataset;
  //frxDBGenerico.GetData;

  lfrxMasterData := TfrxMasterData(frxReport1.FindObject('MasterDataBand'));
  lfrxMasterData.DataSetName := 'frxDBGenerico';

  lpos:=10;
  for li := 0 to pDataset.FieldCount - 1 do
  begin
    lfrxMemoView := TfrxMemoView.Create(lfrxHeader);
    lfrxMemoView.SetBounds(lpos, 0, pDataset.Fields[li].DisplayWidth * 10, 20);
    lfrxMemoView.Text :=  pDataset.Fields[li].DisplayName;

    lfrxMemoView := TfrxMemoView.Create(lfrxMasterData);
    lfrxMemoView.SetBounds(lpos, 0, pDataset.Fields[li].DisplayWidth * 10, 20);
    lfrxMemoView.DataSetName := 'frxDBGenerico';
    lfrxMemoView.DataField := pDataset.Fields[li].FieldName;

    lpos := lpos + (pDataset.Fields[li].DisplayWidth * 10) + 10;
  end;




  frxReport1.ShowReport;
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
var
  lfrmPreview: TfrmPreview;
  lfrxPreview: TForm;
begin
  lfrmPreview := TfrmPreview.Create(Self);
  try
    frxReport1.LoadFromFile(pNomeArquivo);
    frxReport1.Report.Variables['Cidade'] := QuotedStr(pCidade);
    //frxReport1.Preview := lfrmPreview.frxPreview1;
    lfrxPreview := frxReport1.PreviewForm;
    frxReport1.ShowReport;
    lfrmPreview.ShowModal;
  finally
    lfrmPreview.Free;
  end;



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

procedure TdmdRelatorios.PreviewRelPessoa;
begin
  FDMemPessoa.Close;
  FDMemPessoa.CreateDataSet;

  FDMemPessoa.Append;
  FDMemPessoaCodigo.AsInteger := 1;
  FDMemPessoaNome.AsString := 'Samuel David';
  FDMemPessoaEndereco.AsString := 'Rua das Nações, 1234, Florianópolis';
  FDMemPessoa.Post;

  FDMemPessoa.Append;
  FDMemPessoaCodigo.AsInteger := 2;
  FDMemPessoaNome.AsString := 'Alvaro Almeida';
  FDMemPessoaEndereco.AsString := 'Rua 7 de Setembro, 5478, Rio de Janeiro';
  FDMemPessoa.Post;



  frxReport1.LoadFromFile('..\..\RelPessoa.fr3');
  frxReport1.Report.Variables['Cidade'] := QuotedStr('Floripa');
  frxReport1.ShowReport;

  FDMemPessoa.Close;
end;

end.
