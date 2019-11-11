import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QRGeneratorState();
  }
}

class _QRGeneratorState extends State<QRGenerator> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
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
                onPressed: generateQR
              )
            ],
          ),
        ],
      )
    );
  }
}