import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/models/calculator_model.dart';
import 'package:calculadoraco2/utils/utils.dart';
import 'package:calculadoraco2/views/edits/edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // widget.calculator.emissors.addAll(<AbstractEmissor>[
    //   GasolineCar()
    //     ..kmPerLiter = 10
    //     ..monthKm = 4000,
    //   EthanolCar()
    //     ..kmPerLiter = 8
    //     ..monthKm = 2000
    //     ..quantity = 1,
    //   ElectricityUsage()..billValue = 130,
    // ]);

    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    emissorsList = widget.calculator.emissors
        .map(
          (final AbstractEmissor element) => CupertinoListTile(
            onTap: () {
              _showModal(context, element);
            },
            title: Text(element.name),
            leading: Icon(element.iconData),
            additionalInfo:
                Text('${element.calculate().toStringAsFixed(2)} Kg de CO²/Mês'),
            subtitle: Text(element.description),
          ),
        )
        .toList();
    return CupertinoPageScaffold(
      navigationBar: Utils.navigationBar,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  /// Add button
                  CupertinoButton(
                    onPressed: () => _navigateToAddScreen,
                    child: const Text('Adicionar'),
                  ),
                ],
              ),

              /// Emissors List
              CupertinoListSection(
                header: const Text('Seus Emissores'),
                children: <Widget>[
                  ...emissorsList,
                  CupertinoListTile(
                    leading: const Icon(Icons.energy_savings_leaf),
                    title: const Text('Total'),
                    additionalInfo: const Text('Aproximadamente'),
                    trailing: Text('${widget.calculator.sum.toStringAsFixed(2)}'
                        ' Kg de CO²'),
                  ),
                ],
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

  ///
  ///
  ///
  Future<void> get _navigateToAddScreen async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (final BuildContext context) => const EditScreen(),
      ),
    );

    setState(() {});
  }
}
