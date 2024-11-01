import 'package:calculadoraco2/controllers/calculator_controller.dart';
import 'package:calculadoraco2/models/piped_gas_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
///
///
class PipedGasEdit extends StatefulWidget {
  final PipedGas? received;

  const PipedGasEdit({super.key, this.received});

  @override
  State<PipedGasEdit> createState() => _PipedGasEditState();
}

///
///
///
class _PipedGasEditState extends State<PipedGasEdit> {
  late PipedGas model;

  ///
  ///
  ///
  @override
  void initState() {
    /// Edit or new model
    if (widget.received == null) {
      model = PipedGas();
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
      header: Text('Adicionar ${model.name}'),
      children: <Widget>[
        /// Bill value
        CupertinoTextFormFieldRow(
          prefix: const Icon(Icons.gas_meter),
          keyboardType: TextInputType.number,
          onChanged: (final String value) {
            model.billValue = int.parse(value);
          },
          placeholder: r'Consumo Mensal em R$',
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

  void _saveOrUpdate(final PipedGas model, final PipedGas? oldModel) {
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
