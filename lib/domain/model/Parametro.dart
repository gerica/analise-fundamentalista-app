import 'package:fundamentalista_app/domain/util/Utils.dart';

class Parametro {
  late String id;
  late String descricao;
  late bool ativo;
  late double valorRef;
  late bool maiorMelhor;

  Parametro.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'] as String;
    descricao = parsedJson['descricao'] as String;
    ativo = parsedJson['ativo'] as bool;
    valorRef = Utils.converterParaDouble(parsedJson['valorRef']);
    maiorMelhor = parsedJson['maiorMelhor'] as bool;
  }
}
