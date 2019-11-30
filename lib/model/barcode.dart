class Barcode {
  Barcode({this.id, this.barcode,this.longitude,this.latitude});

  int id;
  String barcode;
  String longitude;
  String latitude;

  Barcode.fromMap(Map<String,dynamic> map) {
    this.id = map['id'];
    this.barcode = map['barcode'];
    this.longitude = map['longtiude'];
    this.latitude = map['latitude'];
  }

  Map<String,dynamic> toMap() {
    return {
      'id': this.id,
      'barcode': this.barcode,
      'longtitude':this.longitude,
      'latitude':this.latitude,
    };
  }

  @override
  String toString() {
    return 'barcode{id: $id, barcode: $barcode, longitude:$longitude,latitude:$latitude}';
  }
}