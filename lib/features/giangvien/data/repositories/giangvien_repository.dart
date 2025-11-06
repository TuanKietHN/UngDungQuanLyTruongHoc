import '../datasources/giangvien_api.dart';
import '../models/lophocphan_model.dart';
import '../models/sinhvien_model.dart';
class GiangVienRepository {
  final GiangVienApi api = GiangVienApi();

  Future<List<LopHocPhan>> fetchLopHocPhan() async {
    final response = await api.getLopHocPhan();
    // "data" chứa danh sách lớp học phần
    final data = response['data'] ?? [];
    return data.map<LopHocPhan>((e) => LopHocPhan.fromJson(e)).toList();
  }
  Future<List<SinhVien>> fetchSinhVienByLopHocPhan(String maLopHocPhan) async {
    final data = await api.getSinhVienByLopHocPhan(maLopHocPhan);
    return data.map<SinhVien>((e) => SinhVien.fromJson(e)).toList();
  }
}
