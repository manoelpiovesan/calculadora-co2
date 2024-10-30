import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/models/calculator_model.dart';
import 'package:calculadoraco2/models/electricity_usage_model.dart';
import 'package:calculadoraco2/models/ethanol_car_model.dart';
import 'package:calculadoraco2/models/gasoline_car_model.dart';
import 'package:calculadoraco2/utils/utils.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class CalculatorView extends StatefulWidget {
  final Calculator calculator = Calculator();

  ///
  ///
  ///
  CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

///
///
///
class _CalculatorViewState extends State<CalculatorView> {
  List<Widget> emissorsList = <Widget>[];

  ///
  ///
  ///
  @override
  void initState() {
    // TODO(2): Remove this mock;
    widget.calculator.emissors.addAll(<AbstractEmissor>[
      GasolineCar(),
      EthanolCar(),
      ElectricityUsage(),
      GasolineCar(),
      EthanolCar(),
      ElectricityUsage(),
    ]);

    emissorsList = widget.calculator.emissors
        .map(
          (final AbstractEmissor element) => CupertinoListTile(
            onTap: () {
              _showModal(context, element);
            },
            title: Text(element.name),
            leading: Icon(element.iconData),
            additionalInfo: Text('${element.calculate()} Kg de CO²'),
            subtitle: Text(element.description),
          ),
        )
        .toList();

    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: Utils.navigationBar,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Actions

              /// Emissors List
              CupertinoListSection(
                header: const Text('Seus Emissores'),
                children: emissorsList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  void _showModal(final BuildContext context, final AbstractEmissor element) =>
      showCupertinoModalPopup<String>(
        context: context,
        builder: (final BuildContext context) => CupertinoActionSheet(
          title: Text(element.name),
          actions: <Widget>[
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Editar');
              },
              child: const Text('Editar'),
            ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, 'Deletar');
              },
              child: const Text('Deletar'),
            ),
          ],
        ),
      );
}
