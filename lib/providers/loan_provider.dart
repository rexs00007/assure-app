import 'dart:async';

import 'package:assure/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/LoanModel.dart';

class LoanProvider with ChangeNotifier {
  List<LoanModel> _loanList = [];
  List<LoanModel> get loanList => _loanList;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _subscription;

  initState(BuildContext context) {
    if (kDebugMode) {
      print('loan init');
    }
    FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
      if (snapshot != null) {
        getLoans(snapshot, context);
      }
    });
  }


  void getLoans(User? firebaseUser,BuildContext context) {
    if (kDebugMode) {
      print('calling loan');
    }

    // Clear the existing list before adding new data
    _loanList.clear();

    // Create a reference to the collection
    CollectionReference<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection('loans');

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Create a query to get documents where 'uid' is equal to the user's uid
    Query<Map<String, dynamic>> query =
    collectionRef.where('phone_no', isEqualTo: userProvider.currentUser?.phone);

    // Listen to the snapshots stream and handle changes
    _subscription = query.snapshots().listen((querySnapshot) {
      _loanList.clear(); // Clear the existing list before adding new data

      if (querySnapshot.size > 0) {
        // Loop through the documents and add them to the list
        querySnapshot.docs.forEach((doc) {
          if (doc.exists) {
            if (kDebugMode) {
              print("loan data found!!");
              // print(doc.data());
            }
            _loanList.add(LoanModel.fromFirestore(doc));
           // print(_loanList);
          }
        });

        // Notify listeners after the list is updated
        notifyListeners();
      }
    });
  }


 /* getLoans(User? firebaseUser) async {
    if (kDebugMode) {
      print('calling loan');
    }

    await FirebaseFirestore.instance
        .collection('loans')
        .where('uid', isEqualTo: firebaseUser!.uid)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.size > 0) {
        _loanList.clear(); // Clear the existing list before adding new data

        querySnapshot.docs.forEach((doc) {
          if (doc.exists) {
            if (kDebugMode) {
              print("loan data found!!");
              // print(doc.data());
            }
            _loanList.add(LoanModel.fromFirestore(doc));
          }
        });

        notifyListeners();
      }
    });
  }*/
}