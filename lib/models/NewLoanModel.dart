import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentHistory {
  final int? amount;
  final String? mode;
  final int? tenure;
  final Timestamp? paidOn; // Use Firestore Timestamp for the "paid_on" field
  final String? tranID;

  PaymentHistory({
    required this.amount,
    required this.mode,
    required this.paidOn,
    required this.tranID,
    this.tenure
  });
}

class NewLoanModel {
  final String? id;
  final String? newLoanType;
  final int? totalAmount;
  final int? painAmount;
  final String? uid;
  final int? tenure;
  final List<PaymentHistory>? paymentHistory; // Add the new array field

  NewLoanModel({
    required this.id,
    required this.newLoanType,
    required this.totalAmount,
    required this.painAmount,
    required this.uid,
    required this.tenure,
    required this.paymentHistory, // Initialize the paymentHistory field
  });

  factory NewLoanModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;

    // Parse the "payment_history" array
    List<PaymentHistory>? paymentHistoryList = (data['payment_history'] as List<dynamic>?)
        ?.map((item) => PaymentHistory(
      amount: item['amount'],
      mode: item['mode'],
      paidOn: item['paid_on'],
      tranID: item['tran_ID'],
    ))
        .toList();

    return NewLoanModel(
      id: doc.id,
      tenure: data['tenure'],
      newLoanType: data['loan_type'],
      totalAmount: data['total_amount'],
      painAmount: data['paid_amount'],
      uid: data['uid'],
      paymentHistory: paymentHistoryList, // Assign the parsed paymentHistoryList to the paymentHistory field
    );
  }
}