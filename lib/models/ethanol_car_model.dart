import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/utils/config.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class EthanolCar with AbstractEmissor {
  int kmPerLiter = 0;
  int monthKm = 0;
  final double emissionFactor =
      Config().ethanolCarEF;

  ///
  ///
  ///
  EthanolCar();

  ///
  ///
  ///
  @override
  double calculate() {
    return emissionFactor * (monthKm / kmPerLiter);
  }

  ///
  ///
  ///
  @override
  String get name => 'Carro movido à Etanol';

  ///
  ///
  ///
  @override
  IconData get iconData => CupertinoIcons.car_detailed;

  ///
  ///
  ///
  @override
  String get description => 'Referência: 1.6 Kg de CO² por Litro';
}
