sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState {
  final dynamic authData;
  AuthSuccessState({required this.authData});
}

final class AuthLoadingState extends AuthState {}

final class ChooseImage extends AuthState {}

final class LoginSuccessState extends AuthState {
  final dynamic loginUserData;
  LoginSuccessState({required this.loginUserData});
}
