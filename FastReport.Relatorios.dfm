object dmdRelatorios: TdmdRelatorios
  OldCreateOrder = False
  Height = 358
  Width = 535
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
    ParentReport = 'RelatorioBase.fr3'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44084.918294004600000000
    ReportOptions.LastChange = 44084.957575428240000000
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
    Left = 40
    Top = 216
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
    Top = 272
  end
  object qrySales: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from Sales'
      'order by ORDER_STATUS, PO_NUMBER')
    Left = 216
    Top = 24
  end
  object frxDBSales: TfrxDBDataset
    UserName = 'frxDBSales'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PO_NUMBER=PO_NUMBER'
      'CUST_NO=Codigo'
      'SALES_REP=SALES_REP'
      'ORDER_STATUS=STATUS'
      'ORDER_DATE=ORDER_DATE'
      'SHIP_DATE=SHIP_DATE'
      'DATE_NEEDED=DATE_NEEDED'
      'PAID=PAID'
      'QTY_ORDERED=QTY_ORDERED'
      'TOTAL_VALUE=TOTAL_VALUE'
      'DISCOUNT=DISCOUNT'
      'ITEM_TYPE=ITEM_TYPE'
      'AGED=AGED')
    DataSet = qrySales
    BCDToCurrency = False
    Left = 214
    Top = 136
  end
  object qryDepartament: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select d.*, '
      '  (select sum(e.SALARY) '
      '  from EMPLOYEE e'
      '  where e.DEPT_NO = d.DEPT_NO)'
      'as SALARY_TOTAL'
      'from department d')
    Left = 312
    Top = 24
  end
  object qryEmployeeDept: TFDQuery
    Active = True
    MasterSource = dscDepartament
    MasterFields = 'DEPT_NO'
    DetailFields = 'DEPT_NO'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select *'
      'from EMPLOYEE '
      'where DEPT_NO = :DEPT_NO')
    Left = 416
    Top = 24
    ParamData = <
      item
        Name = 'DEPT_NO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
        Value = '200'
      end>
  end
  object dscDepartament: TDataSource
    DataSet = qryDepartament
    Left = 360
    Top = 72
  end
  object frxDBDepartament: TfrxDBDataset
    UserName = 'frxDBDepartament'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DEPT_NO=DEPT_NO'
      'DEPARTMENT=DEPARTMENT'
      'HEAD_DEPT=HEAD_DEPT'
      'MNGR_NO=MNGR_NO'
      'BUDGET=BUDGET'
      'LOCATION=LOCATION'
      'PHONE_NO=PHONE_NO'
      'SALARY_TOTAL=SALARY_TOTAL')
    DataSet = qryDepartament
    BCDToCurrency = False
    Left = 304
    Top = 136
  end
  object frxDBEmployeeDept: TfrxDBDataset
    UserName = 'frxDBEmployeeDept'
    CloseDataSource = False
    DataSet = qryEmployeeDept
    BCDToCurrency = False
    Left = 408
    Top = 136
  end
end
