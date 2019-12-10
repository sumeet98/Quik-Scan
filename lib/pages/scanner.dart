import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

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

  String _result = "Let's start to scan";

  Future _scanQr() async {
    debugPrint("scan touched");
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _result = qrResult;
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
