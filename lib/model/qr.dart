import 'package:cloud_firestore/cloud_firestore.dart';

class Qr {  

  Qr({this.sid, this.qr});

  int sid; 
  String qr;
  DocumentReference reference;

  Qr.fromMap(Map<String, dynamic> map, {this.reference}) { 

    this.sid = map['sid'];
    this.qr = map['qr'];
  }

  Map<String, dynamic> toMap() { 
    return { 
      'sid': this.sid,
      'qr' : this.qr,
    };
  }

}