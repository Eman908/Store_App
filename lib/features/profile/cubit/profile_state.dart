import 'package:store_app/features/profile/data/model/profile_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSucess extends ProfileState {
  final ProfileModel profileModel;
  ProfileSucess({required this.profileModel});
}

final class ProfileLoading extends ProfileState {}
