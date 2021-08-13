import 'package:flutter/material.dart';
import 'package:fundamentalista_app/ui/page/homePage.dart';
import 'package:fundamentalista_app/ui/viewModel/PapelViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PapelViewModel()),
      ],
      child: const FundamentalistaAPP(),
    ),
  );
}

class FundamentalistaAPP extends StatelessWidget {
  const FundamentalistaAPP({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
