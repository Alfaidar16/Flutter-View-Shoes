class CategoryModel {
  int? id;
  String? nama;

  CategoryModel({this.id, this.nama});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    return {'nama': nama};
  }
}
