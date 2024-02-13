import 'package:hive/hive.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:smartiky/models/transactions.history/transactions.history.values.model.dart';
import 'package:smartiky/utils/masks.dart';

class TransactionsHistoryRepository {
  createTransactionsHistory({
    required String guid,
    required String title,
    required String explain,
    required String date,
    required String type,
    required num value,
    required String category,
  }) async {
    await Hive.openBox<TransactionsHistoryModel>('transactions');
    final box = Hive.box<TransactionsHistoryModel>('transactions');

    await box.add(TransactionsHistoryModel(
      guid: guid,
      title: title,
      explain: explain,
      date: date,
      type: type,
      value: value,
      category: category,
    ));

    return;
  }

  Future<List<TransactionsHistoryModel>> getTransactionsHistoryPeriod({
    String? period,
  }) async {
    try {
      await Hive.openBox<TransactionsHistoryModel>('transactions');
      final box = Hive.box<TransactionsHistoryModel>('transactions');

      DateTime datetime = DateTime.now();

      List<TransactionsHistoryModel> list = [];

      if (period == 'week') {
        List<TransactionsHistoryModel> week = [];

        final month = box.values
            .where((element) => useDate(element.date).month == datetime.month)
            .toList();

        for (var i = 0; i < month.length; i++) {
          int weekNumberToday =
              (datetime.difference(DateTime(datetime.year, 1, 1)).inDays ~/ 7) +
                  1;
          int weekNumberValue = (useDate(month[i].date)
                      .difference(DateTime(useDate(month[i].date).year, 1, 1))
                      .inDays ~/
                  7) +
              1;

          if (weekNumberToday == weekNumberValue) {
            week.add(month[i]);
          }
        }

        list = week;
      } else if (period == 'month') {
        list = box.values
            .where((element) => useDate(element.date).month == datetime.month)
            .toList();
      } else if (period == 'year') {
        list = box.values
            .where((element) => useDate(element.date).year == datetime.year)
            .toList();
      } else {
        list = box.values
            .where((element) => useDate(element.date).day == datetime.day)
            .toList(); // today
      }

      return list;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<int, double>> getTransactionsHistoryByYear() async {
    try {
      await Hive.openBox<TransactionsHistoryModel>('transactions');
      final box = Hive.box<TransactionsHistoryModel>('transactions');

      DateTime datetime = DateTime.now();

      // ignore: prefer_for_elements_to_map_fromiterable
      final monthlySums = Map<int, double>.fromIterable(
        List<int>.generate(12, (i) => i + 1),
        key: (item) => item,
        value: (item) => 0.0,
      );

      box.values
          .where((element) => useDate(element.date).year == datetime.year)
          .forEach((element) {
        DateTime itemDate =
            DateTime.parse(element.date.split('/').reversed.join('-'));
        int month = itemDate.month;
        num value = element.value;

        // Adiciona o valor ao total do mês
        monthlySums[month] = monthlySums[month]! + value;
      });

      return monthlySums;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<TransactionsHistoryModel>> getTransactionsHistory() async {
    try {
      await Hive.openBox<TransactionsHistoryModel>('transactions');
      final box = Hive.box<TransactionsHistoryModel>('transactions');

      final List<TransactionsHistoryModel> values = box.values.toList();

      return values;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<TransactionsHistoryValuesModel> getTotalTransactionsHistory() async {
    try {
      await Hive.openBox<TransactionsHistoryModel>('transactions');
      final box = Hive.box<TransactionsHistoryModel>('transactions');

      final listTotal = [];
      final listExpenses = [];
      final listIncomes = [];

      num total = 0;
      num expenses = 0;
      num incomes = 0;

      final List<TransactionsHistoryModel> values = box.values.toList();

      for (var i = 0; i < values.length; i++) {
        final ttl =
            values[i].type == 'Income' ? values[i].value : values[i].value * -1;

        if (values[i].type == 'Expand') {
          listExpenses.add(values[i].value * -1);
        }

        if (values[i].type == 'Income') {
          listIncomes.add(values[i].value);
        }

        listTotal.add(ttl);
      }

      for (num value in listTotal) {
        total += value;
      }

      for (num value in listExpenses) {
        expenses += value;
      }
      for (num value in listIncomes) {
        incomes += value;
      }

      return TransactionsHistoryValuesModel(
        total: total,
        expenses: expenses,
        incomes: incomes,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  deleteTransactionsHistory({
    required String key,
  }) async {
    await Hive.openBox<TransactionsHistoryModel>('transactions');
    final box = Hive.box<TransactionsHistoryModel>('transactions');

    await box.delete(key);

    return;
  }
}
