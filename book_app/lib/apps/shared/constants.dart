// ignore_for_file: prefer_final_fields

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Constants {
  static const String baseUrl = "http://192.168.1.36:3000/api";

  static BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
  );

  Dio _dio = Dio();

  Constants() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true, 
      responseBody: true,
      responseHeader: true
    ));
  }

  Dio get sendRequest => _dio;
}
