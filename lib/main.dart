import 'package:flutter/material.dart';
import 'package:smartiky/config/hive.config.dart';
import 'package:smartiky/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const App());
}
