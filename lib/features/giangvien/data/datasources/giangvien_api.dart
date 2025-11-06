import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';

class GiangVienApi {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> getLopHocPhan() async {
    final response = await _apiService.get(ApiEndpoints.giangvienLopHocPhan);
    return response;
  }
  Future<List<dynamic>> getSinhVienByLopHocPhan(String maLopHocPhan) async {
    final response =
    await _apiService.get(ApiEndpoints.sinhVienByLopHocPhan(maLopHocPhan));
    return response['data'] ?? [];
  }
  // Future<Map<String, dynamic>> getLichDay() async =>
  //     await _apiService.get(ApiEndpoints.giangvienLichDay);
  //
  // Future<Map<String, dynamic>> getThongKe() async =>
  //     await _apiService.get(ApiEndpoints.giangvienThongKe);

  // Future<List<dynamic>> getSinhVienByLopHocPhan(String maLopHP) async {
  //   final response =
  //   await _apiService.get(ApiEndpoints.sinhVienByLopHocPhan(maLopHP));
  //   return response['data'] ?? [];
  // }

}
