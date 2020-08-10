import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    debugPrint('openDatabase >>>>>>>>>>>');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      debugPrint('createDatabase >>>>>>>>>>>');
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY,'
        'name TEXT'
        'account_number INTEGER)',
      );
    });
  });
}

void save(Contact contact) {
  createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    db.insert('contacts', contactMap);
  });
}
