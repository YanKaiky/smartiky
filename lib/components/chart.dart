// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
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
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6000,
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                  color: Color.fromARGB(255, 203, 203, 203), strokeWidth: 1);
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                  color: Color.fromARGB(255, 203, 203, 203), strokeWidth: 1);
            },
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 2313),
                const FlSpot(1, 1983),
                const FlSpot(2, 2543),
                const FlSpot(3, 3008),
                const FlSpot(4, 1024),
                const FlSpot(5, 2343),
                const FlSpot(6, 1573),
                const FlSpot(7, 3000),
                const FlSpot(8, 4733),
                const FlSpot(9, 2774),
                const FlSpot(10, 3421),
                const FlSpot(11, 2331),
              ],
              isCurved: true,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 6,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 1:
        text = const Text('FEB', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 3:
        text = const Text('APR', style: style);
        break;
      case 4:
        text = const Text('MAY', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 7:
        text = const Text('AUG', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 9:
        text = const Text('OCT', style: style);
        break;
      case 10:
        text = const Text('NOV', style: style);
        break;
      case 11:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
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
