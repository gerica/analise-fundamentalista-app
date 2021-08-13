import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'package:fundamentalista_app/domain/repository/PapelRepository.dart';
import 'package:fundamentalista_app/ui/viewModel/BaseViewModel.dart';
import 'dart:developer' as developer;

class PapelViewModel extends BaseViewModel {
  List<Papel> _lista = [];
  PapelViewModel();
  PapelRepository _papelRepository = PapelRepository();

  Future<void> analisar() async {
    init();
    developer.log('analisar', name: 'ui.viewModel.PapelViewModel');
    setLoading(true);
    try {
      _lista = await _papelRepository.analisar();

      success = true;
    } on Exception catch (err) {
      tratarErro(err);
    }
    setLoading(false);
  }
}
