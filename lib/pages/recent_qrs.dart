import 'package:flutter/material.dart';
import 'package:quik_scan/model/model.dart';
import 'package:quik_scan/model/barcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RecentQrs extends StatefulWidget {
  RecentQrs({Key key})
      : super(key: key);


  @override
  State<StatefulWidget> createState() => new _RecentQrsState();
}

class _RecentQrsState extends State<RecentQrs> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  signOut() async {
    Navigator.pushReplacementNamed(context, "/logout");
  }

  final _model = BarcodeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Recent QRs",
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
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Barcode>>(
          future: _model.getALLBarcode(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView(
              children: snapshot.data.reversed.map((barcode) =>
                  ListTile(
                    leading: QrImage(
                      data: barcode.barcode,
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                    title: Text(barcode.barcode),
                  ))
                  .toList(),
            );
          },
        ));
  }
}
