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
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
