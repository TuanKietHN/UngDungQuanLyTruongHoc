class BuoiHocModel {
  final int? id;
  final String? maBuoi;
  final String? maLopHP;
  final String? ngayHoc;
  final String? thu;
  final String? tiet;
  final String? phongHoc;
  final String? trangThai;

  BuoiHocModel({
    this.id,
    this.maBuoi,
    this.maLopHP,
    this.ngayHoc,
    this.thu,
    this.tiet,
    this.phongHoc,
    this.trangThai,
  });

  factory BuoiHocModel.fromJson(Map<String, dynamic> json) {
    return BuoiHocModel(
      id: json['id'],
      maBuoi: json['maBuoi']?.toString(),
      maLopHP: json['maLopHP']?.toString(),
      ngayHoc: json['ngayHoc'],
      thu: json['thu'],
      tiet: json['tiet'],
      phongHoc: json['phongHoc'],
      trangThai: json['trangThai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'maBuoi': maBuoi,
      'maLopHP': maLopHP,
      'ngayHoc': ngayHoc,
      'thu': thu,
      'tiet': tiet,
      'phongHoc': phongHoc,
      'trangThai': trangThai,
    };
  }
}
