import 'package:fundamentalista_app/domain/util/Utils.dart';

class Fundamento {
  String? descricao;
  double valor = 0;

  Fundamento.fromJson(Map<String, dynamic> parsedJson) {
    descricao = parsedJson['descricao'] as String;
    dynamic valorTemp = parsedJson['valor'];
    valor = Utils.converterParaDouble(valorTemp);
  }
}
