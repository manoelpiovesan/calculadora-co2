import 'package:calculadoraco2/utils/utils.dart';
import 'package:calculadoraco2/views/edits/electricity_usage_edit_widget.dart';
import 'package:calculadoraco2/views/edits/ethanol_car_edit_widget.dart';
import 'package:calculadoraco2/views/edits/gasoline_car_edit_widget.dart';
import 'package:calculadoraco2/views/edits/glp_gas_edit_widget.dart';
import 'package:calculadoraco2/views/edits/piped_gas_edit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
///
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

///
///
///
class _EditScreenState extends State<EditScreen> {
  final List<Widget> emissorsEdits = <Widget>[
    const GasolineCarEdit(),
    const EthanolCarEdit(),
    const ElectricityUsageEdit(),
    const PipedGasEdit(),
    const GlpGasEdit(),
  ];
  int indexOfEdit = 0;

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: Utils.navigationBar(title: 'Adicionar emissão'),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CupertinoListTile(
                leading: const Icon(Icons.energy_savings_leaf),
                title: const Text('Selecionar Tipo de Emissão'),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _showModal(context),
              ),
              emissorsEdits[indexOfEdit],
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Future<void> _showModal(final BuildContext context) async {
    final int? index = await showCupertinoModalPopup<int>(
      context: context,
      builder: (final BuildContext context) => CupertinoActionSheet(
        title: const Text('Selecione uma nova atividade.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 0);
            },
            child: const Text('Carro à Gasolina'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            child: const Text('Carro à Etanol'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 2);
            },
            child: const Text('Energia Elétrica Residencial'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 3);
            },
            child: const Text('Gás Encanado'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 4);
            },
            child: const Text('Gás GLP (Botijão)'),
          ),
        ],
      ),
    );
    if (index != null) {
      setState(() {
        indexOfEdit = index;
      });
    }
  }
}
