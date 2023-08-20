import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/NewLoanModel.dart';



// class NewLoanProvider with ChangeNotifier {
//   List<NewLoanModel> _newLoans = [];
//   List<NewLoanModel> get newLoans => _newLoans; // Update the getter name
//
//   initState() {
//     // Initialize the provider by listening to FirebaseAuth changes
//     FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
//       if (snapshot != null) {
//         getNewUserLoans(snapshot); // Update the method name
//       }
//     });
//   }
//
//   getNewUserLoans(User? firebaseUser) async {
//     if (kDebugMode) {
//       print('calling newLoan');
//     }
//
//     await FirebaseFirestore.instance
//         .collection('all_loans') // Update the collection name
//         .where('uid', isEqualTo: firebaseUser!.uid)
//         .get()
//         .then((querySnapshot) {
//       if (querySnapshot.size > 0) {
//         // Clear the existing list before adding new data
//         _newLoans.clear();
//
//         // Loop through the documents and add them to the list
//         querySnapshot.docs.forEach((doc) {
//           if (doc.exists) {
//             if (kDebugMode) {
//               print("newLoan data found!!");
//               // print(doc.data());
//             }
//             _newLoans.add(NewLoanModel.fromFirestore(doc));
//           }
//         });
//
//         // Notify listeners after the list is updated
//         notifyListeners();
//       }
//     });
//   }
// }



class NewLoanProvider with ChangeNotifier {
  // ... other existing code ...

  // Add a reference to the collection stream
  List<NewLoanModel> _newLoans = [];
  List<NewLoanModel> get newLoans => _newLoans; // Update the getter name
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _loansStream;

  initState() {
    // Initialize the provider by listening to FirebaseAuth changes
    FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
      if (snapshot != null) {
        getNewUserLoans(snapshot); // Update the method name
      }
    });
  }

  // Use active listener with snapshots() method
  getNewUserLoans(User? firebaseUser) {
    if (kDebugMode) {
      print('calling newLoan');
    }

    // Clear the existing list before adding new data
    _newLoans.clear();

    // Create a reference to the collection
    CollectionReference<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection('all_loans');

    // Create a query to get documents where 'uid' is equal to the user's uid
    Query<Map<String, dynamic>> query =
    collectionRef.where('uid', isEqualTo: firebaseUser!.uid);

    // Listen to the snapshots stream and handle changes
    _loansStream = query.snapshots().listen((querySnapshot) {
      if (querySnapshot.size > 0) {
        // Clear the existing list before adding new data
        _newLoans.clear();

        // Loop through the documents and add them to the list
        querySnapshot.docs.forEach((doc) {
          if (doc.exists) {
            if (kDebugMode) {
              print("newLoan data found!!");
              // print(doc.data());
            }
            _newLoans.add(NewLoanModel.fromFirestore(doc));
          }
        });

        // Notify listeners after the list is updated
        notifyListeners();
      }
    });
  }

  // Dispose the stream subscription when the provider is no longer needed
  @override
  void dispose() {
    _loansStream?.cancel();
    super.dispose();
  }
}