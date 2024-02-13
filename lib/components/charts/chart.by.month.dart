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
  int currentMonth = DateTime.now().month;

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
          maxX: currentMonth == 2 ? 3 : 4,
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
              spots: currentMonth == 2
                  ? [
                      FlSpot(0, filterDataByWeekday(1)),
                      FlSpot(1, filterDataByWeekday(2)),
                      FlSpot(2, filterDataByWeekday(3)),
                      FlSpot(3, filterDataByWeekday(4)),
                    ]
                  : [
                      FlSpot(0, filterDataByWeekday(1)),
                      FlSpot(1, filterDataByWeekday(2)),
                      FlSpot(2, filterDataByWeekday(3)),
                      FlSpot(3, filterDataByWeekday(4)),
                      FlSpot(4, filterDataByWeekday(5)),
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

    bool isLeapYear(int year) {
      return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    int currentYear = DateTime.now().year;
    bool isCurrentYearLeap = isLeapYear(currentYear);

    int month = value.toInt() + 1;

    int getDaysInMonth() {
      switch (month) {
        case 1:
          return 31;
        case 2:
          return isCurrentYearLeap ? 29 : 28;
        case 3:
          return 31;
        case 4:
          return 30;
        case 5:
          return 31;
        case 6:
          return 30;
        case 7:
          return 31;
        case 8:
          return 31;
        case 9:
          return 30;
        case 10:
          return 31;
        case 11:
          return 30;
        case 12:
          return 31;
        default:
          return 0;
      }
    }

    int daysInMonth = getDaysInMonth();
    int daysPerWeek = 7;

    // Calcula o número de semanas no mês
    int weeksInMonth = (daysInMonth / daysPerWeek).ceil();

    // Calcula o intervalo de dias para cada semana
    int startDay = 1;
    int endDay = daysPerWeek;

    // Calcula os rótulos para a semana do mês
    for (int week = 0; week < weeksInMonth; week++) {
      if (value >= week && value < week + 1) {
        text = Text('$startDay-$endDay', style: style);
        break;
      }
      startDay = endDay + 1;
      endDay = (endDay + daysPerWeek) > daysInMonth
          ? daysInMonth
          : (endDay + daysPerWeek);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Future getTransactionsHistoryPeriod() async {
    data = await TransactionsHistoryRepository()
        .getTransactionsHistoryPeriod(period: 'month');

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
