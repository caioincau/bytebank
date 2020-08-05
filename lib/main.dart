import 'package:flutter/material.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    home: TransfersList(),
  );
}

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldController =
      TextEditingController();

  final TextEditingController _valueFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creating a transfer'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberFieldController,
                label: 'Account Number',
                hint: '0000',
                autofocus: true,
              ),
              Editor(
                controller: _valueFieldController,
                label: 'Value',
                hint: '00.00',
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text('Confirm'),
                onPressed: () => _createTransfer(context),
              )
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberFieldController.text);
    final double value = double.tryParse(_valueFieldController.text);

    if (accountNumber != null && value != null) {
      final transfer = Transfer(value, accountNumber);
      debugPrint('$transfer');
      Navigator.pop(context, transfer);
    }
  }

  @override
  void dispose() {
    debugPrint('disposing transfer form');
    _accountNumberFieldController.dispose();
    _valueFieldController.dispose();
    super.dispose();
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool autofocus;
  Editor({
    @required this.controller,
    @required this.label,
    @required this.hint,
    this.icon,
    this.autofocus = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: autofocus,
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(this.icon) : null,
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();
  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return new TransferItem(transfer);
        },
      ),
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((transferReceived) {
            debugPrint('arrived at then of the future');
            debugPrint('$transferReceived');
            setState(() {
              if (transferReceived != null) {
                widget._transfers.add(transferReceived);
              }
            });
          });
        },
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
