import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class ButtonSave extends StatelessWidget {
  final void Function() onTap;
  final String label;

  const ButtonSave({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: AppColors.primary,
        ),
        width: 300,
        height: 50,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            fontSize: defaultPadding * 2,
          ),
        ),
      ),
    );
  }
}
