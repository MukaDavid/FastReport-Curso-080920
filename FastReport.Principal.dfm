object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 387
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 106
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object btnListagemColaboradores: TButton
    Left = 24
    Top = 32
    Width = 249
    Height = 25
    Caption = 'Listagem Colaboradores'
    TabOrder = 0
    OnClick = btnListagemColaboradoresClick
  end
  object btnRelatorioColaboradoresSalario: TButton
    Left = 24
    Top = 72
    Width = 249
    Height = 25
    Caption = 'Relatorio de Colaboradores e Sal'#225'rio'
    TabOrder = 1
    OnClick = btnRelatorioColaboradoresSalarioClick
  end
  object edtCidade: TEdit
    Left = 67
    Top = 103
    Width = 206
    Height = 21
    TabOrder = 2
    Text = 'Florian'#243'polis'
  end
  object cbxExportarPdf: TCheckBox
    Left = 281
    Top = 77
    Width = 97
    Height = 17
    Caption = 'Exportar Pdf'
    TabOrder = 3
  end
  object btnRelatorioVendas: TButton
    Left = 24
    Top = 160
    Width = 249
    Height = 25
    Caption = 'Relat'#243'rio de Vendas'
    TabOrder = 4
    OnClick = btnRelatorioVendasClick
  end
  object DBGrid1: TDBGrid
    Left = 456
    Top = 32
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 456
    Top = 208
    Width = 320
    Height = 120
    DataSource = DataSource2
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnRelatorioDepartamento: TButton
    Left = 24
    Top = 232
    Width = 249
    Height = 25
    Caption = 'Relatorio de Departamento'
    TabOrder = 7
    OnClick = btnRelatorioDepartamentoClick
  end
  object CheckBox1: TCheckBox
    Left = 144
    Top = 272
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 8
  end
  object DataSource1: TDataSource
    DataSet = dmdRelatorios.qryDepartament
    Left = 680
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = dmdRelatorios.qryEmployeeDept
    Left = 680
    Top = 232
  end
end
