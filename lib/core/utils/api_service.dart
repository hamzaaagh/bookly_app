import 'package:dio/dio.dart';

class ApiService {
  // ignore: unused_field
  final _baseurl = "https://www.googleapis.com/books/v1/volumes";
  final Dio dio;
  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await dio.get("$_baseurl$endpoint");

    return response.data;
  }
}
