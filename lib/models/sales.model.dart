import 'dart:convert';

class SalesModel {
  final String guid;
  final String year;
  final String sales;

  SalesModel({
    required this.guid,
    required this.year,
    required this.sales,
  });

  SalesModel copyWith({
    String? guid,
    String? year,
    String? sales,
  }) {
    return SalesModel(
      guid: guid ?? this.guid,
      year: year ?? this.year,
      sales: sales ?? this.sales,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'year': year,
      'sales': sales,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> json) {
    return SalesModel(
      guid: json['guid'] ?? '',
      year: json['year'] ?? '',
      sales: json['sales'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesModel.fromJson(String source) =>
      SalesModel.fromMap(json.decode(source));
}
