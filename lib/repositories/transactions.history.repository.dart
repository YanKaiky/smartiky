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

      final List<TransactionsHistoryModel> values = box.values.where((element) {
        DateTime datetime = DateTime.now();

        if (period == 'week') {
          return usaDate(element.date).day == datetime.day;
        }

        if (period == 'month') {
          return usaDate(element.date).month == datetime.month;
        }

        if (period == 'year') {
          return usaDate(element.date).year == datetime.year;
        }

        return usaDate(element.date).day == datetime.day; // today
      }).toList();

      return values;
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
