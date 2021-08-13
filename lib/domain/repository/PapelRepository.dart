import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'dart:developer' as developer;

class PapelRepository {
  Future<List<Papel>> analisar() async {
    developer.log('analisar', name: 'domain.repository.PapelRepository');
    List<Papel> resultado = [];
    await Future<void>.delayed(Duration(milliseconds: 100));
    return resultado;
  }
}
