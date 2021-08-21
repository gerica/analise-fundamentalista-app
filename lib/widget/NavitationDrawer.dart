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
        // color: Color.fromRGBO(240, 216, 61, 1),
        color: Colors.amber[700],
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 78),
            _buildMenuItem(
              text: "Inicial",
              icon: Icons.home,
              onClicked: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomePage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildMenuItem(
              text: "Tabela Mágica",
              icon: Icons.table_chart,
              onClicked: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => TabelaMagicaPage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white),
            const SizedBox(height: 24),
            _buildMenuItem(
              text: "Configuração",
              icon: Icons.settings,
              onClicked: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ConfigurarPage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
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
}
