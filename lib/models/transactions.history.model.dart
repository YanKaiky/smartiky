import 'dart:convert';

class TransactionsHistoryModel {
  final String guid;
  final String title;
  final String date;
  final String type;
  final num value;
  final String category;

  TransactionsHistoryModel({
    required this.guid,
    required this.title,
    required this.date,
    required this.type,
    required this.value,
    required this.category,
  });

  TransactionsHistoryModel copyWith({
    String? guid,
    String? title,
    String? date,
    String? type,
    num? value,
    String? category,
  }) {
    return TransactionsHistoryModel(
      guid: guid ?? this.guid,
      title: title ?? this.title,
      date: date ?? this.date,
      type: type ?? this.type,
      value: value ?? this.value,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'title': title,
      'date': date,
      'type': type,
      'value': value,
      'category': category,
    };
  }

  factory TransactionsHistoryModel.fromMap(Map<String, dynamic> json) {
    return TransactionsHistoryModel(
      guid: json['guid'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      type: json['type'] ?? '',
      value: json['value'] ?? 0,
      category: json['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsHistoryModel.fromJson(String source) =>
      TransactionsHistoryModel.fromMap(json.decode(source));
}
