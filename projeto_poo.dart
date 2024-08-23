class Pessoa {
  String id;
  String nome;
  String cpf;
  String rg;
  String telefone;
  String email;
  DateTime dataCadastro;
  DateTime dataNascimento;

  Pessoa({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.telefone,
    required this.email,
    required this.dataCadastro,
    required this.dataNascimento,
  });
}

class Fornecedor extends Pessoa {
  String cnpj;
  String logradouro;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Fornecedor({
    required String id,
    required String nome,
    required String cpf,
    required String rg,
    required String telefone,
    required String email,
    required DateTime dataCadastro,
    required DateTime dataNascimento,
    required this.cnpj,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
  }) : super(
          id: id,
          nome: nome,
          cpf: cpf,
          rg: rg,
          telefone: telefone,
          email: email,
          dataCadastro: dataCadastro,
          dataNascimento: dataNascimento,
        );
}

class Produto {
  String id;
  String codigo;
  String nome;
  String descricao;
  Fornecedor fornecedor;
  DateTime dataCadastro;

  Produto({
    required this.id,
    required this.codigo,
    required this.nome,
    required this.descricao,
    required this.fornecedor,
    required this.dataCadastro,
  });

  static List<Produto> _produtos = [];

  void cadastrarProduto() {
    _produtos.add(this);
    print('Produto ${this.nome} cadastrado com sucesso!');
  }

  static Produto? buscarProdutoPorNome(String nome) {
    for (var produto in _produtos) {
      if (produto.nome.toLowerCase() == nome.toLowerCase()) {
        return produto;
      }
    }
    print('Produto $nome não encontrado.');
    return null;
  }

  static List<Produto> listarProdutos() {
    return _produtos;
  }

  void deletarProduto() {
    _produtos.remove(this);
    print('Produto ${this.nome} deletado com sucesso!');
  }
}

class Estoque {
  Produto produto;
  int quantidade;
  String armazen;
  String prateleira;

  Estoque({
    required this.produto,
    required this.quantidade,
    required this.armazen,
    required this.prateleira,
  });

  static List<Estoque> _estoque = [];

  void adicionarEstoque(int quantidadeAdicional) {
    this.quantidade += quantidadeAdicional;
    print(
        'Adicionado $quantidadeAdicional do produto ${produto.nome} ao estoque.');
  }

  void removerEstoque(int quantidadeRemover) {
    if (this.quantidade >= quantidadeRemover) {
      this.quantidade -= quantidadeRemover;
      print(
          'Removido $quantidadeRemover do produto ${produto.nome} do estoque.');
    } else {
      print('Quantidade insuficiente no estoque para remover.');
    }
  }

  static void atualizarEstoque(Produto produto, int novaQuantidade) {
    for (var item in _estoque) {
      if (item.produto.id == produto.id) {
        item.quantidade = novaQuantidade;
        print(
            'Estoque do produto ${produto.nome} atualizado para $novaQuantidade.');
        return;
      }
    }
    print('Produto ${produto.nome} não encontrado no estoque.');
  }

  static List<Estoque> listarProdutosDisponiveis() {
    return _estoque;
  }

  void cadastrarEstoque() {
    _estoque.add(this);
    print('Estoque para o produto ${produto.nome} cadastrado com sucesso!');
  }
}

void main() {
  // Criando um fornecedor
  Fornecedor fornecedor = Fornecedor(
    id: '1',
    nome: 'Fornecedor A',
    cpf: '000.000.000-00',
    rg: '00.000.000-0',
    telefone: '(11) 99999-9999',
    email: 'fornecedor@example.com',
    dataCadastro: DateTime.now(),
    dataNascimento: DateTime(1980, 1, 1),
    cnpj: '00.000.000/0001-00',
    logradouro: 'Rua A',
    bairro: 'Bairro B',
    cidade: 'Cidade C',
    estado: 'Estado D',
    cep: '00000-000',
  );

  // Criando um produto
  Produto produto = Produto(
    id: '1',
    codigo: 'P001',
    nome: 'Produto 1',
    descricao: 'Descrição do Produto 1',
    fornecedor: fornecedor,
    dataCadastro: DateTime.now(),
  );

  // Cadastrando o produto
  produto.cadastrarProduto();

  // Adicionando produto ao estoque
  Estoque estoque = Estoque(
    produto: produto,
    quantidade: 100,
    armazen: 'A1',
    prateleira: 'P1',
  );
  estoque.cadastrarEstoque();

  // Atualizando o estoque
  estoque.adicionarEstoque(50);

  // Removendo produtos do estoque
  estoque.removerEstoque(30);

  // Listando produtos disponíveis no estoque
  List<Estoque> produtosDisponiveis = Estoque.listarProdutosDisponiveis();
  for (var item in produtosDisponiveis) {
    print('Produto: ${item.produto.nome}, Quantidade: ${item.quantidade}');
  }

  // Buscando um produto por nome
  Produto? produtoBuscado = Produto.buscarProdutoPorNome('Produto 1');
  if (produtoBuscado != null) {
    print('Produto encontrado: ${produtoBuscado.nome}');
  }

  // Deletando um produto
  produto.deletarProduto();

  // Listando todos os produtos
  List<Produto> todosProdutos = Produto.listarProdutos();
  for (var prod in todosProdutos) {
    print('Produto: ${prod.nome}');
  }
}
