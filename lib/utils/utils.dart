import 'package:flutter/cupertino.dart';

///
///
///
class Utils {
  final String appName = 'Calculadora';

  ///
  ///
  ///
  static CupertinoNavigationBar get navigationBar =>
      const CupertinoNavigationBar(
        middle: Text('Calculadora de CO2'),
      );
}
