import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future<Database> init() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'barcode_list.db'),
      onCreate: (db, version) {
        if (version > 1) {
          // downgrade path
        }
        db.execute('CREATE TABLE barcode_items(id INTEGER PRIMARY KEY, barcode TEXT, longitude TEXT, latitude TEXT)');
      },
      version: 1,
    );
  }
}