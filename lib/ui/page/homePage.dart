import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/widget/NavitationDrawer.dart';
// import 'dart:developer' as developer;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle? bodyText2 = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: bodyText2,
                children: <TextSpan>[
                  TextSpan(text: 'Fórmula mágica de '),
                  TextSpan(text: 'Joel Greenblatt', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: bodyText2,
                children: <TextSpan>[
                  TextSpan(text: 'As empresas de maior '),
                  TextSpan(text: 'ROE ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'são as mais rentáveis'),
                ],
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: bodyText2,
                children: <TextSpan>[
                  TextSpan(text: 'As empresas de menor '),
                  TextSpan(text: 'P/L ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'são as mais baratas'),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Fórmula mágica de Joel Greenblatt
// Para ficar mais fácil de de você entender, vamos fazer um passo a passo simplificado de como Joel Greenblatt usa a sua fórmula mágica para encontrar as melhores barganhas da Bolsa de Valores..
//
// Escolha alguns papéis que lhe interessam para compor seu portfólio;
// Calcule o ROE e o índice P/L de cada um dos ativos;
// Construa 2 Rankings: As empresas de maior ROE são as mais rentáveis e as de menor P/L são as mais baratas;
// Some a posição de cada companhia em cada um dos rankings e ordena estas somas em ordem crescente;
// Resultado: As empresas de menor soma no ranking combinado são aquelas que teriam a melhor combinação de índices.
