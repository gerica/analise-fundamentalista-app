import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'package:fundamentalista_app/domain/repository/PapelRepository.dart';
import 'package:fundamentalista_app/ui/viewModel/BaseViewModel.dart';
import 'dart:developer' as developer;

class PapelViewModel extends BaseViewModel {
  List<Papel> _lista = [];
  PapelViewModel();
  PapelRepository _papelRepository = PapelRepository();

  List<Papel> get lista => _lista;

  Future<void> analisar() async {
    init();
    developer.log('analisar', name: toString());
    setLoading(true);
    try {
      _lista = await _papelRepository.analisar();

      success = true;
    } on Exception catch (err) {
      tratarErro(err);
    }
    setLoading(false);
  }

  Future<void> carga() async {
    init();
    developer.log('Realizar carga', name: toString());
    setLoading(true);
    try {
      message = await _papelRepository.carga();

      success = true;
    } on Exception catch (err) {
      tratarErro(err);
    }
    setLoading(false);
  }
}
