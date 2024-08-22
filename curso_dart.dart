void main() {
  
  // 1 - Introdução a Variáveis

  String variavelNome = "Diego";
  print(variavelNome);

  int variavelValor = 10;
  print(variavelValor);

  bool varialvelBool = true;
  print(varialvelBool);

  List<String> listaDePalavras = ["Diego", "Rodrigues"];
  print('${listaDePalavras[0]} - ${listaDePalavras[1]}');

  // 2 - Introdução ao null-safety

  String? nome;
  // print(nome!); -> Error: TypeError. Unexpected null value.
  nome = "Dart";
  print(nome!); 
  
  nome = null;

  late String sobrenome;
  sobrenome = "Flutter";
  print(sobrenome);
  // sobrenome = null; -> Error: The value 'null' can't be assigned to a variable of type 'String' because 'String' is not nullable.
}
