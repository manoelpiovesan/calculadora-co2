import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/models/calculator_model.dart';

class CalculatorController {
  final Calculator calculator = Calculator();

  ///
  ///
  /// Save or Update emissor
  void saveOrUpdate(
    final AbstractEmissor model, {
    final AbstractEmissor? oldModel,
  }) {
    /// Update
    if (oldModel != null) {
      final int index = calculator.emissors.indexOf(oldModel);
      calculator.emissors.removeAt(index);
      calculator.emissors.insert(index, model);
    } else {
      /// Save
      calculator.emissors.add(model);
    }
  }
}
