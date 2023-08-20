import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? docID;
  final String? email;
  final int? idStatus;
  final bool? kycVerified;
  final String? phone;

  final CibilData? cibil;

  UserModel({
    required this.name,
    required this.docID,
    required this.email,
    required this.idStatus,
    required this.kycVerified,
    required this.cibil,
    required this.phone
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      name: doc.get('name'),
      docID: doc.id,
      idStatus: doc.get('id_status'),
      email: doc.get('email_id'),
      phone:   doc.get('phone_no'),
      kycVerified: doc.get('kyc_verified'),
      cibil: CibilData.fromMap(doc.get('cibil')), // Get the "cibil" map and convert to CibilData
    );
  }
}

class CibilData {
  late final bool? complete;
  final CibilDetails? data; // New field "data" of type CibilDetails

  CibilData({
    required this.complete,
    required this.data,
  });

  factory CibilData.fromMap(Map<String, dynamic> map) {
    return CibilData(
      complete: map['complete'],
      data: CibilDetails.fromMap(map['data']), // Get the "data" map and convert to CibilDetails
    );
  }
}


class CibilDetails {
  final Timestamp? createdAt; // Firestore Timestamp
  final String? name;
  final int? calculatedScore;
  final String? number;
  final bool? complete;

  CibilDetails({
     this.createdAt,
     this.name,
     this.calculatedScore,
     this.number,
    this.complete

  });

  factory CibilDetails.fromMap(Map<String, dynamic> map) {
    return CibilDetails(
      createdAt: map['created_at'],
      name: map['name'],
      calculatedScore: map['calculated_score'],
      number: map['number'],
      complete: map['complete']
    );
  }

  // Convert CibilDetails to a Map
  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt, // Firestore Timestamp
      'name': name,
      'calculated_score': calculatedScore,
      'number': number,
      'complete': complete,
    };
  }

}