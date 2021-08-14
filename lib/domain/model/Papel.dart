import 'package:fundamentalista_app/domain/model/Fundamento.dart';

class Papel {
  late String nome;
  String? papel;
  List<Fundamento>? fundamentos;
  int? rank;

  Papel.fromJson(Map<String, dynamic> parsedJson) {
    nome = parsedJson['nome'] as String;
    papel = parsedJson['papel'] as String;
    rank = parsedJson['rank'] as int?;
    fundamentos = [];
    List<dynamic> listaFundamentos = parsedJson['fundamentos'] as List<dynamic>;
    if (listaFundamentos.isNotEmpty) {
      listaFundamentos.forEach((dynamic parsedJson) => {
            fundamentos!.add(Fundamento.fromJson(parsedJson as Map<String, dynamic>)),
          });
    }
  }
}
