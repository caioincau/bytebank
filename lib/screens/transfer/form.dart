import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

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
    const _appBarTitle = 'Creating a transfer';
    const _labelFieldAccountNumber = 'Account Number';
    const _hintFieldAccountNumber = '0000';
    const _labelFieldValue = 'Value';
    const _hintFieldValue = '00.00';
    const _labelConfirmButtom = 'Confirm';

    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberFieldController,
                label: _labelFieldAccountNumber,
                hint: _hintFieldAccountNumber,
                autofocus: true,
              ),
              Editor(
                controller: _valueFieldController,
                label: _labelFieldValue,
                hint: _hintFieldValue,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_labelConfirmButtom),
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
