import 'package:calculadoraco2/views/calculator_view.dart';
import 'package:calculadoraco2/views/home.dart';
import 'package:flutter/cupertino.dart';

///
///
///
void main() {
  runApp(const MyApp());
}

///
///
///
class MyApp extends StatelessWidget {
  ///
  ///
  ///
  const MyApp({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoApp(
      title: 'Calculadora de CO2',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: CalculatorView(),
    );
  }
}
