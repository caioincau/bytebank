import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/contacts/contact.dart';
import 'package:bytebank/database/app_database.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts = List();

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(0, 'Alex', 1000));
    contacts.add(Contact(0, 'Alex', 1000));
    contacts.add(Contact(0, 'Alex', 1000));
    contacts.add(Contact(0, 'Alex', 1000));
    contacts.add(Contact(0, 'Alex', 1000));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
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
