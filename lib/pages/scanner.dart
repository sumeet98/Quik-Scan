import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:quik_scan/model/qr.dart';
import 'dart:math';
import 'package:quik_scan/model/qr_model.dart';

class Scanner extends StatefulWidget {
  Scanner({Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {

  signOut() async {
    Navigator.pushReplacementNamed(context, "/logout");
  }

  String _result = "Press scan to start scanning";
  var rnd = new Random();

  Future _scanQr() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _result = qrResult;
        Qr newEntry = Qr(sid: rnd.nextInt(900000) + 100000, qr: _result);
        QrModel.insert(newEntry);
        Navigator.pushNamed(context, '/recentscans', arguments: newEntry);
      });
    } on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          _result = "The permission was denied.";
        });
      }else{
        setState(() {
          _result = "Unknown error ocurred $ex";
        });
      }
    }on FormatException{
      setState(() {
        _result = "Scan cancelled, try again!";
      });
    }catch(e){
      _result = "Unknown error $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "QR Scanner",
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
      body: Center(
        child: Text(_result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        onPressed: _scanQr,
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
