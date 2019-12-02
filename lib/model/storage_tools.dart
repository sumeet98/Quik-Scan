import 'package:flutter/material.dart';

import 'model.dart';
import 'barcode.dart';

//need to create this tools and value in to
var _barcodeItem;
var _lastInsertedId = 0;
final _model = BarcodeModel();


Future<void> _addBarcode() async {
  Barcode newBarcode = Barcode(barcode: _barcodeItem);
  _lastInsertedId = await _model.insertBarcode(newBarcode);
}

Future<void> _updateBarcode() async {
  Barcode barcodeToUpdate = Barcode(
      id: _lastInsertedId,
      barcode: _barcodeItem,
  );
  _model.updateBarcode(barcodeToUpdate);
}

Future<void> _deleteBarcode() async {
  _model.deleteBarcode(_lastInsertedId);
}

Future<void> _listBarcodes() async {
  List<Barcode> barcodes = await _model.getALLBarcode();
  print('To Dos:');
  for (Barcode barcode in barcodes) {
    print(barcode);
  }
}