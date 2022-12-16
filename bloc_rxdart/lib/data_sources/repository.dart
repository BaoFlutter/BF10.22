import 'package:api_lession/data_sources/api_service.dart';

class Repository {
  final ApiService _apiService = ApiService();

  // lấy dữ liệu người dùng
  Future fetchUserInfor() => _apiService.getUserInfor();

}