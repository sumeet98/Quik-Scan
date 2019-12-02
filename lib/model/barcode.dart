class Barcode {
  Barcode({this.id, this.barcode});

  int id;
  String barcode;

  Barcode.fromMap(Map<String,dynamic> map) {
    this.id = map['id'];
    this.barcode = map['barcode'];
  }

  Map<String,dynamic> toMap() {
    return {
      'id': this.id,
      'barcode': this.barcode,
    };
  }

  @override
  String toString() {
    return 'barcode{id: $id, barcode: $barcode}';
  }
}