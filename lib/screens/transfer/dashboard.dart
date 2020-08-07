import 'package:flutter/material.dart';

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
          FutureBuilder<bool>(
              initialData: false,
              future: Future.delayed(Duration(microseconds: 100))
                  .then((value) => true),
              builder: (context, snapshot) {
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 1500),
                  opacity: snapshot.data ? 1.0 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/bytebank_logo.png'),
                  ),
                );
              }),
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
