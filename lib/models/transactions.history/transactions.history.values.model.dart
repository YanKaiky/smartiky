import 'dart:convert';

class TransactionsHistoryValuesModel {
  final num total;
  final num expenses;
  final num incomes;

  TransactionsHistoryValuesModel({
    required this.total,
    required this.expenses,
    required this.incomes,
  });

  TransactionsHistoryValuesModel copyWith({
    num? total,
    num? expenses,
    num? incomes,
  }) {
    return TransactionsHistoryValuesModel(
      total: total ?? this.total,
      expenses: expenses ?? this.expenses,
      incomes: incomes ?? this.incomes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'expenses': expenses,
      'incomes': incomes,
    };
  }

  factory TransactionsHistoryValuesModel.fromMap(Map<String, dynamic> json) {
    return TransactionsHistoryValuesModel(
      total: json['total'] ?? 0,
      expenses: json['expenses'] ?? 0,
      incomes: json['incomes'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsHistoryValuesModel.fromJson(String source) =>
      TransactionsHistoryValuesModel.fromMap(json.decode(source));
}
