import 'dart:developer';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();
  registerAuthData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
    required profileImage,
  }) async {
    Response response =
        await dio.post('https://elwekala.onrender.com/user/register', data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage
    });

    try {
      var jsonData = response.data;
      log(jsonData["message"]);
      return jsonData;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
    }
  }

  loginAuthData({required email, required password}) async {
    Response response = await dio.post(
        'https://elwekala.onrender.com/user/login',
        data: {"email": email, "password": password});

    try {
      var jsonData = response.data;
      // if (jsonData["status"] == "success") {
      //   var newToken = jsonData["user"]["token"];
      //   var nationalId = jsonData["user"]["nationalId"];
      //   await CashToken.shared!.setString("nID", nationalId);
      //   await CashToken.shared!.setString("token", newToken);
      // }
      log(jsonData["message"]);
      return jsonData;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
    }
  }
}
