import 'package:dio/dio.dart';
import 'package:store_app/core/cash/value.dart';
import 'package:store_app/features/profile/data/model/profile_model.dart';

class ProfileService {
  getUserProfileData() async {
    final Dio dio = Dio();
    var response = await dio.post(
      'https://elwekala.onrender.com/user/profile',
      data: {"token": "t03s70bb75km6bbwebh"},
    );

    try {
      Map<String, dynamic> jsonData = response.data;
      var user = ProfileModel.fromJson(jsonData);
      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
    }
    throw Exception();
  }
}
