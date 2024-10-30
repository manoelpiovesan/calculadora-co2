import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class ElectricityUsage with AbstractEmissor {
  double billValue = 0;
  final double kwhPrice =
      0.74; // Brazil Average Price - Source: https://www.ngsolar.com.br/single-post/preco-kwh-cpfl#:~:text=A%20tarifa%20teve%20um%20aumento,%24%200%2C74%20por%20KWh.
  final double emissionFactor = 0.1; // Kg of CO2 per KWh

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
  String get name => 'Consumo de Energia Elétrica';

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
