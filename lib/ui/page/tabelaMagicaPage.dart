import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamentalista_app/domain/model/Fundamento.dart';
import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'package:fundamentalista_app/ui/viewModel/PapelViewModel.dart';
import 'package:fundamentalista_app/widget/DummyCard.dart';
import 'package:fundamentalista_app/widget/NavitationDrawer.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;

class TabelaMagicaPage extends StatefulWidget {
  const TabelaMagicaPage({Key? key}) : super(key: key);

  @override
  _TabelaMagicaPageState createState() => _TabelaMagicaPageState();
}

class _TabelaMagicaPageState extends State<TabelaMagicaPage> with AfterLayoutMixin {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  PapelData papelData = PapelData();
  int sortType = sortName;
  String _urlFundamento = 'http://www.fundamentus.com.br/detalhes.php?papel=';

  @override
  void initState() {
    // this._analizarPapeis();
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    this._analizarPapeis();
  }

  Future<void> _analizarPapeis() async {
    var viewModel = Provider.of<PapelViewModel>(context, listen: false);
    await viewModel.analisar();
    papelData.lista = viewModel.lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamentalistas'),
      ),
      drawer: NavigationDrawer(),
      body: _getBodyWidget(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _getBodyWidget() {
    PapelViewModel viewModel = context.watch<PapelViewModel>();
    if (viewModel.loading) {
      return Column(
        children: [
          DummyCard(tipo: 1),
          DummyCard(tipo: 1),
          DummyCard(tipo: 1),
          DummyCard(tipo: 1),
          DummyCard(tipo: 1),
          DummyCard(tipo: 1),
        ],
      );
    }
    if (viewModel.error) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(viewModel.message, style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
      );
    }

    if (papelData.lista.isEmpty) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text("Lista de papeis vazio", style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
      );
    }

    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 2200,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: viewModel.lista.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        verticalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.yellow,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.red,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidgetFirst('Papel' + (sortType == sortName ? (isAscending ? '???' : '???') : ''), 100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          papelData.sortPapel(isAscending);
          setState(() {});
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget('Rank' + (sortType == sortStatus ? (isAscending ? '???' : '???') : ''), 70),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          papelData.sortRank(isAscending);
          setState(() {});
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget('Cota????o' + (sortType == sortStatus ? (isAscending ? '???' : '???') : ''), 100),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          papelData.sortCotacao(isAscending);
          setState(() {});
        },
      ),
      // _getTitleItemWidget('Cota????o', 100),
      _getTitleItemWidget('P/l', 100),
      _getTitleItemWidget('P/VP', 100),
      _getTitleItemWidget('PSR', 100),
      _getTitleItemWidget('Div.Yield', 100),
      _getTitleItemWidget('P/Ativo', 100),
      _getTitleItemWidget('P/Cap.Giro', 100),
      _getTitleItemWidget('P/EBIT', 100),
      _getTitleItemWidget('P/Ativ Circ.Liq', 100),
      _getTitleItemWidget('EV/EBIT	EV', 100),
      _getTitleItemWidget('EV/EBITDA', 100),
      _getTitleItemWidget('Mrg Ebit', 100),
      _getTitleItemWidget('Mrg. L??q.', 100),
      _getTitleItemWidget('Liq. Corr.', 100),
      _getTitleItemWidget('ROIC', 100),
      _getTitleItemWidget('ROE', 100),
      _getTitleItemWidget('Liq.2meses', 100),
      _getTitleItemWidget('Patrim. L??q', 100),
      _getTitleItemWidget('D??v.Brut/ Patrim.', 100),
      _getTitleItemWidget('Cresc. Rec.5a', 100),
    ];
  }

  Widget _getTitleItemWidgetFirst(String label, double width) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[100], border: Border.all()),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[100], border: Border.all()),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      // padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    String papel = papelData.lista[index].papel as String;
    return GestureDetector(
      onTap: () => _launchURL(papel),
      child: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[100], border: Border.all()),
        child: Text(papel),
        width: 100,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    List<Fundamento> fundamentos = papelData.lista[index].fundamentos;
    List<Container> containerFund = [];
    if (fundamentos.isNotEmpty) {
      for (int x = 0; x < fundamentos.length; x++) {
        containerFund.add(Container(
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[100], border: Border.all()),
          child: Text(fundamentos[x].valor.toString()),
          width: 100,
          height: 52,
          // padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ));
      }
    }

    return Row(
      children: <Widget>[
        Container(
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey[100], border: Border.all()),
          child: Text(papelData.lista[index].rank.toString()),
          width: 70,
          height: 52,
          // padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        ...containerFund
      ],
    );
  }

  _launchURL(String papel) async {
    developer.log("Abrir link fundamento: $papel", name: toString());
    if (papel.isEmpty) {
      return;
    }
    var url = '$_urlFundamento$papel';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PapelData {
  List<Papel> lista = [];

  PapelData() {}

  ///
  /// Single sort, sort Name's id
  void sortPapel(bool isAscending) {
    lista.sort((a, b) {
      return a.nome.compareTo(b.nome) * (isAscending ? 1 : -1);
    });
  }

  void sortRank(bool isAscending) {
    lista.sort((a, b) {
      if (isAscending) {
        if (a.rank > b.rank) {
          return 1;
        } else {
          return -1;
        }
      }
      if (a.rank > b.rank) {
        return -1;
      } else {
        return 1;
      }
    });
  }

  void sortCotacao(bool isAscending) {
    lista.sort((a, b) {
      Fundamento fundA = a.fundamentos.firstWhere((fund) => fund.descricao == 'Cota????o') as Fundamento;
      Fundamento fundB = b.fundamentos.firstWhere((fund) => fund.descricao == 'Cota????o') as Fundamento;

      if (isAscending) {
        if (fundA.valor > fundB.valor) {
          return 1;
        } else {
          return -1;
        }
      }
      if (fundA.valor > fundB.valor) {
        return -1;
      } else {
        return 1;
      }
    });
  }
}
