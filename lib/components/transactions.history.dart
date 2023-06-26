import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/masks.dart';

class TransactionsHistory extends StatelessWidget {
  const TransactionsHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TransactionsHistoryModel> transactionsHistoryRepository =
        TransactionsHistoryRepository().getTransactionsHistory();

    return SliverList(
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
    );
  }
}
