import 'package:flutter/material.dart';
import 'package:bytebank/screens/contacts/contact.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm(),
              ))
              .then((newContact) => debugPrint('CONTACT $newContact'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
