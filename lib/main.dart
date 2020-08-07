import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<DarkModeModel>(
        model: DarkModeModel(),
        child: ScopedModelDescendant<DarkModeModel>(
          builder: (context, child, model) => MaterialApp(
            theme: model.darkMode ? ThemeData.dark() : defaultTheme(),
            home: Scaffold(
              body: TransfersList(),
            ),
          ),
        ));
  }
}

class DarkModeModel extends Model {
  bool darkMode = false;

  void toggle() {
    darkMode = !darkMode;
    notifyListeners();
  }
}

ThemeData defaultTheme() {
  return ThemeData(
    primaryColor: Colors.green[900],
    accentColor: Colors.blueAccent[700],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
