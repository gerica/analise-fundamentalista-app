class Fundamento {
  String? descricao;
  double valor = 0;

  Fundamento.fromJson(Map<String, dynamic> parsedJson) {
    descricao = parsedJson['descricao'] as String;
    dynamic valorTemp = parsedJson['valor'];
    if (valorTemp != null) {
      if (valorTemp is int) {
        valor = (valorTemp as int).toDouble();
      } else {
        valor = valorTemp as double;
      }
    }
  }
}
