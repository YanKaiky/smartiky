import 'package:flutter/material.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';
import 'package:smartiky/utils/masks.dart';

class CardHeader extends StatefulWidget {
  const CardHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<CardHeader> createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  final TransactionsHistoryRepository transactionsHistoryRepository =
      TransactionsHistoryRepository();

  num transactionsHistory = 0;
  num transactionsExpensesHistory = 0;
  num transactionsIncomesHistory = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 140,
      left: 37,
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width / 1.25,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            Text(
              'R\$ ${currencyBRL(transactionsHistory)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: (defaultPadding * 2) + 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
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
                  children: [
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
                children: [
                  Text(
                    'R\$ ${currencyBRL(transactionsIncomesHistory)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'R\$ ${currencyBRL(transactionsExpensesHistory)}',
                    style: const TextStyle(
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

  Future init() async {
    final values =
        await TransactionsHistoryRepository().getTotalTransactionsHistory();

    transactionsHistory = values.total;
    transactionsExpensesHistory = values.expenses;
    transactionsIncomesHistory = values.incomes;

    if (mounted) setState(() {});
  }
}
