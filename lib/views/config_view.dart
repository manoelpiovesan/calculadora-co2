import 'package:calculadoraco2/utils/config.dart';
import 'package:calculadoraco2/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
///
class ConfigView extends StatefulWidget {
  const ConfigView({super.key});

  @override
  State<ConfigView> createState() => _ConfigViewState();
}

///
///
///
class _ConfigViewState extends State<ConfigView> {
  final Config config = Config();

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: Utils.navigationBar(title: 'Configurações'),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Prices R$
              CupertinoFormSection(
                header: const Text('Valores de Referência'),
                children: <Widget>[
                  /// Piped Gas Price (RJ - Naturgy)
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.gas_meter),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          r'Preço do m³ gás (R$):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.pipedGasPrice.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.pipedGasPrice = double.parse(value);
                    },
                  ),

                  /// Kwh Price
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.electric_bolt),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          r'Preço do KW/h (R$):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.electricityKwhPrice.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.electricityKwhPrice = double.parse(value);
                    },
                  ),
                ],
              ),

              /// Emission Factors
              CupertinoFormSection(
                header: const Text('Fatores de Emissão'),
                children: <Widget>[
                  /// Piped Gas EF per M³
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.gas_meter),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Gás Encanado (Kg/m³):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.pipedGasEF.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.pipedGasEF = double.parse(value);
                    },
                  ),

                  /// GLP Gas
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.gas_meter),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Gás GLP (Kg/Botijão):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.glpPerCylinderEF.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.glpPerCylinderEF = double.parse(value);
                    },
                  ),

                  /// Gasoline Car
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(CupertinoIcons.car),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Carro à Gasolina (Kg/l):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.gasolineCarEF.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.gasolineCarEF = double.parse(value);
                    },
                  ),

                  /// Ethanol Car
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(CupertinoIcons.car),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Carro à Etanol (Kg/l):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.ethanolCarEF.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.ethanolCarEF = double.parse(value);
                    },
                  ),

                  /// Electricity Usage
                  CupertinoTextFormFieldRow(
                    prefix: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.electric_bolt),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Energia Residencial (Kg/KWh):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    initialValue: config.electricityEF.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (final String value) {
                      config.electricityEF = double.parse(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
