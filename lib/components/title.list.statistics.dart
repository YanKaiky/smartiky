import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';

class TitleListStatistics extends StatelessWidget {
  final String label;
  final IconData icon;

  const TitleListStatistics({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.title,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Icon(
          icon,
          color: Colors.grey,
          size: 25,
        ),
      ],
    );
  }
}
