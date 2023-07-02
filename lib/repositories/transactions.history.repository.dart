import 'package:hive/hive.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';

class TransactionsHistoryRepository {
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
}
