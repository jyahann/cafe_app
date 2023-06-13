import 'package:dio/dio.dart';
import 'dart:developer' as log;

class ApiUrl {
  static String _apiUrl = 'https://run.mocky.io';

  static String get apiUrl {
    return _apiUrl;
  }

  ApiUrl(String apiUrl) {
    _apiUrl = apiUrl;
    log.log("Using url $apiUrl");
  }

  static Future<Dio> getDio() async {
    log.log("Using url $apiUrl", name: "ApiUrl");
    Dio dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 5),
      ),
    );
    return dio;
  }
}
