import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:developer' as log;

class ApiUrl {
  final String apiUrl;

  ApiUrl({required this.apiUrl}) {
    log.log("Using url $apiUrl");
  }

  Dio getDio() {
    log.log("Using url $apiUrl", name: "ApiUrl");
    Dio dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 5),
      ),
    );
    return dio;
  }

  Future<T?> request<T>({
    Object? data,
    required String method,
    required String path,
  }) async {
    final dio = getDio();
    final options = Options(
      method: method,
    );

    final response = await dio.request<String>(
      path,
      options: options,
    );

    final T decodedResponse = json.decode(response.data!);

    return decodedResponse;
  }
}
