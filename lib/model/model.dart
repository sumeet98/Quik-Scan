import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'db_utils.dart';
import 'barcode.dart';


class BarcodeModel {
  Future<int> insertBarcode(Barcode barcode) async {
    final db = await DBUtils.init();
    return await db.insert('barcode_items', barcode.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<int> updateBarcode(Barcode barcode) async{
    final db = await DBUtils.init();
    return await db.update('barcode_items',barcode.toMap(),where:'id = ?', whereArgs:[barcode.id],);
  }

  Future<int> deleteBarcode(int id) async {
    final db = await DBUtils.init();
    return await db.delete('barcode_items', where:'id = ?', whereArgs:[id],);
  }

  Future<List<Barcode>> getALLBarcode() async {
    final db = await DBUtils.init();
    List<Map<String, dynamic>> maps = await db.query('barcode_items');
    List<Barcode> barcodes = [];
    for (int i = 0; i <maps.length; i++){
      barcodes.add(Barcode.fromMap(maps[i]));
    }
    return barcodes;
  }

  Future<Barcode> getBarcodeWithId(int id) async {
    final db = await DBUtils.init();
    List<Map<String, dynamic>> maps = await db.query('barcode_items',where:'id = ?', whereArgs:[id],);
    if (maps.length > 0) {
      return Barcode.fromMap(maps[0]);
    }else {
      return null;
    }
  }
}
