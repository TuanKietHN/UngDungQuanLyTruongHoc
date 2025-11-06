class GiangVienModel {
  final int? maGV;
  final String? hoTen;
  final String? email;
  final String? sdt;
  final String? maKhoa;
  final String? tenKhoa;

  GiangVienModel({
    this.maGV,
    this.hoTen,
    this.email,
    this.sdt,
    this.maKhoa,
    this.tenKhoa,
  });

  factory GiangVienModel.fromJson(Map<String, dynamic> json) {
    return GiangVienModel(
      maGV: json['maGV'],
      hoTen: json['hoTen'],
      email: json['email'],
      sdt: json['sdt'],
      maKhoa: json['maKhoa'],
      tenKhoa: json['tenKhoa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maGV': maGV,
      'hoTen': hoTen,
      'email': email,
      'sdt': sdt,
      'maKhoa': maKhoa,
      'tenKhoa': tenKhoa,
    };
  }
}
