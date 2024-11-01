import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/utils/config.dart';
import 'package:flutter/material.dart';

///
///
///
class GlpGas with AbstractEmissor {
  int cylinderPerYear = 0;
  final double emissionFactorPerCylinder = Config().glpPerCylinderEF;

  ///
  ///
  ///
  GlpGas();

  ///
  ///
  ///
  @override
  double calculate() {
    return emissionFactorPerCylinder * (cylinderPerYear / 12);
  }

  ///
  ///
  ///
  @override
  String get name => 'Consumo de Gás GLP em Botijão';

  ///
  ///
  ///
  @override
  IconData get iconData => Icons.gas_meter;

  ///
  ///
  ///
  @override
  String get description => 'Referência: ${Config().glpPerCylinderEF} Kg/Botijão';
}
