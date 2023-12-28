import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Center(child: Text('Profile')),
    );
  }
}
