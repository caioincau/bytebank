import 'package:flutter/material.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    home: TransferForm(),
  );
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberFieldController =
      TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creating a transfer'),
        ),
        body: Column(
          children: <Widget>[
            Editor(
                _accountNumberFieldController, 'Account Number', '0000', null),
            Editor(
                _valueFieldController, 'Value', '00.00', Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(fontSize: 24),
                controller: _valueFieldController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Value',
                  hintText: '0.00',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Confirm'),
              onPressed: () {
                final int accountNumber =
                    int.tryParse(_accountNumberFieldController.text);
                final double value =
                    double.tryParse(_valueFieldController.text);

                if (accountNumber != null && value != null) {
                  final transfer = Transfer(value, accountNumber);
                  debugPrint('$transfer');
                }
              },
            )
          ],
        ));
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final String _hint;
  final IconData _icon;
  Editor(this._controller, this._label, this._hint, this._icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: Icon(this._icon), labelText: _label, hintText: _hint),
      ),
    );
  }
}

class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100, 1000)),
          TransferItem(Transfer(99, 1000)),
          TransferItem(Transfer(223, 1000))
        ],
      ),
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;
  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.accountNumber.toString()),
    ));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{ value:$value accountNumber: $accountNumber';
  }
}
