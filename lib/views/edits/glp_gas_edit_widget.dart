import 'package:calculadoraco2/controllers/calculator_controller.dart';
import 'package:calculadoraco2/models/glp_gas_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
///
///
class GlpGasEdit extends StatefulWidget {
  final GlpGas? received;

  const GlpGasEdit({super.key, this.received});

  @override
  State<GlpGasEdit> createState() => _GlpGasEditState();
}

///
///
///
class _GlpGasEditState extends State<GlpGasEdit> {
  late GlpGas model;

  ///
  ///
  ///
  @override
  void initState() {
    /// Edit or new model
    if (widget.received == null) {
      model = GlpGas();
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
        /// Cylinder per Year
        CupertinoTextFormFieldRow(
          prefix: const Icon(Icons.gas_meter),
          keyboardType: TextInputType.number,
          onChanged: (final String value) {
            model.cylinderPerYear = int.parse(value);
          },
          placeholder: 'Quantidade de Botijões por Ano',
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

  void _saveOrUpdate(final GlpGas model, final GlpGas? oldModel) {
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
