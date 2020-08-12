import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap["name"] = contact.name;
    contactMap["account_number"] = contact.accountNumber;
    return db.insert("contacts", contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("contacts");
    final List<Contact> contacts = List();

    for (Map<String, dynamic> map in maps) {
      final Contact contact = Contact(
        id: map["id"],
        name:  map["name"],
        accountNumber: map["account_number"],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
