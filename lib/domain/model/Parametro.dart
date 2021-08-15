class Parametro {
  late String descricao;
  late bool ativo;
  late double valorRef;
  late bool maiorMelhor;

  Parametro.fromJson(Map<String, dynamic> parsedJson) {
    descricao = parsedJson['descricao'] as String;
    ativo = parsedJson['ativo'] as bool;
    valorRef = parsedJson['valorRef'] as double;
    maiorMelhor = parsedJson['maiorMelhor'] as bool;
  }
}
