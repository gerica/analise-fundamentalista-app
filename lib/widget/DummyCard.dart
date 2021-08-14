import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyCard extends StatefulWidget {
  final int tipo;
  DummyCard({this.tipo = 2});

  @override
  State<DummyCard> createState() => _DummyCardState();
}

class _DummyCardState extends State<DummyCard> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: Random().nextInt(5) + 1),
      // duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildLinhas(),
        ),
      ),
    );
  }

  List<Widget> _buildLinhas() {
    List<Widget> lista = [];
    switch (widget.tipo) {
      case (1):
        lista = _tipo1();
        break;
      case (2):
        lista = _tipo2();
        break;
      case (3):
        lista = _tipo3();
        break;
      default:
        lista = _tipo3();
        break;
    }
    return lista;
  }

  List<Widget> _tipo1() {
    List<Widget> lista = [];
    lista.add(LinearProgressIndicator(
      value: controller.value,
      color: Colors.grey,
      minHeight: 15,
      backgroundColor: Colors.grey[400],
    ));
    return lista;
  }

  List<Widget> _tipo2() {
    List<Widget> lista = [];

    lista.add(Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: LinearProgressIndicator(
        value: controller.value,
        color: Colors.grey,
        minHeight: 20,
        backgroundColor: Colors.grey[400],
      ),
    ));
    lista.add(SizedBox(height: 20));
    lista.add(LinearProgressIndicator(
      value: controller.value,
      color: Colors.grey,
      minHeight: 15,
      backgroundColor: Colors.grey[400],
    ));
    lista.add(SizedBox(height: 10));
    lista.add(LinearProgressIndicator(
      value: controller.value,
      color: Colors.grey,
      minHeight: 15,
      backgroundColor: Colors.grey[400],
    ));
    lista.add(SizedBox(height: 10));

    return lista;
  }

  List<Widget> _tipo3() {
    List<Widget> lista = [];

    lista.add(Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: LinearProgressIndicator(
        value: controller.value,
        color: Colors.grey,
        minHeight: 20,
        backgroundColor: Colors.grey[400],
      ),
    ));
    lista.add(SizedBox(height: 20));
    lista.add(LinearProgressIndicator(
      value: controller.value,
      color: Colors.grey,
      minHeight: 15,
      backgroundColor: Colors.grey[400],
    ));
    lista.add(SizedBox(height: 10));
    lista.add(Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: LinearProgressIndicator(
        value: controller.value,
        color: Colors.grey,
        minHeight: 100,
        backgroundColor: Colors.grey[400],
      ),
    ));
    lista.add(SizedBox(height: 10));
    lista.add(LinearProgressIndicator(
      value: controller.value,
      color: Colors.grey,
      minHeight: 15,
      backgroundColor: Colors.grey[400],
    ));

    return lista;
  }
}
