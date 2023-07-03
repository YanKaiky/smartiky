// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:smartiky/utils/colors.dart';

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
  List<TransactionsHistoryModel> a = [];
  bool b = true;
  bool j = true;

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
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: const TextStyle(
            color: AppColors.text,
          ),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: const TextStyle(
            color: AppColors.text,
          ),
        ),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: AppColors.primaryBlack,
            width: 3,
            dataSource: <SalesData>[
              SalesData(100, 'Mon'),
              SalesData(20, 'Tue'),
              SalesData(40, 'Wen'),
              SalesData(15, 'Sat'),
              SalesData(5, 'Sun'),
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }

  Future getTransactionsHistoryPeriod() async {
    switch (widget.index) {
      case 0:
        a = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
        b = true;
        j = true;
        break;
      case 1:
        a = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'week');
        b = false;
        j = true;
        break;
      case 2:
        a = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'month');
        b = false;
        j = true;
        break;
      case 3:
        a = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod(period: 'year');
        j = false;
        break;
      default:
        a = await TransactionsHistoryRepository()
            .getTransactionsHistoryPeriod();
        b = true;
        j = true;
    }

    if (mounted) setState(() {});
  }
}

class SalesData {
  final String month;
  final int sales;

  SalesData(this.sales, this.month);
}
