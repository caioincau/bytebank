import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
void main() => runApp(myApp());
MaterialApp myApp() {
  return MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green[900],
      accentColor: Colors.blueAccent[700],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[700],
        textTheme: ButtonTextTheme.primary,
      )
    ),
    home: TransfersList(),
  );
}
