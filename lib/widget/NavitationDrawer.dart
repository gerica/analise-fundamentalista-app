import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/ui/page/configurarPage.dart';
import 'package:fundamentalista_app/ui/page/homePage.dart';
import 'package:fundamentalista_app/ui/page/parametroPage.dart';
import 'package:fundamentalista_app/ui/page/tabelaMagicaPage.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: Color.fromRGBO(100, 216, 61, 1),
        color: Colors.amber[700],
        child: ListView(
          children: [
            _buildHeader(name: "Rogério Cardoso"),
            Container(
              padding: padding,
              child: Column(
                children: [
                  _buildMenuItem(
                    text: "Inicial",
                    icon: Icons.home,
                    onClicked: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    text: "Tabela Mágica",
                    icon: Icons.table_chart,
                    onClicked: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => TabelaMagicaPage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.white),
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    text: "Configuração",
                    icon: Icons.settings,
                    onClicked: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ConfigurarPage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    text: "Parâmetro",
                    icon: Icons.star_border,
                    onClicked: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ParametroPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget _buildHeader({required String name}) {
    return Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('res/images/eu.jpeg'),
          ),
          SizedBox(width: 20),
          Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}

// AssetImage('graphics/background.png')
