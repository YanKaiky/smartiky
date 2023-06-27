// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/components/card.moment.statistic.dart';
import 'package:smartiky/components/moments.statistic.dart';

import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding + 5,
                  vertical: defaultPadding,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Statistics',
                      style: TextStyle(
                        color: AppColors.title,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    const MomentsStatistic(),
                    const SizedBox(height: defaultPadding * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Expense'),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
