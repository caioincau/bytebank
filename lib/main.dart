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
            home: Dashboard(),
          ),
        ));
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                Text(
                  'Contacts',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    );
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
