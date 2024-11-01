import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/utils/config.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class GasolineCar with AbstractEmissor {
  int kmPerLiter = 0;
  int monthKm = 0;
  final double emissionFactor = Config().gasolineCarEF;

  ///
  ///
  ///
  GasolineCar();

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
  String get name => 'Carro movido à Gasolina';

  ///
  ///
  ///
  @override
  IconData get iconData => CupertinoIcons.car_detailed;

  ///
  ///
  ///
  @override
  String get description => 'Referência: 2.3 Kg/l';

  @override
  String toString() => '$name | $kmPerLiter | $monthKm';
}
