import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 140,
      left: 37,
      child: Container(
        height: 170,
        width: 320,
        padding: const EdgeInsets.all(defaultPadding + 5),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(47, 125, 121, 0.3),
              offset: Offset(0, 6),
              blurRadius: 12,
              spreadRadius: 6,
            )
          ],
          color: AppColors.primaryBlack,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: AppColors.white,
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            const Text(
              '\$ 2,185.40',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: (defaultPadding * 2) + 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.arrow_downward,
                        color: AppColors.white,
                        size: 19,
                      ),
                    ),
                    SizedBox(width: defaultPadding),
                    Text(
                      'Income',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.arrow_upward,
                        color: AppColors.white,
                        size: 19,
                      ),
                    ),
                    SizedBox(width: defaultPadding),
                    Text(
                      'Expenses',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '\$ 255',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    '\$ 122.52',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
