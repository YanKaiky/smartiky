import 'package:flutter/material.dart';
import 'package:smartiky/components/card.moment.statistic.dart';
import 'package:smartiky/utils/colors.dart';

class MomentsStatistic extends StatefulWidget {
  const MomentsStatistic({super.key});

  @override
  State<MomentsStatistic> createState() => _MomentsStatisticState();
}

class _MomentsStatisticState extends State<MomentsStatistic> {
  List moments = ['Day', 'Week', 'Month', 'Year'];
  int cardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        moments.length,
        (i) => CardMomentStatistic(
          bgcolor: cardIndex == i ? AppColors.primary : AppColors.white,
          color: cardIndex == i ? AppColors.white : AppColors.primaryBlack,
          label: moments[i],
          onTap: () {
            setState(() {
              cardIndex = i;
            });
          },
        ),
      ),
    );
  }
}
