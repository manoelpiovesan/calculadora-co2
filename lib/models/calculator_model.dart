import 'package:calculadoraco2/models/abstract_emissor_model.dart';

class Calculator {
  List<AbstractEmissor> emissors = <AbstractEmissor>[];

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
  double get sum {
    double sum = 0;

    for (final AbstractEmissor emissor in emissors) {
      sum += emissor.calculate();
    }

    return sum;
  }
}
