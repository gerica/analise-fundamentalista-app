import 'package:fundamentalista_app/domain/model/Parametro.dart';
import 'package:fundamentalista_app/domain/repository/ParametroRepository.dart';
import 'package:fundamentalista_app/ui/viewModel/BaseViewModel.dart';
import 'dart:developer' as developer;

class ParametroViewModel extends BaseViewModel {
  List<Parametro> _lista = [];
  ParametroViewModel();
  ParametroRepository _repository = ParametroRepository();

  List<Parametro> get lista => _lista;

  Future<void> recuperar() async {
    developer.log('Recuperar', name: toString());
    init();
    _lista = [];
    setLoading(true);
    try {
      _lista = await _repository.recuperar();

      success = true;
    } on Exception catch (err) {
      tratarErro(err);
    }
    setLoading(false);
  }

  Future<void> alterar(Parametro parametro) async {
    developer.log('Alterar', name: toString());
    init();
    // setLoading(true);
    try {
      message = await _repository.alterar(parametro);
      success = true;
    } on Exception catch (err) {
      tratarErro(err);
    }
    // setLoading(false);
  }
}
