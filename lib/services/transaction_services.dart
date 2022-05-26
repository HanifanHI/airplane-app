import 'package:airplane_apps/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  // * CREATE OBJECT COLLECTION
  CollectionReference _transactionReferences =
      FirebaseFirestore.instance.collection('transactions');

  // * CREATE METHODE SET USER
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReferences.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  // * CREATE METHODE FECTH DATA
  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      // * MENGAMBIL DATA DARI COLLECTION TRANSACTIONS
      QuerySnapshot result = await _transactionReferences.get();

      // * MAPPING DATA
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
