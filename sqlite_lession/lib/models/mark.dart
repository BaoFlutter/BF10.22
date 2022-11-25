class Mark {
  int? id;
  double? toan;
  double? van;
  double? anh;
  double? diem_trung_binh;
  String? hoc_luc;

  Mark({ required this.id, required this.toan,
    required this.van, required this.anh, required this.diem_trung_binh,
    required this.hoc_luc
  });

  Mark.fromJson(Map json ):
        this.id = json['id'],
        this.toan = json['toan'],
        this.van = json['van'],
        this.anh = json['anh'],
        this.diem_trung_binh = json['diem_trung_binh'],
        this.hoc_luc = json['hoc_luc'];


   toJson(){
    return {
      "id": this.id,
      "toan": this.toan,
      "van": this.van,
      "anh": this.anh,
      "diem_trung_binh": this.diem_trung_binh,
      "hoc_luc": this.hoc_luc
    };

  }




}