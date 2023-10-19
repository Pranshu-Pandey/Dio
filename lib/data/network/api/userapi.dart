import 'package:demo/data/network/api/constant/endpoints.dart';
import 'package:demo/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class UserApi {
final DioClient dioClient = DioClient();

Future<Response> getUsersApi() async {
  try {
    final Response response = await dioClient.get(Endpoints.users);
    return response;
  } catch (e) {
    rethrow;
  }
}

}