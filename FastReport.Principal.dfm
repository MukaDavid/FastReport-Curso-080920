object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 387
  ClientWidth = 669
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
end
