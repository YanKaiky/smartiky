import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class CardMomentStatistic extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Color? color;
  final Color? bgcolor;

  const CardMomentStatistic({
    Key? key,
    required this.label,
    this.onTap,
    this.bgcolor = AppColors.primaryBlack,
    this.color = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: bgcolor,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
