import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/domain/model/Parametro.dart';
import 'package:fundamentalista_app/ui/page/BasePage.dart';
import 'package:fundamentalista_app/ui/viewModel/ParametroViewModel.dart';
import 'package:fundamentalista_app/widget/CardFund.dart';
import 'package:fundamentalista_app/widget/FieldTextFund.dart';
import 'package:fundamentalista_app/widget/InputHelper.dart';
import 'package:fundamentalista_app/widget/NavitationDrawer.dart';
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
  final double sizeBetween = 10;

  @override
  void initState() {
    this._initDados();
    super.initState();
  }

  _initDados() async {
    developer.log("Init dados", name: this.toString());
    var viewModel = Provider.of<ParametroViewModel>(context, listen: false);
    await viewModel.recuperar();
  }

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
      body: SafeArea(
        // child: SingleChildScrollView(
        child: _buildContent(context),
        // ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (kIsWeb) {
      return _buildContentWeb(context);
    }
    return _buildContentMobile(context);
  }

  List<Widget> _buildForm(BuildContext context, Parametro param, InputHelper field, String? fieldError) {
    List<Widget> result = [];
    result.add(SizedBox(height: sizeBetween));
    TextStyle? bodyText2 = Theme.of(context).textTheme.bodyText2;
    result.add(
      Row(
        children: [
          RichText(
            text: TextSpan(
              style: bodyText2,
              children: <TextSpan>[
                TextSpan(text: "Parâmetro: "),
                TextSpan(text: '${param.descricao}', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
    );

    result.add(Row(
      children: [
        Text("Valor: "),
        Container(
          width: 100,
          child: TextFieldFund(
            addLabel: false,
            hint: "Valor",
            focusNode: field.focusNode,
            errorText: fieldError,
            controller: field.controller,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            textInputType: TextInputType.number,
          ),
        ),
      ],
    ));
    result.add(
      GestureDetector(
        onTap: () {
          setState(() {
            param.maiorMelhor = !param.ativo;
          });
        },
        child: Row(
          children: [
            Text("Ativo: "),
            Checkbox(
              value: param.ativo,
              onChanged: (value) {
                setState(() {
                  param.ativo = !param.ativo;
                });
              },
            ),
          ],
        ),
      ),
    );
    result.add(
      GestureDetector(
        onTap: () {
          setState(() {
            param.maiorMelhor = !param.maiorMelhor;
          });
        },
        child: Row(
          children: [
            Text("Maior Melhor: "),
            Checkbox(
              value: param.maiorMelhor,
              onChanged: (value) {
                setState(() {
                  param.maiorMelhor = !param.maiorMelhor;
                });
              },
            ),
          ],
        ),
      ),
    );
    return result;
  }

  _salvarParametro(Parametro param, InputHelper field, String? fieldError) async {
    if (!_validate(field, fieldError)) {
      displaySnackBarWarning(context, 'Campos obrigatório não informado!');
      return;
    }
    var viewModel = Provider.of<ParametroViewModel>(context, listen: false);
    try {
      param.valorRef = double.parse(field.text);
      await viewModel.alterar(param);

      if (viewModel.error) {
        displaySnackBarError(context, viewModel.message);
      }
      displaySnackBar(context, viewModel.message);
    } catch (error) {
      displaySnackBarError(context, error.toString());
    }
  }

  bool _validate(InputHelper field, String? fieldError) {
    bool isValid = true;

    if (field.controller.text.isEmpty) {
      fieldError = "Campo obrigatório";
      isValid = false;
    }

    setState(() {});
    return isValid;
  }

  Widget _buildContentWeb(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ParametroViewModel>(context, listen: true);
    if (viewModel.loading) {
      return this.buildLoading();
    }
    List<Widget> cards = [];
    if (viewModel.lista.isNotEmpty) {
      viewModel.lista.forEach((Parametro param) {
        InputHelper _field = InputHelper.text();
        String? _fieldError;
        _field.text = param.valorRef.toString();
        cards.add(
          Container(
            width: 250,
            child: CardFund(
              // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[..._buildForm(context, param, _field, _fieldError)],
                        // children: [Text("Teste")],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5, right: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: PrimaryButton(
                        onPressed: () => {_salvarParametro(param, _field, _fieldError)},
                        titleText: 'Salvar',
                        width: 71,
                        textStyle: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 12,
        children: [...cards],
      ),
    );
  }

  Widget _buildContentMobile(BuildContext context) {
    var viewModel = Provider.of<ParametroViewModel>(context, listen: true);
    if (viewModel.loading) {
      return this.buildLoading();
    }
    Size size = MediaQuery.of(context).size;
    List<Widget> cards = [];
    if (viewModel.lista.isNotEmpty) {
      viewModel.lista.forEach((Parametro param) {
        InputHelper _field = InputHelper.text();
        String? _fieldError;
        _field.text = param.valorRef.toString();
        cards.add(
          CardFund(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[..._buildForm(context, param, _field, _fieldError)],
                      // children: [Text("Teste")],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                      onPressed: () => {_salvarParametro(param, _field, _fieldError)},
                      titleText: 'Salvar',
                      width: size.width * 0.4,
                      textStyle: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: sizeBetween), ...cards],
        ),
      ),
    );
  }
}
