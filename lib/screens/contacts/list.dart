import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/contacts/contact.dart';
import 'package:bytebank/database/app_database.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List<Contact>(),
          future: findAll(),
          builder: (context, snapshot) {
            List<Contact> contacts = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Loading'),
                    ],
                  ),
                );
                break;
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: contacts != null ? contacts.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                );
                break;
              default:
                return Text('Unknow error');
            }
          }),
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

class _ContactItem extends StatelessWidget {
  final Contact contact;
  const _ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
