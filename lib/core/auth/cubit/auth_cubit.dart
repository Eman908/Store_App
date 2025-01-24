import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/core/auth/cubit/auth_state.dart';
import 'package:store_app/core/auth/auth_data/data/service/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthService authService = AuthService();

  getSignUpDataCubit({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
  }) async {
    emit(AuthLoadingState());
    var success = await authService.registerAuthData(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
        token: token,
        profileImage: userImage);
    emit(AuthSuccessState(authData: success));
  }

  ImagePicker picker = ImagePicker();
  File? imageFile;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      Uint8List bytes = File(imageFile!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  getLoginDataCubit({required email, required password}) async {
    emit(AuthLoadingState());
    var success =
        await authService.loginAuthData(email: email, password: password);
    emit(LoginSuccessState(loginUserData: success));
  }
}
