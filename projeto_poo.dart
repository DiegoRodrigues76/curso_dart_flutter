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

  // Método para exibir informações
  void exibirInformacoes() {
    print('Pessoa: $nome (ID: $id)');
  }
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

  @override
  void exibirInformacoes() {
    super.exibirInformacoes(); // Chama o método da superclasse (Pessoa)
    print('Fornecedor CNPJ: $cnpj, Endereço: $logradouro, $bairro, $cidade - $estado');
  }
}

class Cliente extends Pessoa {
  String endereco;

  Cliente({
    required String id,
    required String nome,
    required String cpf,
    required String rg,
    required String telefone,
    required String email,
    required DateTime dataCadastro,
    required DateTime dataNascimento,
    required this.endereco,
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

  @override
  void exibirInformacoes() {
    super.exibirInformacoes(); // Chama o método da superclasse (Pessoa)
    print('Cliente Endereço: $endereco, Telefone: $telefone');
  }
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

  // Método para exibir informações do produto
  void exibirInformacoes() {
    print('Produto: $nome (ID: $id), Fornecedor: ${fornecedor.nome}');
  }

  // Método de exemplo para listar produtos
  static List<Produto> listarProdutos() {
    // implementação de exemplo
    return [];
  }
}

void main() {
  // Criando uma pessoa
  Pessoa pessoa = Pessoa(
    id: '1',
    nome: 'João Silva',
    cpf: '000.000.000-00',
    rg: '00.000.000-0',
    telefone: '(11) 99999-9999',
    email: 'joao@example.com',
    dataCadastro: DateTime.now(),
    dataNascimento: DateTime(1980, 1, 1),
  );

  // Criando um fornecedor
  Fornecedor fornecedor = Fornecedor(
    id: '2',
    nome: 'Fornecedor A',
    cpf: '111.111.111-11',
    rg: '11.111.111-1',
    telefone: '(11) 99999-9998',
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

  // Criando um cliente
  Cliente cliente = Cliente(
    id: '3',
    nome: 'Maria Souza',
    cpf: '222.222.222-22',
    rg: '22.222.222-2',
    telefone: '(11) 99999-9997',
    email: 'maria@example.com',
    dataCadastro: DateTime.now(),
    dataNascimento: DateTime(1990, 5, 10),
    endereco: 'Avenida X, 123',
  );

  // Lista de pessoas
  List<Pessoa> pessoas = [pessoa, fornecedor, cliente];

  // Iterando sobre a lista e exibindo informações
  for (var p in pessoas) {
    p.exibirInformacoes(); // Chamada polimórfica
  }

  // Criando um produto e exibindo suas informações
  Produto produto = Produto(
    id: '001',
    codigo: 'P001',
    nome: 'Produto X',
    descricao: 'Descrição do Produto X',
    fornecedor: fornecedor,
    dataCadastro: DateTime.now(),
  );

  produto.exibirInformacoes();
}
