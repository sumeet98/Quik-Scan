import 'package:flutter/material.dart';
import 'package:quik_scan/model/qr_model.dart';
import 'package:quik_scan/model/qr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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

  List<Qr> dataList = new List();

  Widget makeDataTile(BuildContext context, Qr entry, int index){ 
    int sid = entry.sid;
    String qr = entry.qr;
  
  return GestureDetector( 
    child: Container( 
      child: ListTile( 
        title: Text('$sid'),
        subtitle: Text('$qr')
      )
    )
  );
  }

  @override
  Widget build(BuildContext context) {
    int index = 0; 
    dataList = new List();
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
      body: StreamBuilder<QuerySnapshot>( 
        stream: Firestore.instance.collection('qrs').snapshots(),
        builder: (context, snapshot) { 
          if (!snapshot.hasData){ 
            return LinearProgressIndicator();
          }

          return ListView(  
            padding: const EdgeInsets.all(16.0),
            children: snapshot.data.documents.map((data) { 
              final entry = Qr.fromMap(data.data, reference: data.reference);
              dataList.add(entry);
              Widget tile = makeDataTile(context,entry,index);
              index++;
              return tile;
            }).toList(),
          );
        }
    ));
  }
}