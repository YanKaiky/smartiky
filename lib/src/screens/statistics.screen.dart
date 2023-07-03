// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/components/card.moment.statistic.dart';

import 'package:smartiky/components/chart.dart';
import 'package:smartiky/components/title.list.statistics.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
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
  List<String> moments = ['Day', 'Week', 'Month', 'Year'];
  int cardIndex = 0;

  final TransactionsHistoryRepository transactionsHistoryRepository =
      TransactionsHistoryRepository();

  List<TransactionsHistoryModel> transactionsHistory = [];

  @override
  void initState() {
    getTransactionsHistoryPeriod();
    super.initState();
  }

  ValueNotifier kj = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: kj,
            builder: (context, dynamic value, child) {
              return CustomScrollView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              moments.length,
                              (i) => CardMomentStatistic(
                                bgcolor: cardIndex == i
                                    ? AppColors.primary
                                    : AppColors.white,
                                color: cardIndex == i
                                    ? AppColors.white
                                    : AppColors.primaryBlack,
                                label: moments[i],
                                onTap: () {
                                  setState(() {
                                    cardIndex = i;
                                  });

                                  getTransactionsHistoryPeriod();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('Expense'),
                                    Icon(
                                      Icons.arrow_downward_sharp,
                                      color: AppColors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Chart(index: cardIndex),
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
                                icons(transactionsHistory[i].category),
                                height: 50),
                          ),
                          title: Text(
                            transactionsHistory[i].title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.title,
                            ),
                          ),
                          subtitle: Text(
                            transactionsHistory[i].date,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
                          trailing: Text(
                            currency(
                              transactionsHistory[i].type,
                              transactionsHistory[i].value,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: transactionsHistory[i].type == 'Expand'
                                  ? AppColors.secondary
                                  : AppColors.primaryBlack,
                              fontSize: 19,
                            ),
                          ),
                        );
                      },
                      childCount: transactionsHistory.length,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Future getTransactionsHistoryPeriod() async {
    switch (cardIndex) {
      case 0:
        transactionsHistory = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
        break;
      case 1:
        transactionsHistory = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'week');
        break;
      case 2:
        transactionsHistory = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'month');
        break;
      case 3:
        transactionsHistory = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'year');
        break;
      default:
        transactionsHistory = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
    }

    if (mounted) setState(() {});
  }
}
