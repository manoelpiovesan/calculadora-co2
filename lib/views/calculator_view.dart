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
    ]);

    emissorsList = widget.calculator.emissors
        .map(
          (final AbstractEmissor element) => CupertinoListTile(
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
                header: const Text('Emissores'),
                children: emissorsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
