// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<TransactionsHistoryModel> data = [];

  @override
  void initState() {
    super.initState();
    getTransactionsHistoryPeriod();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getTransactionsHistoryPeriod(),
      builder: (context, snapshot) {
        return buildChart();
      },
    );
  }

  Widget buildChart() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 3000,
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
                FlSpot(0, filterDataByWeekday(1)),
                FlSpot(1, filterDataByWeekday(2)),
                FlSpot(2, filterDataByWeekday(3)),
                FlSpot(3, filterDataByWeekday(4)),
                FlSpot(4, filterDataByWeekday(5)),
                FlSpot(5, filterDataByWeekday(6)),
                FlSpot(6, filterDataByWeekday(7)),
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

    Text text = const Text('');

    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 1:
        text = const Text('Tur', style: style);
        break;
      case 2:
        text = const Text('Wen', style: style);
        break;
      case 3:
        text = const Text('Thu', style: style);
        break;
      case 4:
        text = const Text('Fri', style: style);
        break;
      case 5:
        text = const Text('Sat', style: style);
        break;
      case 6:
        text = const Text('Sun', style: style);
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
    data = await TransactionsHistoryRepository().getTransactionsHistoryPeriod();

    if (mounted) setState(() {});
  }

  double filterDataByWeekday(int targetWeekday) {
    double val = 0.0;

    DateTime datetime = DateTime.now();

    for (var item in data) {
      DateTime itemDate =
          DateTime.parse(item.date.split('/').reversed.join('-'));

      if (itemDate.weekday == targetWeekday && itemDate.year == datetime.year) {
        val += item.value;
      }
    }

    return val;
  }
}
