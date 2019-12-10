import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'package:quik_scan/model/model.dart';
import 'package:quik_scan/model/barcode.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key})
      : super(key: key);



  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  signOut() async {
    Navigator.pushReplacementNamed(context, "/logout");
  }

  void generateQR() {
    setState(() {
      data = controller.text;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('QR code generated')
        );
      }
    );
  }

  Future<void> _addBarcode() async {
    Barcode newBarcode = Barcode(barcode: _barcodeItem);
    _lastInsertedId = await _model.insertBarcode(newBarcode);
  }

  String data = 'Enter data';
  var _barcodeItem;
  var _lastInsertedId = 0;
  final _model = BarcodeModel();
  final controller = TextEditingController();

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
       // automaticallyImplyLeading: false,
      ),
      drawer: new Drawer( 
        child: new ListView(  
          children: <Widget>[  
            new ListTile(  
              title: new Text("Tables"),
              trailing: new Icon(Icons.table_chart),
              onTap: () => Navigator.of(context).pushNamed("/tables"),
            ), 
            new ListTile(  
              title: new Text("Geolocation"),
              trailing: new Icon(Icons.place),
              onTap: () => Navigator.of(context).pushNamed("/geo"),
            ),
            new ListTile(  
              title: new Text("Internationalization"),
              trailing: new Icon(Icons.translate),
              onTap: () => Navigator.of(context).pushNamed("/inter"),
            ),
            new ListTile(  
              title: new Text("About Us"),
              trailing: new Icon(Icons.account_box),
              onTap: () => Navigator.of(context).pushNamed("/about"),
            ),
            new ListTile(  
              title: new Text("Settings"),
              trailing: new Icon(Icons.settings),
              onTap: () => Navigator.of(context).pushNamed("/settings"),
            ),
            new Divider(), 
            new ListTile(  
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
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
                  onChanged: (newValue) {
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
                onPressed: () {
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
}
