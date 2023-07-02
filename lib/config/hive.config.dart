import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartiky/models/sales.model/sales.g.dart';
import 'package:smartiky/models/transactions.history/transactions.history.g.dart';

class HiveConfig {
  static start() async {
    Directory directory = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(directory.path);
    Hive.registerAdapter(TransactionsHistoryModelAdapter());
    Hive.registerAdapter(SalesModelAdapter());
  }
}
