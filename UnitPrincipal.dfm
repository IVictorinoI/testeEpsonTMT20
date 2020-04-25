object Form1: TForm1
  Left = 192
  Top = 125
  Width = 510
  Height = 343
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 752
    Top = 240
    Width = 257
    Height = 25
    Caption = 'Tenta imprimir direto pra USB [n'#227'o funciona]'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 752
    Top = 280
    Width = 305
    Height = 25
    Caption = 'Abre a selecao de impressora e imprime com arquivo'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 752
    Top = 312
    Width = 305
    Height = 25
    Caption = 'Tenta localizar e imprime'
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Comunica com dll'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 400
    Top = 8
    Width = 75
    Height = 25
    Caption = '<- Le status'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 752
    Top = 344
    Width = 305
    Height = 25
    Caption = 'Seleciona a impressora e imprime com arquivo'
    TabOrder = 5
    Visible = False
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 1064
    Top = 344
    Width = 257
    Height = 25
    Caption = 'Imprimir codigo de barras'
    TabOrder = 6
    Visible = False
    OnClick = Button7Click
  end
  object MemoResposta: TMemo
    Left = 208
    Top = 8
    Width = 185
    Height = 273
    TabOrder = 7
  end
  object Button8: TButton
    Left = 1104
    Top = 224
    Width = 75
    Height = 25
    Caption = 'LPT1'
    TabOrder = 8
    Visible = False
    OnClick = Button8Click
  end
  object PrintDialog1: TPrintDialog
    Copies = 1
    Left = 504
    Top = 280
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 552
    Top = 280
  end
end
