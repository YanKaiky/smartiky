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
          maxX: widget.index == 0
              ? 6
              : widget.index == 1 && currentMonth == 2
                  ? 3
                  : widget.index == 1 && currentMonth != 2
                      ? 4
                      : widget.index == 2
                          ? 5
                          : 11,
          minY: 0,
          maxY: widget.index == 0 ? 1000 : 6000,
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
              spots: widget.index == 0
                  ? [
                      FlSpot(0, filterDataByWeekday(1)),
                      FlSpot(1, filterDataByWeekday(2)),
                      FlSpot(2, filterDataByWeekday(3)),
                      FlSpot(3, filterDataByWeekday(4)),
                      FlSpot(4, filterDataByWeekday(5)),
                      FlSpot(5, filterDataByWeekday(6)),
                      FlSpot(6, filterDataByWeekday(7)),
                    ]
                  : widget.index == 1 && currentMonth == 2
                      ? [
                          FlSpot(0, filterDataByWeekday(1)),
                          FlSpot(1, filterDataByWeekday(2)),
                          FlSpot(2, filterDataByWeekday(3)),
                          FlSpot(3, filterDataByWeekday(4)),
                        ]
                      : widget.index == 1 && currentMonth != 2
                          ? [
                              FlSpot(0, filterDataByWeekday(1)),
                              FlSpot(1, filterDataByWeekday(2)),
                              FlSpot(2, filterDataByWeekday(3)),
                              FlSpot(3, filterDataByWeekday(4)),
                              FlSpot(4, filterDataByWeekday(5)),
                            ]
                          : widget.index == 2
                              ? [
                                  FlSpot(0, filterDataByYear(1)),
                                  FlSpot(1, filterDataByYear(2)),
                                  FlSpot(2, filterDataByYear(3)),
                                  FlSpot(3, filterDataByYear(4)),
                                  FlSpot(4, filterDataByYear(5)),
                                  FlSpot(5, filterDataByYear(6)),
                                ]
                              : [
                                  FlSpot(0, filterDataByYear(1)),
                                  FlSpot(1, filterDataByYear(2)),
                                  FlSpot(2, filterDataByYear(3)),
                                  FlSpot(3, filterDataByYear(4)),
                                  FlSpot(4, filterDataByYear(5)),
                                  FlSpot(5, filterDataByYear(6)),
                                  FlSpot(6, filterDataByYear(7)),
                                  FlSpot(7, filterDataByYear(8)),
                                  FlSpot(8, filterDataByYear(9)),
                                  FlSpot(9, filterDataByYear(10)),
                                  FlSpot(10, filterDataByYear(11)),
                                  FlSpot(11, filterDataByYear(12)),
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

    Widget text = const Text('');

    if (widget.index == 0) {
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
    } else if (widget.index == 1) {
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
    } else {
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

  double filterDataByYear(
    int targetMonth,
  ) {
    double val = 0.0;

    for (var item in data) {
      DateTime itemDate =
          DateTime.parse(item.date.split('/').reversed.join('-'));

      if (itemDate.month == targetMonth) {
        val = val + item.value;
      }
    }

    return val;
  }
}
