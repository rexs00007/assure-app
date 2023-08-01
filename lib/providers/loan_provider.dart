
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


import '../models/LoanModel.dart';


class LoanProvider with ChangeNotifier {
  LoanModel? _currentLoan;
  LoanModel? get currentLoan => _currentLoan;


  initState(){
    if (kDebugMode) {
      print('loan init');
    }
    FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
      if(snapshot!=null){
        getUser(snapshot);
      }
    });
  }

  getUser(User? firebaseUser) async {
    if (kDebugMode) {
      print('calling loan');
    }
    await FirebaseFirestore.instance
        .collection('loans')
        //.doc(firebaseUser!.uid)
     .doc('zyDDmzEVDBFolFS4TgOd')
        .get().then((doc) {
      if (doc.exists) {
        if (kDebugMode) {
          print("loan data found!!");
         // print(doc.data());
        }
        _currentLoan = LoanModel.fromFirestore(doc);
        notifyListeners();

        // updateUser();
      }
    });
  }


  getUser2(User? firebaseUser) async {
    if (kDebugMode) {
      print('calling loan');
    }

    //String currentString = "your_current_uid_here"; // Replace this with the UID you want to fetch

    await FirebaseFirestore.instance
        .collection('loans')
        .where('uid', isEqualTo: firebaseUser!.uid)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.size > 0) {
        // Assuming there is only one document with the provided UID, you can access the first one
        DocumentSnapshot<Map<String, dynamic>> doc = querySnapshot.docs.first;

        if (doc.exists) {
          if (kDebugMode) {
            print("loan data found!!");
            // print(doc.data());
          }
          _currentLoan = LoanModel.fromFirestore(doc);
          notifyListeners();
        }
      }
    });
  }


}