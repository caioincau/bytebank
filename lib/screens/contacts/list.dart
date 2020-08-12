import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts/form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = List();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    _dao.findAll().then((dbContacts) {
      debugPrint(dbContacts.toString());
      contacts = dbContacts;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
          future: _dao.findAll(),
          builder: (context, snapshot) {
            List<Contact> contacts = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;

              case ConnectionState.done:
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                );
                break;
            }
            return Text("Unknown error");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((value){
            setState(() {});
          });
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
