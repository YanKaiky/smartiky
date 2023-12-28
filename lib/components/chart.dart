// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';

class Chart extends StatefulWidget {
  final int index;

  const Chart({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<TransactionsHistoryModel> data = [];

  final TransactionsHistoryRepository transactionsHistoryRepository =
      TransactionsHistoryRepository();

  List<TransactionsHistoryModel> transactionsHistory = [];

  @override
  void initState() {
    getTransactionsHistoryPeriod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('Chart'),
      ),
    );
  }

  Future getTransactionsHistoryPeriod() async {
    switch (widget.index) {
      case 0:
        data = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
        break;
      case 1:
        data = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'week');
        break;
      case 2:
        data = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'month');
        break;
      case 3:
        data = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'year');
        break;
      default:
        data = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
    }

    if (mounted) setState(() {});
  }
}

class SalesData {
  final String month;
  final int sales;

  SalesData(this.sales, this.month);
}
