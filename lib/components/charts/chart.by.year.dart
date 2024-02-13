// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartiky/repositories/transactions.history.repository.dart';
import 'package:smartiky/utils/colors.dart';

class ChartByYear extends StatefulWidget {
  const ChartByYear({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartByYear> createState() => _ChartByYearState();
}

class _ChartByYearState extends State<ChartByYear> {
  Map<int, double> data = [] as Map<int, double>;

  @override
  void initState() {
    super.initState();
    getTransactionsHistoryByYear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getTransactionsHistoryByYear(),
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
                FlSpot(0, data[1]!),
                FlSpot(1, data[2]!),
                FlSpot(2, data[3]!),
                FlSpot(3, data[4]!),
                FlSpot(4, data[5]!),
                FlSpot(5, data[6]!),
                FlSpot(6, data[7]!),
                FlSpot(7, data[8]!),
                FlSpot(8, data[9]!),
                FlSpot(9, data[10]!),
                FlSpot(10, data[11]!),
                FlSpot(11, data[12]!),
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

  Future getTransactionsHistoryByYear() async {
    data = await TransactionsHistoryRepository().getTransactionsHistoryByYear();

    if (mounted) setState(() {});
  }
}
