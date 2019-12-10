import 'package:cloud_firestore/cloud_firestore.dart';

import 'qr.dart';

class QrModel { 

  static Future<DocumentReference> insert (Qr entry) async { 
    CollectionReference qrs = Firestore.instance.collection('qrs');
    return await qrs.add(entry.toMap());
  }
}

