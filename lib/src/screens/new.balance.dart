import 'package:flutter/material.dart';
import 'package:smartiky/components/new.balance.content.dart';
import 'package:smartiky/components/new.balance.header.dart';
import 'package:smartiky/utils/colors.dart';

class NewBalance extends StatelessWidget {
  const NewBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: const [
            NewBalanceHeader(),
            NewBalanceContent(),
          ],
        ),
      ),
    );
  }
}
