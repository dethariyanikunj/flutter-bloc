import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  late Dio _dio;

  Api() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com",
        connectTimeout: const Duration(
          seconds: 25,
        ),
        receiveTimeout: const Duration(
          seconds: 25,
        ),
        responseType: ResponseType.json,
        validateStatus: (_) => true,
      ),
    )..interceptors.add(PrettyDioLogger());
  }

  Dio get apiRequest => _dio;
}
