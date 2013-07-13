object frmHome: TfrmHome
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'VIPRO'
  ClientHeight = 13
  ClientWidth = 167
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMinimized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInformativo1: TLabel
    Left = 0
    Top = 0
    Width = 167
    Height = 13
    Caption = 'Verificando arquivos para mover...'
  end
  object ConexaoDatabase: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys30.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=192.168.1.100'
      'Database=vipro'
      'User_Name=root'
      'Password='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False')
    VendorLib = 'LIBMYSQL.dll'
    Left = 16
    Top = 24
  end
  object DtsUltimaNota: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select `UltimaNotaFiscal` from CONFIGURACOES'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConexaoDatabase
    Left = 48
    Top = 24
  end
end
