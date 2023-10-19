import 'package:demo/data/Model/model.dart';
import 'package:demo/data/network/api/userapi.dart';
import 'package:dio/dio.dart';

class UserRepository {
  UserApi userApi = UserApi();


  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      throw e;
    }
  }
}