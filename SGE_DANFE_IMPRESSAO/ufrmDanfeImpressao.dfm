object frmDanfeImpressao: TfrmDanfeImpressao
  Left = 0
  Top = 0
  Width = 824
  Height = 876
  AutoScroll = True
  Caption = 'DANFE Impress'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rptDANFE: TQuickRep
    Left = 1
    Top = 8
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = dtsDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 1
    PrinterSettings.LastPage = 1
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 7
    PrinterSettings.ExtendedDuplex = 1
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 9
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 1
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevShowThumbs = False
    PrevShowSearch = False
    PrevInitialZoom = qrZoomToWidth
    object DetailBand1: TQRBand
      Left = 19
      Top = 1084
      Width = 756
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object PageHeaderBand1: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 1065
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2817.812500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = 0
        Top = 0
        Width = 646
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          0.000000000000000000
          0.000000000000000000
          1709.208333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 3
        Top = 2
        Width = 546
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          5.291666666666667000
          1444.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'RECEBEMOS DE VIPRO ROLAMENTOS LTDA. OS PRODUTOS E/OU SERVI'#199'OS CO' +
          'NSTANTES DA NOTA FISCAL ELETR'#212'NICA INDICADA AO LADO.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrmemDadosResumidoEmissao: TQRMemo
        Left = 3
        Top = 13
        Width = 636
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          7.937500000000000000
          34.395833333333340000
          1682.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrmemDadosResumidoEmissao')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 33
        Width = 153
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          0.000000000000000000
          87.312500000000000000
          404.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 3
        Top = 35
        Width = 96
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          92.604166666666680000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DO RECEBIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape3: TQRShape
        Left = 152
        Top = 33
        Width = 494
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          402.166666666666600000
          87.312500000000000000
          1307.041666666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 159
        Top = 35
        Width = 187
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          420.687500000000000000
          92.604166666666680000
          494.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape4: TQRShape
        Left = 645
        Top = 0
        Width = 109
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          177.270833333333300000
          1706.562500000000000000
          0.000000000000000000
          288.395833333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 683
        Top = 4
        Width = 26
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1807.104166666667000000
          10.583333333333330000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NF-e'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblNFeNumero: TQRLabel
        Left = 652
        Top = 26
        Width = 98
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1725.083333333334000000
          68.791666666666680000
          259.291666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' 000.000.000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 652
        Top = 48
        Width = 98
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1725.083333333334000000
          127.000000000000000000
          259.291666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'S'#201'RIE 0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 0
        Top = 73
        Width = 753
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          193.145833333333300000
          1992.312500000000000000)
        Pen.Style = psDashDotDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 80
        Width = 339
        Height = 155
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          410.104166666666800000
          0.000000000000000000
          211.666666666666700000
          896.937500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 338
        Top = 80
        Width = 149
        Height = 155
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          410.104166666666800000
          894.291666666666800000
          211.666666666666700000
          394.229166666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 343
        Top = 84
        Width = 134
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          907.520833333333400000
          222.250000000000000000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DANFE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 343
        Top = 100
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          264.583333333333400000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DOCUMENTO AUXILIAR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 343
        Top = 115
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          304.270833333333400000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DA NOTA FISCAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 343
        Top = 131
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          346.604166666666700000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ELETR'#212'NICA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 347
        Top = 147
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          918.104166666666800000
          388.937500000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0 - ENTRADA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 347
        Top = 162
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          918.104166666666800000
          428.625000000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '1 - SA'#205'DA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 442
        Top = 147
        Width = 35
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666680000
          1169.458333333333000000
          388.937500000000000000
          92.604166666666680000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 456
        Top = 154
        Width = 8
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1206.500000000000000000
          407.458333333333400000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 343
        Top = 185
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          489.479166666666600000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'No. 000.000.000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 343
        Top = 200
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          529.166666666666800000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'S'#201'RIE 0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 343
        Top = 216
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          571.500000000000000000
          354.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FOLHA 1/1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 486
        Top = 80
        Width = 267
        Height = 68
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          179.916666666666700000
          1285.875000000000000000
          211.666666666666700000
          706.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 486
        Top = 140
        Width = 267
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1285.875000000000000000
          370.416666666666700000
          706.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 490
        Top = 146
        Width = 75
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1296.458333333333000000
          386.291666666666700000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CHAVE DE ACESSO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 490
        Top = 159
        Width = 251
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          420.687500000000000000
          664.104166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape11: TQRShape
        Left = 486
        Top = 178
        Width = 267
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.812500000000000000
          1285.875000000000000000
          470.958333333333400000
          706.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 490
        Top = 181
        Width = 254
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          478.895833333333400000
          672.041666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Consulta de autenticidade no portal nacional da NF-e'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 490
        Top = 198
        Width = 254
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          523.875000000000000000
          672.041666666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'www.nfe.fazenda.gov.br/portal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 490
        Top = 215
        Width = 254
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          568.854166666666800000
          672.041666666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ou no site da Sefaz Autorizadora'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 72
        Top = 84
        Width = 196
        Height = 76
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          201.083333333333300000
          190.500000000000000000
          222.250000000000000000
          518.583333333333400000)
        Picture.Data = {
          0A544A504547496D6167651C220000FFD8FFE000104A46494600010101006000
          600000FFE100364578696600004D4D002A000000080001876900040000000100
          00001A000000000001A00100030000000100010000000000000000FFDB004300
          0503040404030504040405050506070C08070707070F0B0B090C110F1212110F
          111113161C1713141A1511111821181A1D1D1F1F1F13172224221E241C1E1F1E
          FFDB0043010505050706070E08080E1E1411141E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1EFFC0001108005800DA03012200021101031101FFC4001F00000105
          01010101010100000000000000000102030405060708090A0BFFC400B5100002
          010303020403050504040000017D010203000411051221314106135161072271
          14328191A1082342B1C11552D1F02433627282090A161718191A25262728292A
          3435363738393A434445464748494A535455565758595A636465666768696A73
          7475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9
          AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4
          E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101
          0000000000000102030405060708090A0BFFC400B51100020102040403040705
          040400010277000102031104052131061241510761711322328108144291A1B1
          C109233352F0156272D10A162434E125F11718191A262728292A35363738393A
          434445464748494A535455565758595A636465666768696A737475767778797A
          82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
          B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2
          F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E8A28A0028AA5AC6A
          BA6E8FA6CDA96AD7D6D616502EE96E2E2558E38C640CB331000C9039F5AF9BFE
          23FED91E05D12796D7C23A5DF789E74E3CF2DF65B5FC198176C7FB801EC6803E
          9DA2BF3FB5BFDB3BE27DE391A6E93E1BD363CFCB8B69257FC4B4983FF7C8AA7A
          6FED8BF176D66DF7117872FD7FB9358B28FF00C71D4D007E86D15F1F7817F6D9
          D3A7952DFC6BE119ECC1201BBD2E6F3547B989F0401ECCC7DABE9AF0078F7C23
          E3CD2BFB4FC27AEDA6AB6EA0798226C49112480248DB0C84E0E03019EBD2803A
          7A285208C8E94500145145001451450014514122800A29A5D4103B9E9EF59DAF
          F88342F0FDB2DCEBDACE9DA540C70B2DEDCA42A4FA02C40CD0069D15C049F173
          C112965D1EF350F1095E37689A5DC5FC44FA79B0A347F9B71DEB0358F8C3776F
          298A0F0AC3A79193BB5FD7ECECC01EE90B4F2FE1B33ED5329463BB35A542AD67
          6A716DF92B9EBBB87AD058019AF9AB58F8DFAA491481FC5FA0E9E01E23D1F45B
          8BD98FB096E1E28C7D4C67F0A87C01E2CB6F1FF8E2C740D475FF001E5F8B8490
          995F564D39102A16E23B248CB6718F99CE3D6B0FAE50E651525767ADFEADE6AA
          8CABCA849422AEDB56D3E67D1FAAEADA66956AF75AA6A369636E8373CB733AC4
          8A3D496200AE41BE2F7806594C1A46B12F8867C6445A1594DA893F8C08EA07B9
          207BD4DA4FC2DF877A7DC25D41E0ED227BB56DC2EEEE0173705BFBC66977393E
          E58D5BD6FE21FC3ED0667B6D57C65E1DB09A1001825D4225917D004DDBBB7402
          BA4F10CB3E37F15EA0AA740F861AEC8A4FFAED5EEEDF4F8F1EBB77BCDF9C6281
          6FF1775167692FBC1BE1C8D87CB1C56D71A9C89EFBD9A05CFF00C008FAD1FF00
          0B57C3F72B9D1346F16EB6E785167E1EBA547F712CA89163DCB81EF47FC251F1
          02F5C2697F0C66B404644BAD6B76F6E833EA2DFED0C7F2A00D0F0D784F5CD3F5
          78B52D63C7FE20D6DA30DFE8B2C36B05A924119D9144AC719E32C79F5AEBEB37
          C38DADBE930BF8821D3E0D44EEF3A3B195E4857E63B76B3AAB1F976E720739AD
          2A002B88F8C7F123C3BF0C7C1D2F887C413B11BBCBB5B5888F36E65C70880FE6
          4F40393E87ADD5AF2D74ED3AE350BDB88EDAD6DA269A69A43858D1465989EC00
          04D7E5DFED11F14351F8ABF112EB5A964923D2ADC98349B53C086007824671BD
          BEF31E79C0CE1460020F8D1F173C5DF1535D6BDD76F0C5631B1369A6C0C45BDB
          AFB0FE27C7563C9ED81802E687F03BE20EA5E0D1E2C9B496D3B4D9A4821B1FB5
          7C935FCB3CAB14690C7F78EE2EB866DAA41C82457A27ECFF00FB3FDEEA1E2FF0
          ADC78B3509F465D574CBAD5EDA08E18CCE6389A148F0640CAAE7CDF33EE92AAA
          A782DF27D13E2196D34B8FC59E06F1E78FEE24D1F4BB4D3F58D3B5EBD78D6F74
          E98CB218919D542CAE24B7574F9773062A435007897857F65EB0F0F6BBA2E99F
          14DAE1E3D72E1AD2CAFB44D517CA8AE3CB322C32C72C01B2CA9261D588CA8047
          20D5BF12FECBDA37883C4BAC68DF0DA3BB820D0E54B7BDD4357D57092DC346B2
          18628D2DD8FCAAF192E48E5B001C66B3FC43FB4E41278BF48BDD55DBC6167E1F
          95A7B28ED2C7FB2A0B8B9F2DA35B893CC799D88577C2811805B383802A80FDA9
          AEE2F186A5AC787B4D9BC316FAD156D4E0936EA91ACCA8B18B98509B7D926C45
          520B156DA09191C8073171FB33F8D2F7C20FE21F0B4B6FABBD9CD35A6A9A6332
          C3756B75048D1CC8BF31495415243060CC08C2E78AF2CF0E6B9E2AF00F8A5750
          D26F350D0B58B3728C3063917D51D18723D558107B8AFB0BC25E25F84BE26D6B
          C2DA05E78AA1D4BC26F05EDEDEAEA8C2DFED9AD4B7092137A9854E434A6353F2
          1C1009DA2B94F8A1F0EBE0DF89BC45E31B6F0E78A7C3BE1E86CEDAD64D36E9F5
          08D6D4EA04CE67B58C6EC34453C924267CA73C0C164201ED7FB2F7C7ED3BE2AE
          9FFD91AAAC3A7F8AAD63DD35BA9C477483AC91679E3F894F2383923A7BA820D7
          E567C3DF04FC57B7D6ECBC45E10F0BEBE97163379D6F7F15AB2C4A57A91211B0
          AE3AF241071D0D7DC7F0EBE3078B7C7ABFD9DA0F843458754B7B6492F9EFB587
          48A37380C5162864DEBBBA0DE0FA91D6A5CE29A4DEE6F1C2D69C2552306E31DD
          DB457EE7B7923D69A5BDFF002AF95BE29FC5BF899A1789EFBC3571AC699692D9
          94066D274F08C4B22BFDEB8330206E03EE29AF2ED73C6BE2DD6E32357F12EB57
          6C5B258EA32C4AC3FBA6289921C7FC033EF5C15B34C3D26E3BB47D665DC079BE
          3E946B462A3192BA6DF467DC5E20F167863C3C85F5FF0011E91A4A8EF7D7B1C1
          FF00A1915CC4FF00177C292C0F2E8916BBE21D9C93A5E91712C58F5F3CAAC207
          B9702BC1BF661F12E81A678C3FB2756D1745865D4180B3BF4D3E18A449718D85
          D541F9B1FF007D7D6BEA0F1AA83E0CD68F3FF20F9FA1FF00A66D5BE1F150AF4D
          CE07919B64388CA71AB0B88EB6B35B34FAA3C9358FDA063472BA7E85656E8067
          7EADAD44A4FD16D16E49FA36DAE2F57F8F3E21B85709E22B3B2E784D2F413210
          3DA7B89B04FB9807FBB5E67F0C3C213F8E7C5316836F791D9BC913C8D2BC7BC0
          0BED91CF23F2AF79D17F66BF0EC08ADAC6BDA95E38C1616EA90A1C7B1DC71F8D
          7994F178DC4AE6A51491F738EE1EE17C8EA7B2C7D59CE764ECBFE02FD4A9F07A
          F745F89D3DFDB6BFE21F1ADD5EC18736771AE98229A23C6EDB68B00383D54823
          91EB5EB3E1EF871E01D0E7FB4E97E10D160BAFF9FA3688F39FAC8C0B9FC4D7C9
          BAD477BF09BE2E39D2AF12E0E9F387888901F3616E7CB900E84AE54838E791DA
          BEC8F08EBB63E24F0F59EB7A6C9BEDAEA2122E7AA9EEA7DC1C83EE2BB3018B95
          54E9D4F8E3B9F37C5D9051C04A9E2F05FEEF55271F276D9FE6BE7D8F0FFDB2E6
          961B2F0DC514B2471BB5C6E546201C08F1915E57F0FF00E10F8BFC69A626ABA7
          47676DA7C9B8453DCCD80E558A9C0504F0411C815EA1FB697FC7B7867FDEB8FE
          51D77BFB3001FF000A6346FF00AE973FFA3E4AE1A9878E271F284F64BFC8FABC
          267188C9784A86230B65294DC6ED5FAC9FE870FE1EFD9A2C622AFAF788EE6E38
          198ACE211007FDE6DC4FE42B85F80B691E9FFB44A585BEEF2ADAE2F618F775DA
          A92019F7C0AFAFC8F90D7C91F05F9FDA666FFAFDBFFE5255E230B4A855A3ECD5
          B539325CF730CDB0398BC65472B52765D16FD0FA0AFBE15781351BF96F758D1A
          4D66695CBB0D56FA7BC4049270A92BB2AAFA280001C015D1E85E1CF0EE830883
          43D0B4BD2E25E89676890A8FC140AA7E2EF0E49E20FB3467C45AEE93145BBCC4
          D32E56033E71F79F69718C1C6D65EA739E31CD5F7C30F87E9134DAECBAADEC48
          32E756F11DECF191EACB2CC508FA8C57B87E5C765AC6BFA0E90BBB56D6B4EB05
          1D4DD5D24607FDF4456169DF13FE1EEA5AC5BE91A578BB48D4EF277F2E38EC27
          172377A168F72AFE24571E9A87ECDFE1F9F16AFF000D6DAE6238C5AC768F283F
          440589FD6BB6F0AF8CB40F10DD8D3F45B7D60C4232E279345BBB6B6C29030B2C
          91AA1EA30149CF3401D58F6A29146170296803E76FDBE3C692786FE0D2E856B3
          98EF3C45722D4852437D9D06F9483EF84423B890D7C4BF05B457D73E26E85643
          4C8B54F32F6355B49DF6433B9395495B6B7EEF8CB8C64A2B01CF23DEBFE0A49A
          BCD378EFC2BA091886CF4C92ED78EAD349B4FE90AFE754BF63EF0FF846E3E19F
          8C75FF0014EBF1F879A0D4EC7EC3AAEF8D65B2B8877C88D16F041662F82983B8
          718A00F7EF1E5FCF6373A75A7C6DB4D00E9C63B8BAD2B5DF0FCD73693585C430
          B4AD1F2FE62968D242191C06D9B4AFCC2BE08F891E2B6F14F89AFAF6DA3B8B6D
          3A49D9EDE09EE649E4C7003CB23B3349290065989E800C28503E8AFDAD2E65D5
          3E12E99E28B8F89967E34926D5069F6AB616515B5BDB2796CF312AACEDE71291
          824B0C2B10140639F10FD9C3C1969E3EF8D1E1CF0D6A0A1EC26B869AED09237C
          512348C848E46E09B723FBD401B9F087F677F889F122C9755B1B3874AD1DF98E
          FF0051631ACDD3FD5A0059C73C36029C11BB22BA0F86BF053C1FABFC45B6F09F
          8875DD750C92490492410456E5264CFC98632752A4678E71C735FA1F6D0456B6
          F1DB5BC31450C481238E350AA8A060280380071C57C83F1FB4E9FC1BF1A7FB66
          C03209E48B52B760080240DF30CF43F3293FF0215C19857A942319C76BEBE87D
          6F08E5785CD6B55C2565EFB837077DA48F5BF0BFECC3F0734274947876E3539D
          47325FDEC8E1BFDE452A8C3D8AE2B8FF00DA326D03C056F61E18F02E93A77872
          E2EC1B8BD974A812DA4310CAAAB34601218E4F5FE015F43E89ABDB6ABE1FB3D6
          ADD80B6BAB64B852C7A2B2EEE7F0AF91ED564F8B5F1F0C8EAD2584F77B9B2870
          B69170011DB2001FEF3D466359FB25083D65A1D1C199741E36A62F151FDDD04E
          52BF7E8BF37F23DD7E0DF86E6F0F7C1977BC329BED4ADE5BEB8DE724174F941F
          7DA173EF9AF31FD8C87FC55DAEFF00D7827FE8C15F48EBA02F87AFD1405516B2
          000761B0D7CDDFB19FFC8DDAE9FF00A704FF00D0C5655A9F262284574BFE4776
          5B8A963327CD7113DE4E0FEF9339FF008C76D0DDFED297769731AC904FA858C7
          221E8CAD1C208FCABE89BFD27E19F80AC46A777A5E87A52479092B409E61EF85
          382C4F1D057CD7FB415D4FA7FC7AD5AFAD982CF04B6B3444AE70CB044471DF90
          2B57C2BF0C7E20FC4ED4575CF14DEDCD9D9C9F30B9BC04C8CA7B451F181F90EE
          335C742B3A75AAC610E6937A1F4B99E5D0C4E5981AD8AC57B1A31A71BABBBC9D
          968975D3D7D0E4FE286AFA478A3E22CDA8F8334EBCB7172EA151130F34C3F8D1
          57919C0E3A9E4F7AFA9343BCF115D7C16B993C5762F67AA8D2E74995882CE046
          C03903A1618247AE7A5697C3EF86FE16F0541B748B00D74C3125E4F8799FFE05
          D87B00056C78DC63C19ADE3FE81F3FFE8B6AF430B839D1E7A937ACBA2D8F8FCF
          788B0D98AC3E0F0D4DF252692949DE4D7F91F23FECD3A9E9FA37C476D4B55BB8
          6D2D2DEC26679656DAA33B40FE75D4FC57F8F97FAAF9BA57833CCD3EC492AF7E
          C36CD28E9F20FE007D4FCDFEEF43E171C7248199236608A5DB6AE768E993E839
          1F9D7AE7ECE1A9FC3FB2F1008BC5164ABAA3B8FB1DE5CB6E811BFBBB7A237A31
          CFD4719F0F0B88A8E0B0F1972A6F73F51CFF0027C1D2C44F38AD49D694124A0A
          D656EAD75FBBE441F0D3E0A789BC5CE9A96AFE6E93A648DB9A69D499E6EB92AA
          79E7FBCDD73919AFA9FC0DE15D27C1BE1F8F45D162912D90973E63966773D589
          3DCFB6056DC4415C8C60F4C53EBE8B0B81A586578EAFB9F8CE7FC518ECE9DAB3
          B416D15B2FF33E75FDB4BFE3DBC33FEF5CFF0028EBBEFD983FE48C68DFEFDCFF
          00E8F92B81FDB47FE3DBC33FEF5C7F28EBBEFD983FE48C68DFEFDCFF00E8F92B
          968FFC8C67E9FE47D263FF00E48AC37FD7C7FF00B79E9ADF74FD2BE47F82DFF2
          7332FF00D7EDFF00F292BEB86FBADF4AF91FE0B7FC9CCCDFF5FB7FFCA4ABC7FF
          00168FF88E3E11FF00917E65FF005EBFCCFA5FE232F860F85EE1FC63A843A7E8
          C8C8D34D2EA0F6680EE014348AEA7049036E70738C1AF2FB26FD9E1265974BF0
          7E9FAC48A722E2D3C2B71A8927D7CD585F27DF35EABE30D435EB0B781F40F0E0
          D72677C4919BE4B611A8190DB981CF3E95CF26BFF14DCF1F0E7448C7ACBE2739
          FC96D8D7A87C2105AF8EECE38D2D7C39F0DFC67790E70AB0E862C107FE053438
          15B1E1EF12F89752D623B6BCF87BAC68D64C1B7DE5EDF5A305C02400914AEC72
          703F1AA2358F8ACC063C0DE1453FED789E63FCACE9F15F7C5692E2212785FC17
          6F06F1E637F6FDCC8E173C90BF63009C74C91401DC292541230696917EED2D00
          7C23FF000522D3A68FE22F863572B882E7486B643EAD14CCCC3F2997F3AC6FD8
          B6F574ED65F5ED4B49BED6346D0E691E78ED2D9EE1F4F9AE1104579E4A02D200
          B6F3464A8253CC07B9AF70FF008284783A4D6FE12D9789ADA26927F0FDE6F936
          F416F3611CE3D77888FD01AF977F653F897FF0AD3E234F7D2DBB5CDAEA1A7CD6
          8D0A8397971BE10319C1691113382007271C5007A87ED8FA35C78B2C353F895A
          0E85A8D86816EFA7DACF35D583DAB5F4989C7DA7CB902BEC512C3107651B8B00
          32145787FECF5E3383E1FF00C63F0EF8A2F188B2B6B8315D9DA4ED865468DDB0
          393B439600775AFAEBE22F866F75BFD9BAFBC73AAFC44D6752BDD43474BFB8B6
          69D7FB367F302B7D9A3B7DB85F98AA2303BC3ED2493907E34F8ADE02D7FE1CF8
          CEEBC3BAF5ABC6F11DF6F398F6A5CC47EEC89D883DFAE0820F208A00FD61B1BB
          B6BEB286F2CE78AE2DE74592196360C9221190CA470411CE4578B7ED7DE1E37D
          E0AB2D7E2466974BB9DB21078114B8524FFC0827D326BE38F83DFB44FC44F869
          A7A691A75D5B6A9A3467F7761A8A348908279F2D810C9F4C95CE4E3935E83E25
          FDB0B5BF116817BA26A9E05D21AD6F213149E5DD481803DC120E083C8F715862
          68FB6A528773D4C9330796E614B14BECB57F4EBF81E83A17C4B5B0FD9CEFBC3D
          F6855D545C369F026ECBF91265D9F1EC0BA8ED9DB5DAFEC7DE16FB368BA878AE
          E631E6DE3FD9AD49EA224FBE47D5F8FF008057C751FC4BD31982AF84AE49E480
          354FCFFE5957D4FE09F88BF16FC3FE11F0E2DCFC30D2340F0CCC2DED6DB52BED
          418AC5E690B134C9183226F7651B8A000B82700D79F85C25655633AD6F75591F
          619FF10E5B2C156C3E5B7BD69F34EEADA76FBFF53E8FF108FF008A7F50FF00AF
          593FF4135F357EC65FF2376BBFF5E09FFA18A6FC79FDA0FC63F0CF558BC31AEE
          85E16D46F2F2CCCB2C5A7DEDC6618DBE552C5E3032DF3607240504F519E63F64
          1F10F89BC41AB6BD79E06F0AE9B6CB6F0C515D4DAB6A9298FE6625553CB873BB
          E527DB1EE2BAABD09CEBD39ADA373C1CAB35A185CA719849FC5579797E4EEEE5
          FF008C633FB4C1F7BFD3FF00F418ABEBC0831DABE7EF11FC2AF1E6BBE381E2EB
          EB2F0AA6A025865D916B372232D18503836A4FF08EF5E89F69F8C6172749F010
          1EFAA5D8FF00DA14B07879D29D494BABD0D388B37C3E6185C1D2A37BD2828CAF
          DECB6FB8F4102B13C707FE28CD6F8FF987CFFF00A2DAB9A6BCF8C6832DA3F80B
          1DCFF6ADDF1FF92F55B544F8BBA8E9B756173A2F81962B985E2729ABDD038604
          1C7FA3FBD76495D347CD51928548C9EC9A3E7EFD95E18E7F8AA914D1A491BD84
          EAC8EB9041C7515DC7C61F8063136B5E068B9E5A5D309E3FED91EDFEE1FC3D2A
          D7C3EF851E38F0578886B7A5E9FE1792E96168C0B8D72E19369C64F1683D077E
          F5E8FF006AF8C3BBFE405E0504FF00D462EFFF0091ABCAC3E5CBEAFECAB2D6E7
          DE675C6951673F5FCB66F9795269AD1DBBA3C2FE0EFC66D4FC25709E1DF168B9
          B8D3226F283C8099ECC838DA41E5947F74F231C67A57D4FA56A363AAE9D0EA1A
          75D43756B3A878A589832B83E84578978FBE1978BFC69769A86A7E17F05C37AB
          C34F69AE5CC6F20E9F37FA290D8E3B66ACFC3CF03FC4AF02199346B5F0DBDB4C
          373DB5C7882E648B77F780FB20C371D4633DF35BE169E228BE49BE68F47D4F2F
          3FC6E4F995358AC3C5D2ACFE28DBDD7E69ADBEED4C4FDB44E6DFC323FDAB8FE5
          1D6DFECF3E3AF07E8DF0A74BD3B55F11E9B657913CE648669D55D733391907D4
          1068F897E05F885F1012C63D6348F0A47F6267F2CDB6BB729F7C0CEECDA37F74
          57163F67BF1293C69BA17FE14537FF00215633A188862A55A9A4D356D59EA617
          36CA31390D2CB71B5251709397BB1BF57E7E67BAB7C4EF87C571FF00097E8FFF
          00812BFE35F397C0F9E2B8FDA45AE6DE4596196EAF9E375390CA564208F622B6
          5BF67CF1281CE9BA17FE14737FF2156D7813E12F8D3C1FE26B6F10697A4F8764
          BA815D5167F104E53E652A720598F5F5FCE89D1C556A90738A4A2EFB8F0B9864
          59660B154B0B5672955838EB149796C75BE31F117C2FD4F5A73AA78D7C456375
          6D9B6921D3B53D46D23051981CA42554B6723775C01D80AC75BFF83FFF0043D7
          8E9F3FF51FD6CFF27AEE3EDDF179463FE11DF0313E835CBAFF00E45A44BFF8BC
          C4E3C37E07FF00C1EDD7FF002257AC7E7A711F6CF83FD478C7E2037D359D74FF
          00ECD435D7C2123FE468F888DF4D4F5F3FFB35775F6DF8BDFF0042D7823FF07D
          75FF00C8949F6DF8BFFF0042CF81B1FF0061EBAFFE44A00E93C19AA695AAF87E
          D67D165BC9ACA35F26392EA399256D9C65BCE02463C72CD9C9E726B66B82FB6F
          C5EFFA167C0E3FEE3F75FF00C895DC80E40C900F7C668029F88F49B1D7B42BED
          1753B75B8B1BFB792DAE223D1A3752AC3F23D6BF2BBE34FC3ED53E197C42D43C
          2FA9A3B246C64B2B865C0B9B76276483B738C103A3061DABF586BCCFF680F843
          A17C58F08369B7DB2D354B6DCFA76A0A996B773D41FEF23606E5F6047205007C
          EFFB20F8A3E18F8992D344F1368F147E2FD364FB4584725D4DF65BF75C912470
          17F245C0EE02024FCC32738EABE2078197E287ECFCFF0012FC55E32BCBBBD1A5
          CBADDBD923C234EB4214C9F665509BC100794CFBF7160739C05AF8FBE23781BC
          59F0D7C4E748F12584DA7DE46C24B7990931CEA0822489C70C3A74E41E080410
          3B0F851F17AC740BB1178DFC372F8AF4E6BB178F0B6A73C4A661B7123C1B8C13
          3654312F1EE66F99989A00EC3E23FECD674E974987C1FA9EABAAEB1ABD92DF45
          E1E92C94DD5AC3B57734D36E58C28760BB995327800906B9FD2FF67BD61BC07A
          E789F57D7AD2CEE748996CE7D212DA46BB8EEDD91638640E11543196321C165C
          364670457B55F7ED3BE0583C73178FB424B995EEB494D2B51D1EFE1304F1AC52
          BC914B14882443CCB20642CB91B48E462974DF8CDF06F58B1F19EA9E3AF10037
          7E2D4823974BD32D2E5BEC70409884099A240D386258BF407681C2E6802CF843
          E0827C28D261D3FC4B6BA36B56BE2C0741BFD52CA274BFD324BB5F2D0C4D2314
          78B712848446F98121802B5A3FB4678D3C55E12F8690786FE203F85E58E5962F
          DED9DDCA6F3594864570AB6DE585B70C51048E5D950160A198A2D786F8E7F689
          D66F350B21A4EB5ACEB906992F9FA6C9AE5ADB43E4CC14AA4CF140312C899DCA
          5DB6EEC1286BC8354D43C57E3FF17B5CDFCDA978835ED465DA9F29926958F454
          551C01D954600E00028017C43AB788FE20F8EA7D4EF4CDAAEB9ACDDA80B14796
          964621511147FC05557D0015FA03E07F875FF0AAFF0066CBDF0BC37496FAF6A9
          0186E6EE324017F765608F073D119E34078CEDDDC66B03F64BFD9D93E1FA47E2
          EF18C114FE279508B7843078EC1187382383210482C3800903A927DF7C516177
          7DA44D069F0E9B25E2B24B6DFDA3099605951D5D5D954839054104104100D007
          90DF4621D5AEA4F0CC779E12D012F63F0F6A4C2E023493C9770AF9C88ACC21CC
          659125F95CFDA91B1F2A9ADBF1D58787FE1FDDE85AC787AD934DBE5B890DDA42
          C7FD32CE382479DA719FDE6C0AADE636487DA377CFCDDB9F0EFC4CB98EFA3B95
          F86B3A6A0812F564D2AE585CA85DB890197E71B7E5E73C71D2B3ED3C07E36B58
          6EE1834EF85C12F2DCDADC86D22E5BCE80F5858994E63E4FC9F77DA8034356D4
          757F0A7C29F0EE825AFAE7C4D79676F61BED2133CE9208D7ED1721707779637B
          8C8C16D8A7EF0AE0AEE5966F0CDB787F493ABD84BE15D6AFF5A82DA61224F3DB
          DAC42E6381C31CE0B5EDBA60E72A2BB8D2FC2DF1174AB9173A6DBFC32B39C2B2
          0921D22E5182B152C3225CE09452477DA3D054CBA07C4E5D464D487FC2B717B2
          2346F71FD9575E632B6C0CA5BCDC907CB8F23BEC5F41401CF7C4DF102EA7ADE9
          1AB437F22F87344BE92E4C90C9817725B5ACD732BF1F7E38FCB48B39C1796404
          6501AAF63E0ED4AC7E1F69FE1CD5743B0D2B57D45B4ED2EEB50B1D49E5B8BE4D
          E8F784BEC428CD1452B6431E4F07819DD1E0BF1E0D360D3174FF0085A2C6DEDE
          4B586D868D70228E1931E64617CDC056C0C8EFDEA7B2F0BFC46B2309B383E195
          B9826F3E231E9172BB24D8C9BC625E1B63BAE4738623A13401917BAECF79FF00
          12EF13410DF8F0BE91A9CFAEC7247F24F3C0B08B790AF4DB2C3249281CE0B63A
          A9A9BC1BE12D346B569E0ED7238A5B7D27C39A7DDCD61D23BDBB90CD14F3CE33
          89C8F2230376402E49E4A91AB3F87FE26CF25EC938F86D2BDFC0B6F78CFA55CB
          1B889776D8DC997E651E63E01E3E76F5350EBBE14F88DAE3C326AF1FC37BC96D
          F77912C9A65D1922DD8DDB5FCEDCB9C0CE0F381E94018D7DA4B5C6BBAD7853C2
          935A5D69BA75DDB5E2E87793B0B6BA658DFED5661B0DB235F36CE5DB8640EC01
          5C3103B9F046A76107C35D3F55D1AD757BCB1921FB45BDAB6D92E51247244432
          70447BB60F988DA8396EA7989BC0FE39974BB5D2DB4FF85C2C6D199EDADD347B
          95484B677140251B770660D8FBC1981C826B5ED74FF8B9696D15B5ADDFC3E820
          850471471E9D76AA8A06028026C0000031401A3E3CBEB8B8F0D69704104F0CFA
          AEA76101864F964589A747995B070088525CE0F635C8FC4FD36C64F13F88755B
          6B3B41A9E97E183240D2460992F2E2464B66CF7756B5DAA7A8F338EA6B5357D0
          3E276AF1470EABFF000ADEFE38A412C6971A55D4815C02BB8032F070CC33E84F
          AD557F07F8FDECA6B26B3F85E6DA75459A13A3DCEC90236F40C3CDC1DAC4919E
          849C75A0083C4D0E83F0D355F0ECFA379F6EF899751B3B77663776A96D261CC5
          9C3486E3ECA8AF8DC5E50B9F9C82EF8477FA9A78E2F23D66D755B7BDD67498EF
          EE16F2078905CC73389522DD805112E2DA207A958D49E4934EB0F0578EF4F925
          92C74EF8596CF2CD1CF2345A2DC297923398DCE25E594F43DBB56AC9A6FC5A92
          EE3BB7BAF87AD711C6F14729D3AEF7A23952CA0F9D90094427D768F4A00F44A2
          B82F27E327FD04BC05FF0080177FFC7AAC69917C545D46DDB56BFF0006BD8090
          7DA16D6CAE56529DC29694807EA0D0076B4522E71CD2D00145145006078DFC1D
          E1AF1A689268DE28D1ED754B273911CCB928D8237230F991B93F32907DEBE56F
          88FF00B15452CD2DDF803C52B6E19814B1D5949541DF1320271E80A13EA68A28
          03C6B58FD96BE3669F76F0C5E148F508D4E04F6BA84051BDC067561F881556DB
          F665F8DF3B851E06993DE4BFB6503F3928A2803D33C11FB1678B2EEE124F1878
          9B4CD2EDB1B9A2B156B998FF00B2490AAA7DC16FA1AFAABE12FC1DF017C31B62
          BE18D2717AEBB66D42E9BCDBA9471905C8F95781F2A855E338CD145007A08181
          8A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2803FFFD9}
        Stretch = True
      end
      object QRLabel21: TQRLabel
        Left = 4
        Top = 159
        Width = 331
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          420.687500000000000000
          875.770833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VIPRO ROLAMENTOS LTDA.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 4
        Top = 174
        Width = 331
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          460.375000000000000000
          875.770833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RUA INHAMUNS, 226 - VILA PRUDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 4
        Top = 189
        Width = 331
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          500.062500000000100000
          875.770833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '03156-220 - S'#227'o Paulo - SP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 4
        Top = 204
        Width = 331
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          539.750000000000000000
          875.770833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fone (11) 2020-6611'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 4
        Top = 219
        Width = 331
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          579.437500000000000000
          875.770833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'nfe.vipro@uol.com.br'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 234
        Width = 487
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          0.000000000000000000
          619.125000000000000000
          1288.520833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 4
        Top = 236
        Width = 103
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          624.416666666666800000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NATUREZA DA OPERA'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel27: TQRLabel
        Left = 4
        Top = 247
        Width = 136
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          653.520833333333400000
          359.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NATUREZA DA OPERA'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 486
        Top = 234
        Width = 267
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1285.875000000000000000
          619.125000000000000000
          706.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 490
        Top = 236
        Width = 155
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1296.458333333333000000
          624.416666666666800000
          410.104166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel29: TQRLabel
        Left = 490
        Top = 247
        Width = 255
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          653.520833333333400000
          674.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00000000000000000  00/00/0000   00:00:00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 263
        Width = 241
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          695.854166666666800000
          637.645833333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 3
        Top = 265
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          701.145833333333400000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel31: TQRLabel
        Left = 3
        Top = 276
        Width = 231
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          730.250000000000000000
          611.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '109.889.711.117'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape15: TQRShape
        Left = 240
        Top = 263
        Width = 273
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          635.000000000000000000
          695.854166666666800000
          722.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel32: TQRLabel
        Left = 244
        Top = 265
        Width = 165
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          645.583333333333400000
          701.145833333333400000
          436.562499999999900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL DO SUBST. TRIBUT.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel33: TQRLabel
        Left = 244
        Top = 276
        Width = 262
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          645.583333333333400000
          730.250000000000000000
          693.208333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '-X-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 512
        Top = 263
        Width = 241
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1354.666666666667000000
          695.854166666666800000
          637.645833333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel34: TQRLabel
        Left = 516
        Top = 265
        Width = 22
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1365.250000000000000000
          701.145833333333400000
          58.208333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel35: TQRLabel
        Left = 516
        Top = 276
        Width = 229
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1365.250000000000000000
          730.250000000000000000
          605.895833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '49.783.814/0001-39'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 4
        Top = 295
        Width = 115
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          780.520833333333400000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESTINAT'#193'RIO / REMETENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape17: TQRShape
        Left = 0
        Top = 307
        Width = 513
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          812.270833333333400000
          1357.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel37: TQRLabel
        Left = 3
        Top = 309
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          817.562500000000000000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME / RAZ'#195'O SOCIAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel38: TQRLabel
        Left = 3
        Top = 320
        Width = 503
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          846.666666666666600000
          1330.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape19: TQRShape
        Left = 663
        Top = 307
        Width = 90
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1754.187500000000000000
          812.270833333333400000
          238.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel41: TQRLabel
        Left = 668
        Top = 309
        Width = 72
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1767.416666666667000000
          817.562500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DE EMISS'#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Left = 672
        Top = 320
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1778.000000000000000000
          846.666666666666600000
          201.083333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00/00/0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape20: TQRShape
        Left = 0
        Top = 337
        Width = 413
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          891.645833333333200000
          1092.729166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel43: TQRLabel
        Left = 3
        Top = 339
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          896.937500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERE'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel44: TQRLabel
        Left = 3
        Top = 350
        Width = 406
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          926.041666666666800000
          1074.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ENDERE'#199'O DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape21: TQRShape
        Left = 663
        Top = 337
        Width = 90
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1754.187500000000000000
          891.645833333333200000
          238.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel45: TQRLabel
        Left = 668
        Top = 339
        Width = 60
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1767.416666666667000000
          896.937500000000000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DA SA'#205'DA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel46: TQRLabel
        Left = 672
        Top = 350
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1778.000000000000000000
          926.041666666666800000
          201.083333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00/00/0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape22: TQRShape
        Left = 574
        Top = 337
        Width = 90
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1518.708333333333000000
          891.645833333333200000
          238.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel47: TQRLabel
        Left = 579
        Top = 339
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1531.937500000000000000
          896.937500000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel48: TQRLabel
        Left = 583
        Top = 350
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1542.520833333333000000
          926.041666666666800000
          201.083333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '000000-000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape23: TQRShape
        Left = 412
        Top = 337
        Width = 163
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1090.083333333333000000
          891.645833333333200000
          431.270833333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel49: TQRLabel
        Left = 417
        Top = 339
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          896.937500000000000000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BAIRRO / DISTRITO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel50: TQRLabel
        Left = 417
        Top = 350
        Width = 154
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1103.312500000000000000
          926.041666666666800000
          407.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME DO BAIRRO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape24: TQRShape
        Left = 0
        Top = 367
        Width = 374
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          0.000000000000000000
          971.020833333333400000
          989.541666666666800000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel51: TQRLabel
        Left = 4
        Top = 369
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          976.312500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MUNIC'#205'PIO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel52: TQRLabel
        Left = 4
        Top = 380
        Width = 365
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          1005.416666666667000000
          965.729166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MUNICIPIO DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape25: TQRShape
        Left = 373
        Top = 367
        Width = 40
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          986.895833333333400000
          971.020833333333400000
          105.833333333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel53: TQRLabel
        Left = 378
        Top = 369
        Width = 12
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1000.125000000000000000
          976.312500000000000000
          31.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel54: TQRLabel
        Left = 378
        Top = 380
        Width = 23
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1000.125000000000000000
          1005.416666666667000000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape26: TQRShape
        Left = 412
        Top = 367
        Width = 101
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1090.083333333333000000
          971.020833333333400000
          267.229166666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel55: TQRLabel
        Left = 417
        Top = 369
        Width = 44
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          976.312500000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FONE / FAX'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel56: TQRLabel
        Left = 417
        Top = 380
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1103.312500000000000000
          1005.416666666667000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(11) 0000-0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape27: TQRShape
        Left = 512
        Top = 367
        Width = 153
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1354.666666666667000000
          971.020833333333400000
          404.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel57: TQRLabel
        Left = 517
        Top = 369
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1367.895833333333000000
          976.312500000000000000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel58: TQRLabel
        Left = 517
        Top = 380
        Width = 142
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1367.895833333333000000
          1005.416666666667000000
          375.708333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(11) 0000-0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape28: TQRShape
        Left = 663
        Top = 367
        Width = 90
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1754.187500000000000000
          971.020833333333400000
          238.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel59: TQRLabel
        Left = 668
        Top = 369
        Width = 62
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1767.416666666667000000
          976.312500000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'HORA DA SA'#205'DA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel60: TQRLabel
        Left = 672
        Top = 380
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1778.000000000000000000
          1005.416666666667000000
          201.083333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00:00:00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape18: TQRShape
        Left = 512
        Top = 307
        Width = 152
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1354.666666666667000000
          812.270833333333400000
          402.166666666666600000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel39: TQRLabel
        Left = 517
        Top = 309
        Width = 44
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1367.895833333333000000
          817.562500000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ / CPF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel40: TQRLabel
        Left = 521
        Top = 320
        Width = 136
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          846.666666666666600000
          359.833333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0000000000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel61: TQRLabel
        Left = 4
        Top = 399
        Width = 84
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1055.687500000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FATURA / DUPLICATA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape29: TQRShape
        Left = 0
        Top = 410
        Width = 753
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1084.791666666667000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo1: TQRMemo
        Left = 4
        Top = 411
        Width = 744
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          10.583333333333330000
          1087.437500000000000000
          1968.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrmemDadosResumidoEmissao')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel62: TQRLabel
        Left = 4
        Top = 433
        Width = 93
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1145.645833333333000000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#193'LCULO DO IMPOSTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape30: TQRShape
        Left = 0
        Top = 444
        Width = 753
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          0.000000000000000000
          1174.750000000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel63: TQRLabel
        Left = 4
        Top = 446
        Width = 109
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1180.041666666667000000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BASE DE C'#193'LCULO DO ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel64: TQRLabel
        Left = 4
        Top = 456
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          1206.500000000000000000
          288.395833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape31: TQRShape
        Left = 142
        Top = 444
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          375.708333333333400000
          1174.750000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel65: TQRLabel
        Left = 159
        Top = 446
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          420.687500000000000000
          1180.041666666667000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel66: TQRLabel
        Left = 159
        Top = 456
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          420.687500000000000000
          1206.500000000000000000
          288.395833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape32: TQRShape
        Left = 290
        Top = 444
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          767.291666666666800000
          1174.750000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel67: TQRLabel
        Left = 300
        Top = 446
        Width = 125
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          793.750000000000000000
          1180.041666666667000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BASE DE C'#193'LCULO DO ICMS S.T.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel68: TQRLabel
        Left = 300
        Top = 456
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          793.750000000000000000
          1206.500000000000000000
          288.395833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape33: TQRShape
        Left = 440
        Top = 444
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          1164.166666666667000000
          1174.750000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel69: TQRLabel
        Left = 450
        Top = 446
        Width = 123
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1190.625000000000000000
          1180.041666666667000000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO ICMS SUBSTITUI'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel70: TQRLabel
        Left = 450
        Top = 456
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1190.625000000000000000
          1206.500000000000000000
          288.395833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape34: TQRShape
        Left = 600
        Top = 444
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          1587.500000000000000000
          1174.750000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel71: TQRLabel
        Left = 610
        Top = 446
        Width = 120
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1613.958333333333000000
          1180.041666666667000000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DOS PRODUTOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel72: TQRLabel
        Left = 610
        Top = 456
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          1206.500000000000000000
          288.395833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape35: TQRShape
        Left = 0
        Top = 472
        Width = 753
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          0.000000000000000000
          1248.833333333333000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel73: TQRLabel
        Left = 4
        Top = 474
        Width = 69
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1254.125000000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO FRETE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel74: TQRLabel
        Left = 4
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel75: TQRLabel
        Left = 125
        Top = 474
        Width = 77
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          330.729166666666700000
          1254.125000000000000000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO SEGURO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel76: TQRLabel
        Left = 125
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          330.729166666666700000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel77: TQRLabel
        Left = 254
        Top = 474
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          672.041666666666800000
          1254.125000000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCONTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel78: TQRLabel
        Left = 254
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          672.041666666666800000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel79: TQRLabel
        Left = 374
        Top = 474
        Width = 111
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          989.541666666666800000
          1254.125000000000000000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OUTRAS DESP. ACESS'#211'RIAS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel80: TQRLabel
        Left = 374
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          989.541666666666800000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel81: TQRLabel
        Left = 514
        Top = 474
        Width = 79
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1359.958333333333000000
          1254.125000000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DO IPI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel82: TQRLabel
        Left = 514
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1359.958333333333000000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel83: TQRLabel
        Left = 640
        Top = 474
        Width = 91
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          1254.125000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DA NOTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel84: TQRLabel
        Left = 640
        Top = 484
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          1280.583333333333000000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00.000,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape36: TQRShape
        Left = 110
        Top = 472
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          291.041666666666700000
          1248.833333333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 235
        Top = 472
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          621.770833333333400000
          1248.833333333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 360
        Top = 472
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          952.500000000000000000
          1248.833333333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 500
        Top = 472
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          1322.916666666667000000
          1248.833333333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 625
        Top = 472
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          1653.645833333333000000
          1248.833333333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel85: TQRLabel
        Left = 4
        Top = 502
        Width = 191
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1328.208333333333000000
          505.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TRANSPORTADOR / VOLUMES TRANSPORTADOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape41: TQRShape
        Left = 0
        Top = 513
        Width = 753
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          1357.312500000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel86: TQRLabel
        Left = 4
        Top = 514
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1359.958333333333000000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME / RAZ'#195'O SOCIAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel87: TQRLabel
        Left = 4
        Top = 524
        Width = 309
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          1386.416666666667000000
          817.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel88: TQRLabel
        Left = 330
        Top = 514
        Width = 76
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          873.124999999999900000
          1359.958333333333000000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FRETE POR CONTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel89: TQRLabel
        Left = 330
        Top = 524
        Width = 79
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          873.124999999999900000
          1386.416666666667000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '1-DESTINAT.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel90: TQRLabel
        Left = 440
        Top = 514
        Width = 56
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1164.166666666667000000
          1359.958333333333000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CODIGO ANTT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel91: TQRLabel
        Left = 440
        Top = 524
        Width = 55
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1164.166666666667000000
          1386.416666666667000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel92: TQRLabel
        Left = 520
        Top = 514
        Width = 62
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1375.833333333333000000
          1359.958333333333000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLACA DO VE'#205'C.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel93: TQRLabel
        Left = 520
        Top = 524
        Width = 62
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1375.833333333333000000
          1386.416666666667000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XXX 0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel94: TQRLabel
        Left = 600
        Top = 514
        Width = 12
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          1359.958333333333000000
          31.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel95: TQRLabel
        Left = 600
        Top = 524
        Width = 17
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1587.500000000000000000
          1386.416666666667000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel96: TQRLabel
        Left = 640
        Top = 514
        Width = 44
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          1359.958333333333000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ / CPF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel97: TQRLabel
        Left = 640
        Top = 524
        Width = 105
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1693.333333333333000000
          1386.416666666667000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape42: TQRShape
        Left = 322
        Top = 513
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          851.958333333333400000
          1357.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 425
        Top = 513
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1124.479166666667000000
          1357.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 510
        Top = 513
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1349.375000000000000000
          1357.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 590
        Top = 513
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1561.041666666667000000
          1357.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 625
        Top = 513
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1653.645833333333000000
          1357.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 0
        Top = 537
        Width = 753
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          1420.812500000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel98: TQRLabel
        Left = 4
        Top = 539
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1426.104166666667000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERE'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel99: TQRLabel
        Left = 4
        Top = 548
        Width = 309
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          1449.916666666667000000
          817.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel100: TQRLabel
        Left = 330
        Top = 539
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          873.124999999999900000
          1426.104166666667000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MUNIC'#205'PIO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel101: TQRLabel
        Left = 330
        Top = 549
        Width = 252
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          873.124999999999900000
          1452.562500000000000000
          666.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '1-DESTINAT.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel102: TQRLabel
        Left = 600
        Top = 539
        Width = 12
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          1426.104166666667000000
          31.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel103: TQRLabel
        Left = 600
        Top = 549
        Width = 17
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1587.500000000000000000
          1452.562500000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel104: TQRLabel
        Left = 640
        Top = 539
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          1426.104166666667000000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel105: TQRLabel
        Left = 640
        Top = 549
        Width = 105
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1693.333333333333000000
          1452.562500000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape48: TQRShape
        Left = 322
        Top = 537
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          851.958333333333400000
          1420.812500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 590
        Top = 537
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1561.041666666667000000
          1420.812500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 625
        Top = 537
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1653.645833333333000000
          1420.812500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 0
        Top = 561
        Width = 753
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          1484.312500000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel106: TQRLabel
        Left = 4
        Top = 563
        Width = 53
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1489.604166666667000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTIDADE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel107: TQRLabel
        Left = 4
        Top = 572
        Width = 79
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          1513.416666666667000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel108: TQRLabel
        Left = 90
        Top = 563
        Width = 34
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          238.125000000000000000
          1489.604166666667000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESP'#201'CIE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel109: TQRLabel
        Left = 90
        Top = 572
        Width = 115
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          238.125000000000000000
          1513.416666666667000000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel110: TQRLabel
        Left = 215
        Top = 563
        Width = 30
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          568.854166666666800000
          1489.604166666667000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MARCA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel111: TQRLabel
        Left = 215
        Top = 572
        Width = 102
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          568.854166666666800000
          1513.416666666667000000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel112: TQRLabel
        Left = 330
        Top = 563
        Width = 53
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          873.124999999999900000
          1489.604166666667000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NUMERA'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel113: TQRLabel
        Left = 330
        Top = 572
        Width = 159
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          873.124999999999900000
          1513.416666666667000000
          420.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel114: TQRLabel
        Left = 503
        Top = 563
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1330.854166666667000000
          1489.604166666667000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PESO BRUTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel115: TQRLabel
        Left = 503
        Top = 572
        Width = 116
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1330.854166666667000000
          1513.416666666667000000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel116: TQRLabel
        Left = 640
        Top = 563
        Width = 56
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          1489.604166666667000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PESO L'#205'QUIDO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel117: TQRLabel
        Left = 640
        Top = 572
        Width = 105
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1693.333333333333000000
          1513.416666666667000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape52: TQRShape
        Left = 322
        Top = 561
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          851.958333333333400000
          1484.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 625
        Top = 561
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1653.645833333333000000
          1484.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 85
        Top = 561
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          224.895833333333300000
          1484.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 210
        Top = 561
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          555.625000000000000000
          1484.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 495
        Top = 561
        Width = 1
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1309.687500000000000000
          1484.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel118: TQRLabel
        Left = 4
        Top = 586
        Width = 141
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          1550.458333333333000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DADOS DOS PRODUTOS / SERVI'#199'OS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape57: TQRShape
        Left = 0
        Top = 597
        Width = 753
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          0.000000000000000000
          1579.562500000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel119: TQRLabel
        Left = 4
        Top = 975
        Width = 76
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          2579.687500000000000000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DADOS ADICIONAIS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape58: TQRShape
        Left = 0
        Top = 986
        Width = 401
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          0.000000000000000000
          2608.791666666667000000
          1060.979166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 0
        Top = 597
        Width = 753
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1579.562500000000000000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel120: TQRLabel
        Left = 4
        Top = 598
        Width = 43
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          1582.208333333333000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'C'#211'DIGO PRODUTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel121: TQRLabel
        Left = 54
        Top = 598
        Width = 319
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          142.875000000000000000
          1582.208333333333000000
          844.020833333333500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'DESCRI'#199#195'O DO PRODUTO / SERVI'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel122: TQRLabel
        Left = 729
        Top = 598
        Width = 22
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1928.812500000000000000
          1582.208333333333000000
          58.208333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'AL'#205'Q. ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape60: TQRShape
        Left = 727
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1923.520833333334000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel123: TQRLabel
        Left = 697
        Top = 598
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1844.145833333333000000
          1582.208333333333000000
          76.729166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'VALOR ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape61: TQRShape
        Left = 695
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1838.854166666667000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel124: TQRLabel
        Left = 659
        Top = 598
        Width = 35
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1743.604166666667000000
          1582.208333333333000000
          92.604166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'B. C'#193'LC. ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape62: TQRShape
        Left = 653
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1727.729166666667000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Left = 606
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1603.375000000000000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel125: TQRLabel
        Left = 612
        Top = 598
        Width = 35
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1619.250000000000000000
          1582.208333333333000000
          92.604166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'VALOR TOTAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape64: TQRShape
        Left = 561
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1484.312500000000000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel126: TQRLabel
        Left = 563
        Top = 598
        Width = 42
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1489.604166666667000000
          1582.208333333333000000
          111.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'VALOR UNIT'#193'RIO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape65: TQRShape
        Left = 526
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1391.708333333333000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel127: TQRLabel
        Left = 528
        Top = 598
        Width = 32
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1397.000000000000000000
          1582.208333333333000000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'QUANT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape66: TQRShape
        Left = 498
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1317.625000000000000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel128: TQRLabel
        Left = 500
        Top = 598
        Width = 25
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1322.916666666667000000
          1582.208333333333000000
          66.145833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'UNID'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape67: TQRShape
        Left = 470
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1243.541666666667000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel129: TQRLabel
        Left = 472
        Top = 598
        Width = 25
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1248.833333333333000000
          1582.208333333333000000
          66.145833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'CFOP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape68: TQRShape
        Left = 447
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1182.687500000000000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel130: TQRLabel
        Left = 450
        Top = 598
        Width = 19
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1190.625000000000000000
          1582.208333333333000000
          50.270833333333330000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'CST'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape69: TQRShape
        Left = 400
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          1058.333333333333000000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel131: TQRLabel
        Left = 403
        Top = 598
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1066.270833333333000000
          1582.208333333333000000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'NCM/SH'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape70: TQRShape
        Left = 50
        Top = 597
        Width = 1
        Height = 376
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          994.833333333333400000
          132.291666666666700000
          1579.562500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel132: TQRLabel
        Left = 4
        Top = 988
        Width = 139
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          2614.083333333333000000
          367.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INFORMA'#199#213'ES COMPLEMENTARES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape71: TQRShape
        Left = 400
        Top = 986
        Width = 353
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          1058.333333333333000000
          2608.791666666667000000
          933.979166666666600000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel133: TQRLabel
        Left = 404
        Top = 988
        Width = 89
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1068.916666666667000000
          2614.083333333333000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RESERVADO AO FISCO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo2: TQRMemo
        Left = 2
        Top = 620
        Width = 47
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          5.291666666666667000
          1640.416666666667000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo3: TQRMemo
        Left = 52
        Top = 620
        Width = 345
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          137.583333333333300000
          1640.416666666667000000
          912.812500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo4: TQRMemo
        Left = 402
        Top = 620
        Width = 43
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1063.625000000000000000
          1640.416666666667000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo5: TQRMemo
        Left = 449
        Top = 620
        Width = 21
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1187.979166666667000000
          1640.416666666667000000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo6: TQRMemo
        Left = 472
        Top = 620
        Width = 25
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1248.833333333333000000
          1640.416666666667000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo7: TQRMemo
        Left = 500
        Top = 620
        Width = 25
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1322.916666666667000000
          1640.416666666667000000
          66.145833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo8: TQRMemo
        Left = 528
        Top = 620
        Width = 31
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1397.000000000000000000
          1640.416666666667000000
          82.020833333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo9: TQRMemo
        Left = 563
        Top = 620
        Width = 42
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1489.604166666667000000
          1640.416666666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo10: TQRMemo
        Left = 608
        Top = 620
        Width = 43
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1608.666666666667000000
          1640.416666666667000000
          113.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo11: TQRMemo
        Left = 655
        Top = 620
        Width = 39
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1733.020833333333000000
          1640.416666666667000000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo12: TQRMemo
        Left = 697
        Top = 620
        Width = 29
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1844.145833333333000000
          1640.416666666667000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo13: TQRMemo
        Left = 729
        Top = 620
        Width = 22
        Height = 351
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          928.687500000000000000
          1928.812500000000000000
          1640.416666666667000000
          58.208333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRImage2: TQRImage
      Left = 508
      Top = 108
      Width = 261
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666666700000
        1344.083333333333000000
        285.750000000000000000
        690.562500000000000000)
      Picture.Data = {
        0A544A504547496D61676569150000FFD8FFE000104A46494600010101006000
        600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFC0000B080057012201012200FFC4001A00000301010101
        0000000000000000000005060700010403FFC4005C10000003050207070E0909
        040A0300000001020300040506110776121321313775B414153546B3B5C22232
        333641475161848586C4C5D71623343845538387C317242527425462A2C76671
        7481082644529295A1A3A4A5B1B2D1FFDA0008010100003F00A05AEA8786597C
        61F1C4C675794F1180B2038072D574C06860CA190443FCD92666893FA130C8A9
        22FAF09A6F33244107821153002A995FCA4290C003D5140BD4800E400C8C681E
        DEB7A27C5374AB84EB0E7B51DCD863544C57B88940483FB22054D30A8770850C
        C014392BAAA3C7C0AC69CCA6E896D45D6C21AE3140DC7439BC260C3365CFD50F
        859225E893F2D660E0F6ABEBC1DE4D2E46D732C654C2715135D204CC26AD708A
        0220039C2B91824E51B8ABAC8F1F784224F892C94EAF2EA9AA9AE6298A882461
        04C0406B82034100CCD517E50E518FE098C18A9921A82741EB133EE1C320780A
        3867A8661C21F08B24BCC4A2012F4CCB03F3C81D0992308A46054D54D34DC1E0
        E42146B90A53140C00190040042820DDB3989BFBFDB8CD90E7B7E79787277DD9
        897659531D34F05E4852E094468140C814CC0C12C6A35158AC5D3244226F6F65
        DF2453A2EB98FD48BA3F184B947354841A66A943C0C6A6789BFBB49F3AAE8BEB
        CA6B3B02789508A980C9562CF698E0880F53D41085C9DC280660063938BDBCBA
        58CC7E20EEF2AA2F69449E534D74CE255085088993000306500027534F064CD9
        181EF9BFFEFAF3A48DC3D94DF27FA9CFD8FF00873789B6F93F053F3D79D24EE1
        ECA6F93FD4E7EC7FC39BC4C11EE35140B19853F8449F01F0F0D7D399E31E6C60
        98B117521444D5AD40863143C00610CC2D529ED451CC1EF72A8747065B8AAE02
        9984B4509B9F00F93F68B846A0E70A8D338B2442226FEAD9859D3D28FAF07797
        B98D141E5632A613AC98ACB0090E35A98B4294283932078182C3A371552310E2
        9E26FA629E252D90E067838818AABA18CA80E5CA073000983F68728D58D6F93F
        053F3D79D24EE1ECA6F93FD4E7EC7FC39BC4DD92627107B1B2BDD0FAF2B6EEDF
        6DD58C54C6C7E0616061D47AAC1A052B9BB8C16578D455EA12F0A3CC49ED4384
        92FEF4065173184162BDAC52A80223D78140000D9E80195B935C6A28EB0740E8
        449F1330C92E0F42622E6288AC67A44A65320F5E20610136710110AB1A9DA24F
        CE836A62ECFAF086E1DE9DCB8B54C5DCF8783878141EA70AA35A52BDD6EEF93F
        FEFAF3A49DC3D94DF27FA9CFD8FF00873789B93744DFDD0619B9DF5E51C3F84F
        858B54C5C2C4E3B155A0E5C0A060FF00BB40A518D5ABBDBCC3A2D044DC1E1675
        2290D8C287040E29818C9BA61104694CA53650F00B05DF27EFDF5E746FBBBB29
        BE51F5D9FB27F167F1B05523514F80D393C6F93E63DDA1D01510531E6C248CAA
        498A8251AF5226111130867AE5AB1A8FC4DFD0B507E7445F5E53762CC90440A8
        95530101351050542014069826100110CC340AB1B955E9E5EA30F09AEF2AA850
        9D9FDD400E713002257458C54C2BFB00200205CC020191BB20BE3C3EC8F213C3
        D3C2ABACF5127A23C28A9C4C654A09BE0801847380090A20039B043C0C121313
        882B69F674E677D7933B3E4B692EF288AA6122CA0A2B089CE15A18D5280D472E
        40647198A3632963C630FF008EF8378EC66E93E16337DB17875AD70B03A9AE7A
        64CCCF13B449FDD7F2A9B99F5E50DC5BD3B9716A98B88C3C1C3C0A0F5385DDA5
        2BDD6E5A7446210EB4F49D1CDF5E1D9D865C7B5C5145531082A1517A301F0406
        9840252880E7A9407B8CEF670A1DF866DDD6733C622647C411C70E1E2D32E060
        90B5CC50AE400C80CF1B91DFF774BFE00645B6DD10C73C9F974D9026CED9ECEA
        F544B9C8ACC05E03B47D54FBB6C5198250E20DD557D4590259D1143EEACC1B42
        4CBD3D68F265BFEF5C919AC110E31DEB857B3DA7EF3DAC4DD7AA39CDAF2DACB3
        E7093AF976D6460160FC369EB54362883304DFDA4CFDF65CF2FCC7E7BD034CBA
        D5EB9D0CCBE3FD556DEF55803E681E0DAA9FF9D1D1ABF68D9DF2EA467D59A7F0
        5D11D975EA43687865F85F0D42F5ACABB11D983DEAB7640EF3DE7AE932FC9DC0
        8F370223B6ACDC9C7811DEE04376D41982D03BF0F997A2DBDEAB69DBE88F4BBF
        1D982D9F87601AAA39B10B2F8E7FBAB600AE8F27CD552DF24931F99F4BB11BD5
        2FECEAB3049DC38F37FE25B12EDACD347B66DAD5EF927E65F82E976CBAEAA3C8
        2EC81C49F453DB2D409FFBF0F997A2DCB5BD2EA1751F7677C6A059671D6F53F7
        41A80D3EB6DD10C73C9F974D9026CED9ECEAF544B9C8ACC05E03B47D54FBB6C5
        198250E20DD557D4590259D1143EEACC1B424CBD3D68F265BFEF5C919AC110E3
        1DEB857B3DA7EF3DAC4DD7AA39CDAF2DACB3E7093AF976D6460160FC369EB543
        62883304DFDA4CFDF65CF2FCC7E7BD034CBAD5EB9D0CCBE3FD556DEF55803E68
        1E0DAA9FF9D1D1ABF68D9DF2EA467D59A7F05D11D975EA43687865F85F0D42F5
        ACABB11D983DEAB7640EF3DE7AE932FC9DC08F370223B6ACDC9C7811DEE04376
        D41982D03BF0F997A2DBDEAB69DBE88F4BBF1D982D9F87601AAA39B10B2F8E7F
        BAB600AE8F27CD552DF24931F99F4BB11BD52FECEAB3049DC38F37FE25B12EDA
        CD347B66DAD5EF927E65F82E976CBAEAA3C82EC81C49F453DB2D409FFBF0F997
        A2DCB5BD2EA1751F7677C6A059671D6F53F741A80D3EB6DD10C73C9F974D9026
        CED9ECEAF544B9C8ACC05E03B47D54FBB6C5198250E20DD557D4590259D1143E
        EACC1B424CBD3D68F265BFEF5C919AC110E31DEB857B3DA7EF3DAC4DD7AA39CD
        AF2DACB3E7093AF976D6460160FC369EB54362883304DFDA4CFDF65CF2FCC7E7
        BD034CBAD5EB9D0CCBE3FD556DEF55803E681E0DAA9FF9D1D1ABF68D9DF2EA46
        7D59A7F05D11D975EA43687865F85F0D42F5ACABB11D983DEAB7640EF3DE7AE9
        32FC9DC08F370223B6ACDC9C7811DEE04376D41982D03BF0F997A2DBDEAB69DB
        E88F4BBF1D982D9F87601AAA39B10B2F8E7FBAB600AE8F27CD552DF24931F99F
        4BB11BD52FECEAB3049DC38F37FE25B12EDACD347B66DAD5EF927E65F82E976C
        BAEAA3C82EC81C49F453DB2D409FFBF0F997A2DCB5BD2EA1751F7677C6A05967
        1D6F53F741A80D3EB6DD10C73C9F974D9026CED9ECEAF544B9C8ACC05E03B47D
        54FBB6C5198250E20DD557D4590259D1143EEACC1B424CBD3D68F265BFEF5C91
        9AC110E31DEB857B3DA7EF3DAC4DD7AA39CDAF2DACB3E7093AF976D6460160FC
        369EB54362883304DFDA4CFDF65CF2FCC7E7BD034CBAD5EB9D0CCBE3FD556DEF
        55803E681E0DAA9FF9D1D1ABF68D9DF2EA467D59A7F05D11D975EA43687865F8
        5F0D42F5ACABB11D983DEAB7640EF3DE7AE932FC9DC08F370223B6ACDC9C7811
        DEE04376D41982D03BF0F997A2DBDEAB69DBE88F4BBF1D982D9F87601AAA39B1
        0B2F8E7FBAB600AE8F27CD552DF24931F99F4BB11BD52FECEAB3049DC38F37FE
        25B12EDACD347B66DAD5EF927E65F82E976CBAEAA3C82EC81C49F453DB2D409F
        FBF0F997A2DCB5BD2EA1751F7677C6A059671D6F53F741A80D3EB6DD10C73C9F
        974D9026CED9ECEAF544B9C8ACC05E03B47D54FBB6C5198250E20DD557D45902
        59D1143EEACC1B424CBD3D68F265BFEF5C919AC110E31DEB857B3DA7EF3DAC4D
        D7AA39CDAF2DACB3E7093AF976D6460160FC369EB54362883304DFDA4CFDF65C
        F2FCC7E7BD034CBAD5EB9D0CCBE3FD556DEF55803E681E0DAA9FF9D1D1ABF68D
        9DF2EA467D59A7F05D11D975EA43687865F85F0D42F5ACABB11D983DEAB7640E
        F3DE7AE932FC9DC08F370223B6ACDC9C7811DEE04376D41982D03BF0F997A2DB
        DEAB69DBE88F4BBF1D982D9F87601AAA39B10B2F8E7FBAB600AE8F27CD552DF2
        4931F99F4BB11BD52FECEAB3049DC38F37FE25B12EDACD347B66DAD5EF927E65
        F82E976CBAEAA3C82EC81C49F453DB2D409FFBF0F997A2DCB5BD2EA1751F7677
        C6A059671D6F53F741A80D3EB6DD10C73C9F974D9026CED9ECEAF544B9C8ACC0
        5E03B47D54FBB6C5198250E20DD557D4590259D1143EEACC1B424CBD3D68F265
        BFEF5C919AC110E31DEB857B3DA7EF3DAC4DD7AA39CDAF2DACB3E7093AF976D6
        460160FC369EB54362883304DFDA4CFDF65CF2FCC7E7BD034CBAD5EB9D0CCBE3
        FD556DEF55803E681E0DAA9FF9D1D1ABF68D9DF2EA467D59A7F05D11D975EA43
        687865F85F0D42F5ACABB11D983DEAB7640EF3DE7AE932FC9DC08F370223B6AC
        DC9C7811DEE04376D41982D03BF0F997A2DBDEAB69DBE88F4BBF1D982D9F8760
        1AAA39B10B2F8E7FBAB600AE8F27CD552DF24931F99F4BB11BD52FECEAB3049D
        C38F37FE25B12EDACD347B66DAD5EF927E65F82E976CBAEAA3C82EC81C49F453
        DB2D409FFBF0F997A2DCB5BD2EA1751F7677C6A059671D6F53F741A80D3EB6DD
        10C73C9F974D9026CED9ECEAF544B9C8ACC05E03B47D54FBB6C5198250E20DD5
        57D4590259D1143EEACC1B424CBD3D68F265BFEF5C919AC110E31DEB857B3DA7
        EF3DAC4DD7AA39CDAF2DACB3E7093AF976D6460160FC369EB54362883304DFDA
        4CFDF65CF2FCC7E7BD034CBAD5EB9D0CCBE3FD556DEF55803E681E0DAA9FF9D1
        D1ABF68D9DF2EA467D59A7F05D11D975EA43687865F85F0D42F5ACABB11D983D
        EAB7640EF3DE7AE932FC9DC08F370223B6ACDC9C7811DEE04376D41982D03BF0
        F997A2DBDEAB69DBE88F4BBF1D982D9F87601AAA39B10B2F8E7FBAB600AE8F27
        CD552DF24931F99F4BB11BD52FECEAB3049DC38F37FE25B12EDACD347B66DAD5
        EF927E65F82E976CBAEAA3C82EC81C49F453DB2D409FFBF0F997A2DCB5BD2EA1
        751F7677C6A059671D6F53F741A80D3EB6DD10C73C9F974D9026CED9ECEAF544
        B9C8ACC05E03B47D54FBB6C5198250E20DD557D4590259D1143EEACC1B424CBD
        3D68F265BFEF5C919AC110E31DEB857B3DA7EF3DAC4DD7AA39CDAF2DACB3E709
        3AF976D6460160FC369EB54362883304DFDA4CFDF65CF2FCC7E7BD034CBAD5EB
        9D0CCBE3FD556DEF55803E681E0DAA9FF9D1D1ABF68D9DF2EA467D59A7F05D11
        D975EA43687865F85F0D42F5ACABB11D983DEAB7640EF3DE7AE932FC9DC08F37
        0223B6ACDC9C7811DEE04376D41982D03BF0F997A2DBDEAB69DBE88F4BBF1D98
        2D9F87601AAA39B10B2F8E7FBAB600AE8F27CD552DF24931F99F4BB11BD52FEC
        EAB3049DC38F37FE25B12EDACD347B66DAD5EF927E65F82E976CBAEAA3C82EC8
        1C49F453DB2D409FFBF0F997A2DCB5BD2EA1751F7677C6A059671D6F53F741A8
        0D3FB6B0AD914703FC3F2E9B4FE6C10F84F677E29A6243FF00B22B30107F425A
        378E16F81FF9B14FFF0058F4A234F805E29595F5264196B2591C3C3FB2B306D0
        93009E42B67B3207F6F9E46BF6466AF4407B63BD50A1A7FCBD901E32CB336F83
        E14C6F2F9B5E5B596E4FF4839D0737CBB3FF008B2300B0AEA63298E4E15432D7
        27C89FD9826ECB244FA14CA38AC9E797D63F3D6822650EE6FABD65F3A1997F27
        869FAD3AD1B786B93F5A75AB017C0FD444182839214FFCE8E8D5DB451F960D38
        AB18F5664083688ECBE996934A3CBAEC06160011A85547E9595BFE8E4763DE1A
        E4FD69D6ADD90727E483266DF9CF933E132FC9E14823CE7A8483120A783F3D59
        B4E21FA09DAE043B6D418FCFF97F2C1E3DE5FF002EB5B7FF003F954AB69D69FA
        26BDCF85BF8EC7ED9070A3900CC1FA2E381FDDF99301CD9F27EAB28CBEAE8F67
        B0F0C2A5BE49263F3365B5D880FF006AA5FD9D566093B871E6FF00C47635DB96
        6A34B3EB380F0451EC69F64FCC060D92D72CBC7B812AA197EC1764010FF52443
        BBF05A99727D32CFF3F651B60F1EF2F41B96B541B5C406BC557D0FFB0F8D40B2
        C1CB3A78E697E1FF00E8D406191A8243E6284AF0A8ABBEE8725F071896198985
        826030652880865001C83DC6F03D4952FBEBCC39E5E5C30D6873D2AF8EA6C728
        18B594531A73500D41A9F2D06A01980003237DBE0B41C5188A3B93E2E2491D07
        B0C69FE30863AA73056B50A997547253AEA6600A7A5CE070F71170DCCEF8010F
        7517376EACC38B44702A5CA397B127946A3D4E7CA2C3DD648979CE129C29DE1E
        24724DD1E1CCA963D41A22B980CA96A26AF542501AD6A1DCA379DFECF65788C3
        9E9C9EA178C76797F3449626E854309E4C02531EA06A8540472064F131852090
        F585E709DC4774BD24F8B7C61830964B17806CF929894F20641C1CB9C6A3CF24
        CBCA20F8EC670AA4F8F2BBE2E5C729D5AAB2664943570B25487305032056A000
        395B4364897A0D1F7C8EB8380A1127D13EE85F1EA1B0F0CE0737522612854C00
        390029DCA37C20567B2B4B4F00BC2219B994050AB80E3D53F560450803431843
        AD5540A7F178829E87B92A5E7F728839BD43F0DDE214DD44C72818CA2C75C328
        1AA1F18A9CD929D753300007DDF65783C4A04F3057C73C643DE5632CAA22A9C3
        08E6505511A80D43AB111A00D3B99B237C7E044BDFB80F0AEFC76753E57F59D7
        7F2F5BE26C124CBC1F47FD2BBF3D994F967D675DFCBD6F89BCC7B3C960F03420
        8685D61C824A229A3BA14EA487548A9830B0B0B29D320E7EE53308831788C161
        D17153763BE370DD5673375662D525707185C8219F00B9738532086561E84932
        F3BC261909461F47285BD15F1CD2C72838A580C6301AA26A8E53186822219733
        79D2B3E95515D255385E0A892CEAB107742B90EEC989101EBBF64A2214CC3DDA
        8B7A82499783E8FF00A577E7B329F2CFACEBBF97ADF13721F24CBD0BDE7DC70F
        14779B1DB83E38E6C4E3AB8CCE61C2AD47AEAD3B946F33959E4ACE081917585E
        2D3338AB0C10078547F3650E639C994DDD318C35CE15C82D9F6CF6577E4088BD
        42F18995C1386800BC2A14764CE5390990DDC314A35CE34CA2DE9884932EC4F7
        E05F61F8DDF8C4EEFF008E5031D89A62F31BA9A503ADA57BB56EFC0997C3FD80
        78577E3B3A9F2BFACEBBF97ADF1371F649979FC52DD6E18CC56EBC0F8E5029BA
        B0B1F98DFB5846FEEAE4A37DE312B41E3EB3B2F1374DD07774974521154E5C12
        2C4C05428510AE117265CDDCA37C7E04CBD4A6F7E4DEADE7ECCA7C93EAFAEFE6
        EBBC6DE61B3C95861CFEE230BABB3FA4EC8BC93742BF18477000482B8550C102
        866A56996ADE87A92A5F7B8B2B155E1F84FCA3D3BBE195C72815590289523500
        D4EA40C214A506B9405BECE72B41DC5732CEAE82450CFEA448C6C69C6AF0A10C
        99CF947BA531829982B901B43A5683C1A1F0F717073145D61AA9D6752634E6C5
        9CC07030D44444722A7CF5CFE206F8A325401DA2D0B8AA50FC17D85BA839BA2B
        8E38E2910298A05A6150721CC151011CAC3FF25F276E2DC5BCFF009B6E5DC781
        BA56EC58EC7E0D70EBD93AAAE7EE56991884424997A29BF1BB61F8DDF8C4EEFF
        008E50B8EC4D31798DD4D281D6D2BDDAB68BC932FC722E58A44A1F8F7D0753B9
        82B8E50BF12729CA62D0A600CA0A1C2B4AE5CF901BDF0B81C3E0A2FA30F77C46
        ED7A3BE3C06198D86B1E9846CA234AD0320503C4C4DBFFD9}
      Stretch = True
    end
  end
  object dtsDados: TADODataSet
    Connection = dbConexao
    Parameters = <>
    Left = 8
    Top = 144
  end
  object dbConexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=master;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MYSQL-VIPRO'
    Provider = 'MSDASQL.1'
    Left = 8
    Top = 112
  end
end
