class UserProfileModelData {
  final String nationalId;
  final String name;

  final String phone;
  final String email;
  final String profileImage;

  UserProfileModelData(
      {required this.email,
      required this.name,
      required this.nationalId,
      required this.phone,
      required this.profileImage});

  factory UserProfileModelData.fromJson(Map<String, dynamic> json) {
    return UserProfileModelData(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      nationalId: json["nationalId"],
      profileImage: json["profileImage"],
    );
  }
}

class ProfileModel {
  final UserProfileModelData userProfileModel;

  ProfileModel({required this.userProfileModel});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userProfileModel: UserProfileModelData.fromJson(
        json["user"],
      ),
    );
  }
}
