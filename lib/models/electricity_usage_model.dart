import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/utils/config.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class ElectricityUsage with AbstractEmissor {
  double billValue = 0;
  final double kwhPrice = Config().electricityKwhPrice;
  final double emissionFactor = Config().electricityEF;

  ///
  ///
  ///
  ElectricityUsage();

  ///
  ///
  ///
  @override
  double calculate() {
    return (billValue / kwhPrice) * emissionFactor;
  }

  ///
  ///
  ///
  @override
  String get name => 'Energia Elétrica Residencial';

  ///
  ///
  ///
  @override
  IconData get iconData => CupertinoIcons.bolt;

  ///
  ///
  ///
  @override
  String get description => r'Referência: 0.1 Kg de CO² por KWh | R$ 0,74/KWh';
}
