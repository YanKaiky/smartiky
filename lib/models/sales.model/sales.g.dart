import 'package:hive/hive.dart';
import 'package:smartiky/models/sales.model/sales.model.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class SalesModelAdapter extends TypeAdapter<SalesModel> {
  @override
  final int typeId = 1; // Unique identifier to adapter;

  @override
  SalesModel read(BinaryReader reader) {
    final guid = reader.readString();
    final sales = reader.readString();
    final year = reader.readString();

    return SalesModel(
      guid: guid,
      sales: sales,
      year: year,
    );
  }

  @override
  void write(BinaryWriter writer, SalesModel obj) {
    writer.writeString(obj.guid);
    writer.writeString(obj.sales);
    writer.writeString(obj.year);
  }
}
