import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/models/calculator_model.dart';
import 'package:flutter/cupertino.dart';

///
///
///
abstract class AbstractEdit<T extends AbstractEmissor> {
  AbstractEmissor model;

  AbstractEdit({required this.model});

  ///
  ///
  ///
  List<Widget> get formContent;

  ///
  ///
  ///
  void save() {
    final Calculator calculator = Calculator();
    final AbstractEmissor searchModel = calculator.emissors
        .firstWhere((final AbstractEmissor element) => element == model);

  }
}
