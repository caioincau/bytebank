import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

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
