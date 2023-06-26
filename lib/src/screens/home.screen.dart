import 'package:flutter/material.dart';
import 'package:smartiky/components/header.dart';
import 'package:smartiky/components/row.titles.dart';
import 'package:smartiky/components/transactions.history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Header(),
            RowTitles(title: 'Transactions history', secondTitle: 'See all'),
            TransactionsHistory()
          ],
        ),
      ),
    );
  }
}
