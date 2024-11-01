import 'package:calculadoraco2/controllers/calculator_controller.dart';
import 'package:calculadoraco2/models/abstract_emissor_model.dart';
import 'package:calculadoraco2/models/calculator_model.dart';
import 'package:calculadoraco2/utils/utils.dart';
import 'package:calculadoraco2/views/config_view.dart';
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
  Widget build(final BuildContext context) {
    emissorsList = widget.calculator.emissors
        .map(
          (final AbstractEmissor element) => CupertinoListTile(
            onTap: () async {
              await _showModal(context, element);
              setState(() {});
            },
            title: Text(element.name),
            leading: Icon(element.iconData),
            additionalInfo:
                Text('${element.calculate().toStringAsFixed(2)} Kg de CO²/Mês'),
            subtitle: Text(element.description),
          ),
        )
        .toList()
      ..add(
        CupertinoListTile(
          leading: const Icon(Icons.energy_savings_leaf),
          title: const Text('Total'),
          additionalInfo: const Text('Aproximadamente'),
          trailing: Text('${widget.calculator.sum.toStringAsFixed(2)}'
              ' Kg de CO² por mês'),
        ),
      );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: Utils.navigationBar(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// Settings
                  CupertinoButton(
                    onPressed: () => _navigateToSettings,
                    child: const Text('Configurações'),
                  ),

                  /// Add button
                  CupertinoButton(
                    onPressed: () => _navigateToAddScreen,
                    child: const Text('Adicionar atividade'),
                  ),
                ],
              ),

              /// Emissors List
              if (widget.calculator.emissors.isNotEmpty)
                CupertinoListSection(
                  header: const Text('Suas emissões'),
                  children: emissorsList,
                ),

              /// No Data Yet
              if (widget.calculator.emissors.isEmpty)
                const SizedBox(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.edit_off_sharp),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Sem dados até o momento. \n Adicione novas atividades'
                        ' para ver sua pegada de carbono.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
  Future<void> _showModal(
          final BuildContext context, final AbstractEmissor element) =>
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
                CalculatorController().delete(element);

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

  ///
  ///
  ///
  Future<void> get _navigateToSettings async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (final BuildContext context) => const ConfigView(),
      ),
    );

    setState(() {});
  }
}
