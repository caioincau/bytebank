import 'package:bytebank/screens/transactions/list.dart';
import 'package:flutter/material.dart';
import 'contacts/list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            initialData: false,
            future: Future.delayed(Duration(microseconds: 500))
                .then((value) => true),
            builder: (context, snapshot) {
              return AnimatedOpacity(
                duration: Duration(milliseconds: 1500),
                opacity: snapshot.data ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/bytebank_logo.png"),
                ),
              );
            },
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  "Transfer",
                  Icons.monetization_on,
                  onTap: () => _showContactList(context),
                ),
                _FeatureItem(
                  "Transaction Feed",
                  Icons.description,
                  onTap: () => _showTransactionList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _showContactList(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactList(),
      ),
    );
  }

  Future _showTransactionList(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const _FeatureItem(this.title, this.icon, {@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
