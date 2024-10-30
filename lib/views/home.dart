import 'package:calculadoraco2/utils/utils.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class Home extends StatelessWidget {
  ///
  ///
  ///
  const Home({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: Utils.navigationBar,
      child: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Exemplo'),
            ],
          ),
        ),
      ),
    );
  }
}
