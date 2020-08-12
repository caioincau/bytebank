import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static final String tableSql = "CREATE TABLE $_tableName("
      "id INTEGER PRIMARY KEY,"
      "$_name TEXT,"
      "$_accountNumber INTEGER)";

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert("contacts", contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap["$_name"] = contact.name;
    contactMap["$_accountNumber"] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("contacts");
    final List<Contact> contacts = _toList(maps);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> maps) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> map in maps) {
      final Contact contact = Contact(
        id: map["id"],
        name: map["$_name"],
        accountNumber: map["$_accountNumber"],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
