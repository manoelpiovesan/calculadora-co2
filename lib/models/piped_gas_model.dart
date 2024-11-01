import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/utils/config.dart';
import 'package:flutter/material.dart';

///
///
///
class PipedGas with AbstractEmissor {
  int billValue = 0;
  final double emissionFactorPerMeterCubic = Config().pipedGasEF;

  ///
  ///
  ///
  PipedGas();

  ///
  ///
  ///
  @override
  double calculate() {
    return emissionFactorPerMeterCubic * (billValue / Config().pipedGasPrice);
  }

  ///
  ///
  ///
  @override
  String get name => 'Consumo de Gás Encanado';

  ///
  ///
  ///
  @override
  IconData get iconData => Icons.gas_meter;

  ///
  ///
  ///
  @override
  String get description =>
      'Referência: ${Config().pipedGasEF} Kg/m³ | R\$${Config().pipedGasPrice}/m³';
}
