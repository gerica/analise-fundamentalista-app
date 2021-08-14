class Fundamento {
  String? descricao;
  double? valor;

  Fundamento.fromJson(Map<String, dynamic> parsedJson) {
    descricao = parsedJson['descricao'] as String;
    dynamic valorTemp = parsedJson['papel'];
    if (valorTemp != null) {
      valor = valorTemp as double;
    }
  }
}
