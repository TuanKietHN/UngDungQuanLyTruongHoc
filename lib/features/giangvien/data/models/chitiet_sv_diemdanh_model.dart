class ChiTietSVDiemDanhModel {
  final int? id;
  final String? maSV;
  final String? hoTen;
  final String? maBuoi;
  final String? trangThai;
  final String? thoiGian;

  ChiTietSVDiemDanhModel({
    this.id,
    this.maSV,
    this.hoTen,
    this.maBuoi,
    this.trangThai,
    this.thoiGian,
  });

  factory ChiTietSVDiemDanhModel.fromJson(Map<String, dynamic> json) {
    return ChiTietSVDiemDanhModel(
      id: json['id'],
      maSV: json['maSV'],
      hoTen: json['hoTen'],
      maBuoi: json['maBuoi'],
      trangThai: json['trangThai'],
      thoiGian: json['thoiGian'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'maSV': maSV,
      'hoTen': hoTen,
      'maBuoi': maBuoi,
      'trangThai': trangThai,
      'thoiGian': thoiGian,
    };
  }
}
