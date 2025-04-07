object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 538
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 41
    Align = alTop
    Caption = 'Gerenciamento de Estoque'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 625
  end
  object pnlForm: TPanel
    Left = 0
    Top = 41
    Width = 755
    Height = 231
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 49
    ExplicitWidth = 569
    ExplicitHeight = 217
    object Label1: TLabel
      Left = 25
      Top = 25
      Width = 147
      Height = 23
      Caption = 'Nome do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 25
      Top = 113
      Width = 97
      Height = 23
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNomeProduto: TEdit
      Left = 25
      Top = 54
      Width = 336
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object rdgCategoria: TRadioGroup
      Left = 496
      Top = 6
      Width = 217
      Height = 200
      Caption = 'Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'Eletr'#244'nico'
        'Material'
        'Medicamento'
        'Outros')
      ParentFont = False
      TabOrder = 1
    end
    object nbxQuantidade: TNumberBox
      Left = 25
      Top = 142
      Width = 336
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnlLists: TPanel
    Left = 0
    Top = 272
    Width = 930
    Height = 266
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 775
    DesignSize = (
      930
      266)
    object Label3: TLabel
      Left = 8
      Top = 13
      Width = 76
      Height = 21
      Caption = 'Eletronicos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 247
      Top = 13
      Width = 64
      Height = 21
      Caption = 'Materiais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 488
      Top = 13
      Width = 102
      Height = 21
      Caption = 'Medicamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 721
      Top = 13
      Width = 48
      Height = 21
      Caption = 'Outros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object mmoEletronico: TMemo
      Left = 8
      Top = 40
      Width = 209
      Height = 225
      Anchors = [akBottom]
      Enabled = False
      TabOrder = 0
    end
    object mmoMaterial: TMemo
      Left = 247
      Top = 40
      Width = 209
      Height = 225
      Anchors = [akBottom]
      Enabled = False
      TabOrder = 1
    end
    object mmoMedicamento: TMemo
      Left = 488
      Top = 40
      Width = 209
      Height = 225
      Anchors = [akBottom]
      Enabled = False
      TabOrder = 2
    end
    object mmoOutros: TMemo
      Left = 721
      Top = 40
      Width = 209
      Height = 225
      Anchors = [akBottom]
      Enabled = False
      TabOrder = 3
    end
  end
  object pnlButtons: TPanel
    Left = 755
    Top = 41
    Width = 175
    Height = 231
    Align = alRight
    Color = clBackground
    ParentBackground = False
    TabOrder = 3
    object btnCadastrar: TButton
      Left = 32
      Top = 51
      Width = 120
      Height = 35
      Caption = 'Cadastrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TButton
      Left = 32
      Top = 139
      Width = 120
      Height = 35
      Caption = 'Limpar Campos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimparClick
    end
  end
end
