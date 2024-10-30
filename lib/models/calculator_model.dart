import 'package:calculadoraco2/models/abstract_emissor_model.dart';

class Calculator {
  List<Emissor> emissors = <Emissor>[];

  ///
  ///
  ///
  static final Calculator _instance = Calculator._internal();

  ///
  ///
  ///
  factory Calculator() {
    return _instance;
  }

  ///
  ///
  ///
  Calculator._internal();

  ///
  ///
  ///
  double getSum() {
    double sum = 0;

    for (final Emissor emissor in emissors) {
      sum += emissor.calculate();
    }

    return sum;
  }
}
