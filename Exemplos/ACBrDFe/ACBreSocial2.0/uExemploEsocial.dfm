object FExemploEsocial: TFExemploEsocial
  Left = 344
  Top = 178
  Caption = 'Exemplo eSocial'
  ClientHeight = 565
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 730
    Height = 158
    Align = alTop
    Caption = ' Eventos de Tabela '
    TabOrder = 0
    object cbS1000: TCheckBox
      Left = 8
      Top = 23
      Width = 196
      Height = 17
      Caption = 'S-1000 Informa'#231#245'es do Empregador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object cbS1010: TCheckBox
      Left = 8
      Top = 65
      Width = 156
      Height = 17
      Caption = 'S-1010 Tabela de Rubricas'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object cbS1020: TCheckBox
      Left = 8
      Top = 86
      Width = 236
      Height = 17
      Caption = 'S-1020 Tabela de Lota'#231#245'es/Departamentos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object cbS1030: TCheckBox
      Left = 8
      Top = 108
      Width = 144
      Height = 17
      Caption = 'S-1030 Tabela de Cargos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object cbS1040: TCheckBox
      Left = 8
      Top = 129
      Width = 156
      Height = 17
      Caption = 'S-1040 Tabela de Fun'#231#245'es'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object cbS1080: TCheckBox
      Left = 346
      Top = 87
      Width = 224
      Height = 17
      Caption = 'S-1080 - Tabela de Operadores Portu'#225'rios'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbS2100: TCheckBox
      Left = 346
      Top = 108
      Width = 268
      Height = 17
      Caption = 'S-2100 - Cadastramento Inicial do V'#237'nculo'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object cbS1070: TCheckBox
      Left = 346
      Top = 65
      Width = 168
      Height = 17
      Caption = 'S-1070 - Tabela de Processos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object cbS1060: TCheckBox
      Left = 346
      Top = 44
      Width = 228
      Height = 17
      Caption = 'S-1060 Tabela de Ambientes de Trabalho'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS1050: TCheckBox
      Left = 346
      Top = 23
      Width = 248
      Height = 17
      Caption = 'S-1050 Tabela de Hor'#225'rios/Turnos de Trabalho'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object cbS1005: TCheckBox
      Left = 8
      Top = 44
      Width = 329
      Height = 17
      Caption = 'S-1005 Tabela de Estabelecimentos e Obras de Constru'#231#227'o Civil'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 299
    Width = 730
    Height = 188
    Align = alTop
    Caption = ' Eventos N'#227'o Peri'#243'dicos '
    TabOrder = 1
    object cbS2200: TCheckBox
      Left = 8
      Top = 34
      Width = 153
      Height = 17
      Caption = 'S-2200 -  Evento Admiss'#227'o'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbS2220: TCheckBox
      Left = 8
      Top = 106
      Width = 265
      Height = 17
      Caption = 'S-2220 -  Monitoramento da Sa'#250'de do Trabalhador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object cbS2240: TCheckBox
      Left = 8
      Top = 142
      Width = 332
      Height = 17
      Caption = 'S-2240 -  Condi'#231#245'es Ambientais do Trabalho - Fatores de Risco'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS2210: TCheckBox
      Left = 8
      Top = 88
      Width = 265
      Height = 17
      Caption = 'S-2210 - Comunica'#231#227'o de Acidente de Trabalho'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object cbS2250: TCheckBox
      Left = 346
      Top = 17
      Width = 233
      Height = 17
      Caption = 'S-2250 - Aviso Pr'#233'vio'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbS2298: TCheckBox
      Left = 346
      Top = 34
      Width = 153
      Height = 17
      Caption = 'S-2298 - Reintegra'#231#227'o'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object cbAviso: TComboBox
      Left = 469
      Top = 14
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 10
      Text = 'Aviso'
      Items.Strings = (
        'Aviso'
        'Cancelamento')
    end
    object cbS3000: TCheckBox
      Left = 346
      Top = 124
      Width = 175
      Height = 17
      Caption = 'S-3000 - Exclus'#227'o de Eventos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 16
    end
    object cbS4000: TCheckBox
      Left = 346
      Top = 142
      Width = 375
      Height = 17
      Caption = 
        'S-4000 - Solicita'#231#227'o de Totaliza'#231#227'o de Eventos, Bases e Contribu' +
        'i'#231#245'es'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 17
    end
    object cbS4999: TCheckBox
      Left = 346
      Top = 161
      Width = 343
      Height = 17
      Caption = 'S-4999 - Ades'#227'o antecipada ao eSocial'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 18
    end
    object cbS2190: TCheckBox
      Left = 8
      Top = 17
      Width = 321
      Height = 17
      Caption = 'S-2190 - Admiss'#227'o de Trabalhador - Registro Preliminar'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object cbS2205: TCheckBox
      Left = 8
      Top = 52
      Width = 289
      Height = 17
      Caption = 'S-2205 - Altera'#231#227'o de Dados Cadastrais do Trabalhador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object cbS2206: TCheckBox
      Left = 8
      Top = 70
      Width = 236
      Height = 17
      Caption = 'S-2206 - Altera'#231#227'o do Contrato de Trabalho'
      TabOrder = 3
    end
    object cbS2230: TCheckBox
      Left = 8
      Top = 124
      Width = 177
      Height = 17
      Caption = 'S-2230 - Afstamento Tempor'#225'rio'
      TabOrder = 6
    end
    object cbS2241: TCheckBox
      Left = 8
      Top = 161
      Width = 332
      Height = 17
      Caption = 'S-2241 - Insalubridade, Periculosidade e Aposentadoria Especial'
      TabOrder = 8
    end
    object cbS2299: TCheckBox
      Left = 346
      Top = 52
      Width = 135
      Height = 17
      Caption = 'S-2299 - Desligamento'
      TabOrder = 12
    end
    object cbS2300: TCheckBox
      Left = 346
      Top = 70
      Width = 233
      Height = 17
      Caption = 'S-2300 - Trabalhador Sem V'#237'nculo - In'#237'cio'
      TabOrder = 13
    end
    object cbS2305: TCheckBox
      Left = 346
      Top = 88
      Width = 311
      Height = 17
      Caption = 'S-2305 - Trabalhador Sem V'#237'nculo - Altera'#231#227'o Contratual'
      TabOrder = 14
    end
    object cbS2399: TCheckBox
      Left = 346
      Top = 106
      Width = 248
      Height = 17
      Caption = 'S-2399 - Trabalhador Sem V'#237'nculo - T'#233'rmino'
      TabOrder = 15
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 158
    Width = 730
    Height = 141
    Align = alTop
    Caption = ' Eventos Peri'#243'dicos '
    TabOrder = 2
    object cbS1220: TCheckBox
      Left = 8
      Top = 74
      Width = 289
      Height = 17
      Caption = 'S-1220 - Pagamentos a Benefici'#225'rios N'#227'o Identificados'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object cbS1298: TCheckBox
      Left = 346
      Top = 56
      Width = 289
      Height = 17
      Caption = 'S-1298 - Reabertura dos Eventos Peri'#243'dicos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object cbS1299: TCheckBox
      Left = 346
      Top = 74
      Width = 289
      Height = 17
      Caption = 'S-1299 - Fechamento dos Eventos Peri'#243'dicos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbS1300: TCheckBox
      Left = 346
      Top = 91
      Width = 289
      Height = 15
      Caption = 'S-1300 - Contribui'#231#227'o Sindical Patronal'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object cbS1280: TCheckBox
      Left = 346
      Top = 37
      Width = 321
      Height = 18
      Caption = 'S-1280 - Informa'#231#245'es Complementares aos Eventos Peri'#243'dicos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS1270: TCheckBox
      Left = 346
      Top = 19
      Width = 332
      Height = 17
      Caption = 'S-1270 - Contrata'#231#227'o de Trabalhadores Avulsos N'#227'o Portu'#225'rios'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object cbS1250: TCheckBox
      Left = 8
      Top = 91
      Width = 332
      Height = 16
      Caption = 'S-1250 - Aquisi'#231#227'o de Produ'#231#227'o Rural'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object cbS1260: TCheckBox
      Left = 8
      Top = 108
      Width = 332
      Height = 17
      Caption = 'S-1260 - Comercializa'#231#227'o da Produ'#231#227'o Rural Pessoa F'#237'sica'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object cbS1200: TCheckBox
      Left = 8
      Top = 19
      Width = 209
      Height = 17
      Caption = 'S-1200 Remunera'#231#227'o do Trabalhador'
      TabOrder = 0
    end
    object cbS1210: TCheckBox
      Left = 8
      Top = 56
      Width = 273
      Height = 17
      Caption = 'S-1210 - Pagamentos de Rendimentos do Trabalho'
      TabOrder = 2
    end
    object cbS1202: TCheckBox
      Left = 8
      Top = 37
      Width = 209
      Height = 17
      Caption = 'S-1202 - Remunera'#231#227'o de trabalhadores RPPS'
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 488
    Width = 730
    Height = 77
    Align = alBottom
    Caption = ' Dados Adicionais '
    TabOrder = 3
    object btnGerar: TButton
      Left = 290
      Top = 25
      Width = 109
      Height = 25
      Caption = 'Gerar Arquivos'
      TabOrder = 0
      OnClick = btnGerarClick
    end
  end
  object ACBreSocial1: TACBreSocial
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.PathSalvar = 'C:\teste_esocial\'
    Configuracoes.Arquivos.PathSchemas = 'P:\ACBreSocial\trunk\Exemplos\ACBrDFe\ACBreSocial2.0\Schemas\'
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.Certificados.ArquivoPFX = 'C:\Users\cantu\Desktop\GP DISTRIBUIDORA DE COMBUSTIVEIS .pfx'
    Configuracoes.Certificados.NumeroSerie = '39373B633A2520ACCD28A254467D0A6E'
    Configuracoes.Certificados.Senha = 'trevo'
    Left = 648
    Top = 32
  end
end
