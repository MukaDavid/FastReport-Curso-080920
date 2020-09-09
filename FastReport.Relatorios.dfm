object dmdRelatorios: TdmdRelatorios
  OldCreateOrder = False
  Height = 273
  Width = 420
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Program Files (x86)\Firebird\Firebird_2_5\examples\e' +
        'mpbuild\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object qryEmployee: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'Select *'
      'from Employee')
    Left = 128
    Top = 24
  end
  object frxReport1: TfrxReport
    Version = '6.7.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44082.898773784700000000
    ReportOptions.LastChange = 44082.948739155090000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 40
    Top = 136
  end
  object frxDBEmployee: TfrxDBDataset
    UserName = 'frxDBEmployee'
    CloseDataSource = False
    DataSet = qryEmployee
    BCDToCurrency = False
    Left = 124
    Top = 136
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 216
    Top = 136
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 40
    Top = 208
  end
end
