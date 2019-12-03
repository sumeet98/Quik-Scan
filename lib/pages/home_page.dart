import 'package:flutter/material.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/about_us.dart';
import 'dart:io';
import 'package:quik_scan/model/model.dart';
import 'package:quik_scan/model/barcode.dart';


final _model = BarcodeModel();

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {




  signOut() async {
    Navigator.pushReplacementNamed(context, "/logout");
  }

  String data = 'Enter data';
  final controller = TextEditingController();

  void generateQR() {
    setState(() {
      data = controller.text;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('QR code generated'),
//          actions: <Widget>[
//            FlatButton(
//              onPressed: () {
//
//              },
//            )
//          ]
        );
      }
    );
  }
  var _barcodeItem;
  var _lastInsertedId = 0;
  final _model = BarcodeModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Quik Scan",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15)
              ),
              QrImage(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
              Spacer(),
              Text('Enter a string to generate'),
              Container(
                padding: EdgeInsets.all(5),
                width: 300,
                child: TextField(
                  onChanged: (newValue){
                    _barcodeItem = newValue;
                  },
                  controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter data',
                    )
                ),
              ),
              FlatButton(
                color: Colors.indigo,
                child: Text('Generate', style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: ()
                {
                  generateQR();
                  _addBarcode();
                }
              )
            ],
          ),
        ],
      )
    );
  }
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

  Future<List> _getListBarcode() async {
    List<Barcode> barcodes = await _model.getALLBarcode();
    return barcodes;
  }
}
