import 'package:calculadoraco2/controllers/calculator_controller.dart';
import 'package:calculadoraco2/models/ethanol_car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
///
///
class EthanolCarEdit extends StatefulWidget {
  final EthanolCar? received;

  const EthanolCarEdit({super.key, this.received});

  @override
  State<EthanolCarEdit> createState() => _EthanolCarEditState();
}

///
///
///
class _EthanolCarEditState extends State<EthanolCarEdit> {
  late EthanolCar model;

  ///
  ///
  ///
  @override
  void initState() {
    /// Edit or new model
    if (widget.received == null) {
      model = EthanolCar();
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
      header: const Text('Adicionar carro movido à etanol.'),
      children: <Widget>[
        /// Km/L
        CupertinoTextFormFieldRow(
          prefix: const Icon(Icons.speed),
          keyboardType: TextInputType.number,
          onChanged: (final String value) {
            model.kmPerLiter = int.parse(value);
          },
          placeholder: 'Consumo em Km/L',
        ),

        /// Km/Month
        CupertinoTextFormFieldRow(
          prefix: const Icon(Icons.route),
          keyboardType: TextInputType.number,
          onChanged: (final String value) {
            model.monthKm = int.parse(value);
          },
          placeholder: 'Km percorridos por mês',
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
                      ? 'Salvar Carro Etanol'
                      : 'Adicionar Carro Etanol',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _saveOrUpdate(final EthanolCar model, final EthanolCar? oldModel) {
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
