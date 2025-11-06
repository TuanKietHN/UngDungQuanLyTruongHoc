import 'monhoc_model.dart';
import 'giangvien_model.dart';

class LopHocPhan {
  final int maLopHP;
  final String maSoLopHP;
  final String hocKy;
  final String namHoc;
  final String thongTinLichHoc;
  final MonHoc monHoc;
  final GiangVien giangVien;

  // mock fields để giữ giao diện cũ
  final String phong;
  final int diemDanhHienTai;
  final int tongSoBuoi;

  LopHocPhan({
    required this.maLopHP,
    required this.maSoLopHP,
    required this.hocKy,
    required this.namHoc,
    required this.thongTinLichHoc,
    required this.monHoc,
    required this.giangVien,
    this.phong = 'A201',
    this.diemDanhHienTai = 0,
    this.tongSoBuoi = 0,
  });

  factory LopHocPhan.fromJson(Map<String, dynamic> json) {
    return LopHocPhan(
      maLopHP: json['maLopHP'],
      maSoLopHP: json['maSoLopHP'] ?? '',
      hocKy: json['hocKy'] ?? '',
      namHoc: json['namHoc'] ?? '',
      thongTinLichHoc: json['thongTinLichHoc'] ?? '',
      monHoc: MonHoc.fromJson(json['mon_hoc'] ?? {}),
      giangVien: GiangVien.fromJson(json['giang_vien'] ?? {}),
      phong: json['thongTinLichHoc']?.split(',').last.trim() ?? 'A201',
      diemDanhHienTai: 12, // mock giữ giao diện
      tongSoBuoi: 30,      // mock giữ giao diện
    );
  }

  double get tiLeDiemDanh =>
      (tongSoBuoi == 0) ? 0 : (diemDanhHienTai / tongSoBuoi);
}
