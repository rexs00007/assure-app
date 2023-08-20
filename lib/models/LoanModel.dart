import 'package:cloud_firestore/cloud_firestore.dart';

class LoanModel {
  final String? id;
  final bool? approved;
  final bool? assigned;
  final Timestamp? createdAt;
  final bool? delivered;
  final int? downPayment;
  final String? emailID;
  final String? loanType;
  final String? status;
  final String? subAdminUID;
  final int? totalLoanAmount;
  final String? uid;
  final int? paidAmount;
  final int? tenure;
  final List<EmiModel>? emi;
  final int? currentEmi;
  final bool? agentAssist;
  final Timestamp? nextPayment;

  @override
  String toString() {
    return 'LoanModel{id: $id, approved: $approved, assigned: $assigned, createdAt: $createdAt, '
        'delivered: $delivered, downPayment: $downPayment, emailID: $emailID, loanType: $loanType, '
        'status: $status, subAdminUID: $subAdminUID, totalLoanAmount: $totalLoanAmount, uid: $uid, emi: $emi}';
  }

  LoanModel({
    required this.id,
    required this.approved,
    required this.assigned,
    required this.createdAt,
    required this.delivered,
    required this.downPayment,
    required this.emailID,
    required this.loanType,
    required this.status,
    required this.subAdminUID,
    required this.totalLoanAmount,
    required this.uid,
    this.emi,
    this.paidAmount,
    this.tenure,
    this.currentEmi,
    this.agentAssist,
    this.nextPayment
  });

  factory LoanModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;


    List<EmiModel>? emiList;
    if (data['emi'] != null) {
      if (data['emi'] is List<dynamic>) {
        emiList = (data['emi'] as List<dynamic>)
            .map((e) => EmiModel.fromMap(e))
            .toList();
      } else if (data['emi'] is Map<String, dynamic>) {
        emiList = [EmiModel.fromMap(data['emi'])];
      }
    }

    return LoanModel(
      id: doc.id,
      approved: data['approved'],
      assigned: data['assigned'],
      createdAt: data['created_at'],
      delivered: data['delivered'],
      downPayment: data['down_payment'],
      emailID: data['emailID'],
      loanType: data['loan_type'],
      status: data['status'],
      subAdminUID: data['sub_admin_uid'],
      totalLoanAmount: data['total_loan_amount'],
      uid: data['uid'],
      paidAmount: data['paid_amount'],
      tenure: data['tenure'],
      agentAssist: data['agentAssist'],
      nextPayment: data['next_payment'],
      currentEmi: data['current_emi'],
     /* emi: (data['emi'] as List<dynamic>?)
          ?.map((e) => EmiModel.fromMap(e))
          .toList(),*/
      emi: emiList
    );
  }
}


class EmiModel {
  final int? amount;
  final Timestamp? dueDate;
  final bool? isVerified;
  final String? paymentMode;
  final String? transactionID;
  final String? verifiedByAdminUID;

  EmiModel({
    required this.amount,
    required this.dueDate,
    required this.isVerified,
    required this.paymentMode,
    required this.transactionID,
    required this.verifiedByAdminUID,
  });

  factory EmiModel.fromMap(Map<String, dynamic> map) {
    return EmiModel(
      amount: map['amount'],
      dueDate: map['due_date'],
      isVerified: map['isVerified'],
      paymentMode: map['paymentMode'],
      transactionID: map['transactionID'],
      verifiedByAdminUID: map['verifiedByAdminUID'],
    );
  }
}