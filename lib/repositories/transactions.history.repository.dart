import 'package:smartiky/models/transactions.history.model.dart';

class TransactionsHistoryRepository {
  List<TransactionsHistoryModel> getTransactionsHistory() {
    try {
      final values = [
        {
          "guid": "4d0b45a6-4292-4781-9b2d-95d0d5ee7b17",
          "title": 'Towty',
          "date": '2023-06-26',
          "type": 'entry',
          "value": 1320,
          "category": 'payment',
        },
        {
          "guid": "ac0f8cc8-06bd-4b21-b6c4-f0eb0000276e",
          "title": 'FasCheckin',
          "date": '2023-06-25',
          "type": 'entry',
          "value": 131,
          "category": 'payment',
        },
        {
          "guid": "c93a3fb9-305a-452c-b673-dafbacf41365",
          "title": 'Internet',
          "date": '2023-06-24',
          "type": 'output',
          "value": 23,
          "category": 'internet',
        },
        {
          "guid": "034c2e0c-b352-4a30-956e-ceb8ac0dffa4",
          "title": 'CallZap',
          "date": '2023-06-24',
          "type": 'entry',
          "value": 131,
          "category": 'payment',
        },
        {
          "guid": "903d1839-a22a-4ea1-ac91-4b628fc16967",
          "title": 'Cinema',
          "date": '2023-06-23',
          "type": 'output',
          "value": 3.5,
          "category": 'movie',
        },
        {
          "guid": "bfefc112-7852-4bb0-98dd-5f34b0ea1936",
          "title": 'Netflix',
          "date": '2023-06-22',
          "type": 'output',
          "value": 11.68,
          "category": 'netflix',
        },
        {
          "guid": "9090a806-334e-4e6b-9307-62852cf148d7",
          "title": 'HBO Max',
          "date": '2023-06-22',
          "type": 'output',
          "value": 0.97,
          "category": 'hbo',
        },
        {
          "guid": "ee1004f0-8d65-4e5b-bdb0-c8df5bcacc37",
          "title": 'Star+',
          "date": '2023-06-22',
          "type": 'output',
          "value": 4.78,
          "category": 'star+',
        },
        {
          "guid": "b42435e3-cb8f-4160-a5d2-7bee53636c32",
          "title": 'Disney+',
          "date": '2023-06-22',
          "type": 'output',
          "value": 4.78,
          "category": 'disney+',
        },
        {
          "guid": "cdc047a2-e474-4a00-a91f-6fcd78bc1154",
          "title": 'Promosys',
          "date": '2023-06-23',
          "type": 'entry',
          "value": 131,
          "category": 'payment',
        },
      ];

      final List<TransactionsHistoryModel> data =
          List<TransactionsHistoryModel>.from(
        (values).map<TransactionsHistoryModel>(
          (item) => TransactionsHistoryModel.fromMap(item),
        ),
      );

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
