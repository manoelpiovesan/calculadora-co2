import 'package:flutter/cupertino.dart';

///
///
///
class Utils {
  final String appName = 'Calculadora';

  ///
  ///
  ///
  static CupertinoNavigationBar navigationBar({final String? title}) =>
      CupertinoNavigationBar(
        middle: Text(title ?? 'Calculadora de CO2'),
      );
}
