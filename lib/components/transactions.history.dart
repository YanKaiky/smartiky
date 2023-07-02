import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/masks.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  final TransactionsHistoryRepository transactionsHistoryRepository =
      TransactionsHistoryRepository();

  List<TransactionsHistoryModel> transactionsHistory = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(icons(transactionsHistory[i].category),
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
              ptBRDate(transactionsHistory[i].date),
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
    );
  }

  Future init() async {
    transactionsHistory =
        await TransactionsHistoryRepository().getTransactionsHistory();

    if (mounted) setState(() {});
  }
}
