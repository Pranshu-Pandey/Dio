import 'package:demo/data/network/api/constant/endpoints.dart';
import 'package:dio/dio.dart';

class DioClient {
// dio instance
Dio dio = Dio();

DioClient() {
  dio.options.baseUrl = Endpoints.baseUrl;
    // ..options.connectTimeout = Endpoints.connectionTimeout as Duration?
    // ..options.receiveTimeout = Endpoints.receiveTimeout as Duration?
    // ..options.responseType = ResponseType.json;
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
