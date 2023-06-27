import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
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
}

class SalesData {
  final String month;
  final int sales;

  SalesData(this.sales, this.month);
}
