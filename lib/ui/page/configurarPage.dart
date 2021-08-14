import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'package:fundamentalista_app/ui/viewModel/PapelViewModel.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ConfigurarPage extends StatefulWidget {
  const ConfigurarPage({Key? key}) : super(key: key);

  @override
  _ConfigurarPageState createState() => _ConfigurarPageState();
}

class _ConfigurarPageState extends State<ConfigurarPage> {
  Future<void> _analizarPapeis() async {
    var viewModel = Provider.of<PapelViewModel>(context, listen: false);
    await viewModel.analisar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('configrar'),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildContent() {
    var lista = context.watch<PapelViewModel>().lista;
    lista.forEach((Papel papel) => {
          developer.log('Papel - ${papel.papel}', name: 'ui.page.HomePage'),
        });
    return Container(child: Text("Sucesso"));
  }
}
