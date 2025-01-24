import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/profile/cubit/profile_state.dart';
import 'package:store_app/features/profile/data/service/profile_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileService profileService = ProfileService();

  getProfileDataCubit() async {
    emit(ProfileLoading());
    var success = await profileService.getUserProfileData();
    emit(ProfileSucess(profileModel: success));
  }
}
