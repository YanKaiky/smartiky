// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smartiky/components/chart.dart';
import 'package:smartiky/components/moments.statistic.dart';
import 'package:smartiky/components/title.list.statistics.dart';
import 'package:smartiky/models/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';
import 'package:smartiky/utils/masks.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<TransactionsHistoryModel> transactionsHistoryRepository =
        TransactionsHistoryRepository()
            .getTransactionsHistory()
            .where((t) => t.type == 'output')
            .toList();

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
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    const Chart(),
                    const SizedBox(height: defaultPadding * 2),
                    const TitleListStatistics(
                      label: 'Top Spending',
                      icon: Icons.swap_vert_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                          icons(transactionsHistoryRepository[i].category),
                          height: 50),
                    ),
                    title: Text(
                      transactionsHistoryRepository[i].title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.title,
                      ),
                    ),
                    subtitle: Text(
                      ptBRDate(transactionsHistoryRepository[i].date),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.text,
                      ),
                    ),
                    trailing: Text(
                      currency(
                        transactionsHistoryRepository[i].type,
                        transactionsHistoryRepository[i].value,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: transactionsHistoryRepository[i].type == 'output'
                            ? AppColors.secondary
                            : AppColors.primaryBlack,
                        fontSize: 19,
                      ),
                    ),
                  );
                },
                childCount: transactionsHistoryRepository.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
