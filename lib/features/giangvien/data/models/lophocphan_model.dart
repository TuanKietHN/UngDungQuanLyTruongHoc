class LopHocPhan {
  final String? maLopHP;
  final String? tenMonHoc;
  final String? tenLopHocPhan;
  final int? soLuongSV;
  final String? ngayBatDau;
  final String? ngayKetThuc;

  LopHocPhan({
    this.maLopHP,
    this.tenMonHoc,
    this.tenLopHocPhan,
    this.soLuongSV,
    this.ngayBatDau,
    this.ngayKetThuc,
  });

  factory LopHocPhan.fromJson(Map<String, dynamic> json) {
    return LopHocPhan(
      maLopHP: json['maLopHP']?.toString(),
      tenMonHoc: json['tenMonHoc'] ?? '',
      tenLopHocPhan: json['tenLopHocPhan'] ?? '',
      soLuongSV: json['soLuongSV'] is int
          ? json['soLuongSV']
          : int.tryParse(json['soLuongSV']?.toString() ?? '0'),
      ngayBatDau: json['ngayBatDau'] ?? '',
      ngayKetThuc: json['ngayKetThuc'] ?? '',
    );
  }
}
