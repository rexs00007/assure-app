import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../models/UserModel.dart';

class UserProvider with ChangeNotifier {

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  logIN(receivedID,otp) async {




    if (kDebugMode) {
      print('verifying otp');
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otp
    );

    FirebaseAuth auth = FirebaseAuth.instance;

    await auth
        .signInWithCredential(credential)
        .then((value) {
      if (kDebugMode) {
        print(value);
        if(value.user!=null){
          getUser(value.user);
        }
      }

      else {
        if (kDebugMode) {
          print('Something went wrong');
        }
      }

    });


  }

  logOUT(){
    FirebaseAuth.instance.signOut();
   // _currentUser=null;
    notifyListeners();
  }

  initState(){
    FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
      if(snapshot!=null){
        getUser(snapshot);
      }
    });
  }

  getUser(User? firebaseUser) async {
    if (kDebugMode) {
      print('user');
    }
    await FirebaseFirestore.instance
        .collection('clients')
        .doc(firebaseUser!.uid)
       // .doc('uid')
        .get().then((doc) {
      if (doc.exists) {
        if (kDebugMode) {
          print(doc.data());
        }
        _currentUser = UserModel.fromDocument(doc);
        notifyListeners();
       // updateUser();
      }
    });
  }

  updateUser()async{
    await FirebaseFirestore.instance.collection('clients').doc(_currentUser!.uid).set({
      'last_seen':FieldValue.serverTimestamp()
    },SetOptions(merge: true));
  }
}
