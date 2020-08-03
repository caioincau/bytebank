import 'package:flutter/material.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Text('whateverwhateverwhateverwhateverwhatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
            Text('whatever'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    ),
  );
}
