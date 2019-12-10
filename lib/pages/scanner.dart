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

    String _result = "Lets start to scan";

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
            _result = "unknown error ocurred $ex";
          });
        }
    }on FormatException{
      setState(() {
        _result = "Scan canceled, try again !";
      });
    }catch(e){
      _result = "Unknown error $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(_result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: _scanQr,
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
