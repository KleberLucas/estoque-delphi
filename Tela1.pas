unit Tela1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.NumberBox,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    pnlTitle: TPanel;
    pnlForm: TPanel;
    Label1: TLabel;
    edtNomeProduto: TEdit;
    rdgCategoria: TRadioGroup;
    Label2: TLabel;
    nbxQuantidade: TNumberBox;
    pnlButtons: TPanel;
    pnlLists: TPanel;
    btnCadastrar: TButton;
    btnLimpar: TButton;
    mmoEletronico: TMemo;
    mmoMaterial: TMemo;
    mmoMedicamento: TMemo;
    mmoOutros: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); // Declaração do evento ao criar form
  private
    { Private declarations }
    function escolheMemo(categoria:String) : TMemo;
    procedure limpaCampos();
    procedure salvarHistorico(const NomeProduto, Quantidade, Categoria: string);
    procedure carregarDadosDoArquivo;
    function dadosValidos : Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  carregarDadosDoArquivo();
end;

function TForm1.dadosValidos : Boolean;
begin

  if (edtNomeProduto.Text = '') or (nbxQuantidade.Value = 0) or (rdgCategoria.ItemIndex = -1) then
  begin
    Result := false;
  end
  else
  begin
    Result := true;
  end;


end;


procedure TForm1.salvarHistorico(const NomeProduto, Quantidade, Categoria: string);
var
  Arquivo: TextFile;
  CaminhoArquivo: string;
begin
  // Define o caminho do arquivo (na mesma pasta do executável)
  CaminhoArquivo := ExtractFilePath(Application.ExeName) + 'cadastro_estoque.txt';

  // Abre o arquivo para adicionar conteúdo (cria se não existir)
  AssignFile(Arquivo, CaminhoArquivo);

  try
    // Verifica se o arquivo existe para decidir se escreve o cabeçalho
    if not FileExists(CaminhoArquivo) then
      Rewrite(Arquivo)  // Cria novo arquivo
    else
      Append(Arquivo);  // Abre existente para adicionar

    // Escreve os dados formatados
    WriteLn(Arquivo, 'Nome do Produto: ', NomeProduto);
    WriteLn(Arquivo, 'Quantidade: ', Quantidade);
    WriteLn(Arquivo, 'Categoria: ', Categoria);
    WriteLn(Arquivo, '-----------------------------');
    WriteLn(Arquivo, '');  // Linha em branco para separar registros

  finally
    CloseFile(Arquivo);  // Fecha o arquivo
  end;
end;


procedure TForm1.carregarDadosDoArquivo;
var
  Arquivo: TextFile;
  CaminhoArquivo: string;
  Linha, NomeProduto, Quantidade, Categoria: string;
  LinhaAtual: Integer;
begin

  CaminhoArquivo := ExtractFilePath(Application.ExeName) + 'cadastro_estoque.txt';
  // Verifica se o arquivo existe antes de tentar abrir
  if not FileExists(CaminhoArquivo) then
    Exit; // Se não existir, sai sem fazer nada

  AssignFile(Arquivo, CaminhoArquivo);
  try
    Reset(Arquivo); // Abre o arquivo para leitura
    LinhaAtual := 0;
    NomeProduto := '';
    Quantidade := '';
    Categoria := '';

    // Limpa todos os Memos antes de recarregar
    mmoEletronico.Clear;
    mmoMaterial.Clear;
    mmoMedicamento.Clear;
    mmoOutros.Clear;

    // Lê o arquivo linha por linha
    while not EOF(Arquivo) do
    begin
      ReadLn(Arquivo, Linha);
      Inc(LinhaAtual);

      // Extrai os dados baseado no formato do arquivo
      if Linha.StartsWith('Nome do Produto: ') then
        NomeProduto := Linha.Replace('Nome do Produto: ', '').Trim
      else if Linha.StartsWith('Quantidade: ') then
        Quantidade := Linha.Replace('Quantidade: ', '').Trim
      else if Linha.StartsWith('Categoria: ') then
        Categoria := Linha.Replace('Categoria: ', '').Trim
      else if Linha = '-----------------------------' then
      begin
        // Quando chega no separador, adiciona o produto ao Memo correspondente
        if (NomeProduto <> '') and (Quantidade <> '') and (Categoria <> '') then
        begin

          escolheMemo(Categoria).Lines.Add(Format('%s - Quantidade: %s', [NomeProduto, Quantidade]));
        end;

        // Reseta as variáveis para o próximo produto
        NomeProduto := '';
        Quantidade := '';
        Categoria := '';
      end;
    end;
  finally
    CloseFile(Arquivo); // Fecha o arquivo
  end;
end;


procedure TForm1.limpaCampos;
begin
  edtNomeProduto.Text := EmptyStr;
  nbxQuantidade.Value := 0;
  rdgCategoria.ItemIndex := -1;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  limpaCampos();
end;

function TForm1.escolheMemo(categoria: String): TMemo;
begin
  // Verifica a categoria e retorna o Memo correspondente
  if categoria = 'Eletronico' then
    Result := mmoEletronico
  else if categoria = 'Material' then
    Result := mmoMaterial
  else if categoria = 'Medicamento' then
    Result := mmoMedicamento
  else
    Result := mmoOutros; // Categoria padrão (Outros)
end;

procedure TForm1.btnCadastrarClick(Sender: TObject);
var
  strNomeProduto, categoriaProduto : string;
  quantidadeProduto : Integer;
begin

  if not(dadosValidos()) then
  begin
    ShowMessage('Preencha todos os dados!');
    Exit;
  end;


  strNomeProduto := edtNomeProduto.Text;
  quantidadeProduto := Round(nbxQuantidade.Value);

  case rdgCategoria.ItemIndex of
    0:
      categoriaProduto := 'Eletronico';
    1:
      categoriaProduto := 'Material';
    2:
      categoriaProduto := 'Medicamento';
    3:
      categoriaProduto := 'Outros';
  end;

  escolheMemo(categoriaProduto).Lines.Add(
    strNomeProduto + ' | ' + 'Quantidade: ' + quantidadeProduto.ToString
  );

  salvarHistorico(strNomeProduto, quantidadeProduto.ToString, categoriaProduto);

  limpaCampos();

end;

end.
