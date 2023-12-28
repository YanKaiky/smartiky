import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Center(child: Text('Wallet')),
    );
  }
}
