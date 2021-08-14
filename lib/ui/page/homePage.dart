import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/ui/page/configurarPage.dart';
import 'package:fundamentalista_app/ui/page/tabelaMagicaPage.dart';
import 'package:fundamentalista_app/widget/PrimaryButton.dart';
// import 'dart:developer' as developer;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              width: size.width * 0.7,
              titleText: "Tabela mágica",
              textStyle: Theme.of(context).textTheme.button,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => TabelaMagicaPage(),
                ),
              ),
            ),
            SizedBox(height: 15),
            PrimaryButton(
              width: size.width * 0.7,
              titleText: "Configurar",
              textStyle: Theme.of(context).textTheme.button,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ConfigurarPage(),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
