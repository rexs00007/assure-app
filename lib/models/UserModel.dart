

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? uid;
  /*final String? admin_type;
  final String? email;
  final bool? isBlocked;
  final Timestamp? last_seen;
  final Timestamp? created_at;
  final String? Phone;
  List<String> Pages;*/

  UserModel({
    required this.name,
    required this.uid,
  /*  required this.email,
    required this.isBlocked,
    required this.admin_type,
    required this.last_seen,
    required this.created_at,
    required this.Phone,
    required this.Pages*/
  });


  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      name: doc.get('name'),
        uid: doc.id,
    /*  email: doc.get('email_id'),
      isBlocked: doc.get('is_blocked'),

      admin_type: doc.get('admin_type'),
      last_seen: doc.get('last_seen'),
      created_at: doc.get('created_at'),
      Phone: doc.get('phone_no'),
      Pages: List.from(doc.get('pages'))*/
    );
  }
}

