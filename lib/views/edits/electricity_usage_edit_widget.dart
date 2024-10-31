import 'package:calculadoraco2/controllers/calculator_controller.dart';
import 'package:calculadoraco2/models/electricity_usage_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
///
///
class ElectricityUsageEdit extends StatefulWidget {
  final ElectricityUsage? received;

  const ElectricityUsageEdit({super.key, this.received});

  @override
  State<ElectricityUsageEdit> createState() => _ElectricityUsageEditState();
}

///
///
///
class _ElectricityUsageEditState extends State<ElectricityUsageEdit> {
  late ElectricityUsage model;

  ///
  ///
  ///
  @override
  void initState() {
    /// Edit or new model
    if (widget.received == null) {
      model = ElectricityUsage();
    } else {
      model = widget.received!;
    }
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoFormSection(
      header: Text('Adicionar ${model.name}.'),
      children: <Widget>[
        /// Bill value
        CupertinoTextFormFieldRow(
          prefix: const Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Icon(Icons.price_change), Text(r'R$')],
          ),
          keyboardType: TextInputType.number,
          onChanged: (final String value) {
            model.billValue = double.parse(value);
          },
          placeholder: 'Preço médio da conta de energia.',
        ),

        /// Save
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton.filled(
                onPressed: () => _saveOrUpdate(model, widget.received),
                child: Text(
                  widget.received != null
                      ? 'Salvar ${model.name}'
                      : 'Adicionar ${model.name}',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _saveOrUpdate(
    final ElectricityUsage model,
    final ElectricityUsage? oldModel,
  ) {
    CalculatorController().saveOrUpdate(model, oldModel: oldModel);

    if (kDebugMode) {
      if (oldModel != null) {
        print('Editing: $model | $oldModel');
      } else {
        print('Saving: $model');
      }
    }

    Navigator.pop(context);
  }
}
