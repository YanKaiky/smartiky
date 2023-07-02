import 'package:hive/hive.dart';
import 'package:smartiky/models/transactions.history/transactions.history.model.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class TransactionsHistoryModelAdapter
    extends TypeAdapter<TransactionsHistoryModel> {
  @override
  final int typeId = 0; // Unique identifier to adapter;

  @override
  TransactionsHistoryModel read(BinaryReader reader) {
    final guid = reader.readString();
    final title = reader.readString();
    final explain = reader.readString();
    final date = reader.readString();
    final type = reader.readString();
    final value = reader.readDouble();
    final category = reader.readString();

    return TransactionsHistoryModel(
      guid: guid,
      title: title,
      explain: explain,
      date: date,
      type: type,
      value: value,
      category: category,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionsHistoryModel obj) {
    writer.writeString(obj.guid);
    writer.writeString(obj.title);
    writer.writeString(obj.explain);
    writer.writeString(obj.date);
    writer.writeString(obj.type);
    writer.writeDouble(double.parse(obj.value.toString()));
    writer.writeString(obj.category);
  }
}
