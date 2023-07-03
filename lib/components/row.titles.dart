import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class RowTitles extends StatelessWidget {
  final String title;
  final String? secondTitle;

  const RowTitles({
    Key? key,
    required this.title,
    this.secondTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding + 5,
        ),
        child: secondTitle != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: AppColors.title,
                    ),
                  ),
                  Text(
                    secondTitle!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: AppColors.title,
                ),
              ),
      ),
    );
  }
}
