import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


import '../models/UserModel.dart';
import '../screens/HomeScreen/HomeScreen.dart';
import '../screens/utilScreens/otp_auth_screen.dart';
import 'loan_provider.dart';

class UserProvider with ChangeNotifier {

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  logIN(receivedID,otp,BuildContext context) async {
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
          getUser(value.user,context);
          Fluttertoast.showToast(
              msg: "Welcome Back!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);



          Navigator
              .of(context)
              .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return  HomeScreen();
          }));
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

  initState(BuildContext context){
    FirebaseAuth.instance.authStateChanges().listen((User? snapshot) {
      if(snapshot!=null){
        getUser(snapshot,context);
      }
    });
  }

 /* getUser(User? firebaseUser) async {
    if (kDebugMode) {
      print('user');
    }
    await FirebaseFirestore.instance
        .collection('clients')
        .doc(firebaseUser!.uid)
        .get().then((doc) {
      if (doc.exists) {
        if (kDebugMode) {
        //  print(doc.data());
        }
        _currentUser = UserModel.fromDocument(doc);
        notifyListeners();
       // updateUser();
      }
    });
  }*/

  getUser(User? firebaseUser,BuildContext context) async {
    if (kDebugMode) {
      print('user');
    }


    print("current number");
    print(firebaseUser?.phoneNumber);

    await FirebaseFirestore.instance
        .collection('clients')
        .where('phone_no', isEqualTo: firebaseUser!.phoneNumber)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.size > 0) {
        DocumentSnapshot<Map<String, dynamic>> doc = querySnapshot.docs.first;

        if (doc.exists) {
          if (kDebugMode) {
              print(doc.data());
          }
          _currentUser = UserModel.fromDocument(doc);
          notifyListeners();
          Provider.of<LoanProvider>(context,listen: false).initState(context);
        } else {
          Fluttertoast.showToast(
              msg: "Approval Pending..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    });
  }


  updateUser()async{
    await FirebaseFirestore.instance.collection('clients').doc(_currentUser!.docID).set({
      'last_seen':FieldValue.serverTimestamp()
    },SetOptions(merge: true));
  }
}
