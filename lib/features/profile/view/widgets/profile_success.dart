import 'package:flutter/material.dart';
import 'package:store_app/features/profile/data/model/profile_model.dart';
import 'package:store_app/features/profile/view/widgets/info_card.dart';

class ProfileSuccessPage extends StatelessWidget {
  const ProfileSuccessPage({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 85,
            backgroundColor: Colors.blueAccent,
            child: CircleAvatar(
              radius: 82,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 79,
                backgroundImage:
                    NetworkImage(profileModel.userProfileModel.profileImage),
              ),
            ),
          ),
          Text(
            profileModel.userProfileModel.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          infoCard(
              icon: Icons.email, data: profileModel.userProfileModel.email),
          infoCard(
              icon: Icons.phone, data: profileModel.userProfileModel.phone),
          infoCard(
              icon: Icons.badge,
              data: profileModel.userProfileModel.nationalId),
        ],
      ),
    );
  }
}
