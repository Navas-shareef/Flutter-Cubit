import 'package:api_with_cubit/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getPostData() async {
    try {
      final Response? response = await _dio.get('$baseUrl$posts');
      return response;
    } catch (error) {
      print('Error :$error');
    }
  }
}
