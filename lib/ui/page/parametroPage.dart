import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'package:fundamentalista_app/ui/page/BasePage.dart';
import 'package:fundamentalista_app/ui/viewModel/PapelViewModel.dart';
import 'package:fundamentalista_app/widget/PrimaryButton.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ParametroPage extends StatefulWidget {
  const ParametroPage({Key? key}) : super(key: key);

  @override
  _ParametroPageState createState() => _ParametroPageState();
}

class _ParametroPageState extends State<ParametroPage> with BasePage {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  get scaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Params'),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _carga(BuildContext context) async {
    try {
      var viewModel = Provider.of<PapelViewModel>(context, listen: false);
      await viewModel.carga();

      if (viewModel.error) {
        displaySnackBarError(context, viewModel.message);
      }
      displaySnackBar(context, viewModel.message);
    } catch (error) {
      displaySnackBarError(context, error.toString());
    }
  }
}
