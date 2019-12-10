import 'package:flutter/material.dart';
import 'package:quik_scan/model/model.dart';


class RecentScans extends StatefulWidget {
  RecentScans({Key key})
      : super(key: key);


  @override
  State<StatefulWidget> createState() => new _RecentScansState();
}

class _RecentScansState extends State<RecentScans> {
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
            "Recent Scans",
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
        body: Text("Recent Scans"),
        );
  }
}
