import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/ui/page/BasePage.dart';
import 'package:fundamentalista_app/ui/viewModel/PapelViewModel.dart';
import 'package:fundamentalista_app/widget/CardFund.dart';
import 'package:fundamentalista_app/widget/FundDialog.dart';
import 'package:fundamentalista_app/widget/NavitationDrawer.dart';
import 'package:fundamentalista_app/widget/PrimaryButton.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
// import 'dart:developer' as developer;

class ConfigurarPage extends StatefulWidget {
  const ConfigurarPage({Key? key}) : super(key: key);

  @override
  _ConfigurarPageState createState() => _ConfigurarPageState();
}

class _ConfigurarPageState extends State<ConfigurarPage> with BasePage {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  get scaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      drawer: NavigationDrawer(),
      body: _buildContent(context),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildContent(BuildContext context) {
    if (kIsWeb) {
      return _buildContentWeb(context);
    }
    return _buildContentMobile(context);
  }

  Widget _buildContentWeb(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Realizar carga"),
          SizedBox(height: 20),
          CardFund(
            child: PrimaryButton(
              width: 70,
              titleText: "Carga",
              textStyle: Theme.of(context).textTheme.button,
              onPressed: () {
                this._carga(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentMobile(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            width: size.width * 0.7,
            titleText: "Carga",
            textStyle: Theme.of(context).textTheme.button,
            onPressed: () {
              this._carga(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _carga(BuildContext context) async {
    ProgressDialog? progress;

    try {
      progress = await FundDialog().customProgress(context, 'Espere...');
      var viewModel = Provider.of<PapelViewModel>(context, listen: false);
      await viewModel.carga();

      if (viewModel.error) {
        displaySnackBarError(context, viewModel.message);
      }
      displaySnackBar(context, viewModel.message);
    } catch (error) {
      displaySnackBarError(context, error.toString());
    }

    if (progress != null) {
      progress.close();
    }
  }
}
