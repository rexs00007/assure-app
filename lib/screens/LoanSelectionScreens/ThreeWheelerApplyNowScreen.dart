import 'package:assure/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assure/utils/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../models/LoanModel.dart';
import '../../providers/loan_provider.dart';
import 'package:assure/screens/ApplyForScreens/timeline.dart';

class ThreeWheelerApplyNowScreen extends StatefulWidget {
  const ThreeWheelerApplyNowScreen({Key? key}) : super(key: key);

  @override
  State<ThreeWheelerApplyNowScreen> createState() => _ThreeWheelerApplyNowScreenState();
}

class _ThreeWheelerApplyNowScreenState extends State<ThreeWheelerApplyNowScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back,
                          color: Colors.black,)),
                        Text('Apply for Three wheeler Loan',style: TextStyle(
                            fontFamily: 'Sans',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    NewAppConst.customPadding(
                      bottom: 0,left: 14.w,top: 5.h,right: 0,
                      // padding: const EdgeInsets.only(left: 14,top: 5),
                      child: Text('Just few steps away from your dreams.',
                        style: NewAppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontWeight: FontWeight.bold,
                            customFontSize: 18.sp,
                            customFontColor: Colors.black
                        ),),
                    ),
                    NewAppConst.customSizedBox(width: 0, height: 5.h),

                    Timeline(
                      indicators: <Widget>[
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                              color: NewAppConst.darkOrange,
                              shape: BoxShape.circle),
                         // child: Icon(FeatherIcons.check,color: Colors.white,),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                              color: NewAppConst.darkOrange,
                              shape: BoxShape.circle),
                          //child: Icon(FeatherIcons.check,color: Colors.white,),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                              color: NewAppConst.darkOrange,
                              shape: BoxShape.circle),
                        ),

                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                              color: NewAppConst.darkOrange,
                              shape: BoxShape.circle),
                        ),
                      ],
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Text('Sign Up',style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20.sp
                          ),),
                        ),
                        NewAppConst.customPadding(
                          bottom: 8.h,right: 8.w,left: 8.h,top: 8.h,

                          child:  Text('Agent will assist',style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20.sp
                          ),),
                        ),
                        NewAppConst.customPadding(
                          top: 8.h,right: 8.w,left: 8.w ,bottom: 8.h,

                          child:  Text('Select your plan',style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20.sp
                          ),),
                        ),

                        NewAppConst.customPadding(
                          top: 8.h,right: 8.w,left: 8.w,bottom: 8.h,
                          child:  Text('Done',style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20.sp
                          ),),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                NewAppConst.customSizedBox(width: 0, height: 50.h),
                                SizedBox(
                                  width: 370.w,

                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 150.h,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                //Colors.blue,
                                                NewAppConst.lightOrange,
                                                NewAppConst.lightOrange,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                top: 20.h,
                                left:70.w,
                                child: Image.asset('assets/images/rickshaw.png',
                                  height: 175.h,
                                  fit: BoxFit.cover,))
                          ],
                        ),
                      ],
                    ),
                    NewAppConst.customSizedBox(width: 0, height: 40.h),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 5.h,right: 15.w,left: 15.w,bottom: 15.h),
            child:

            Consumer<LoanProvider>(
                builder: (context, userState ,child) {
                  return  Consumer<UserProvider>(
                      builder: (context, userData ,child){
                        return NewAppConst.customElevatedButton(
                            child: Text(
                              'Apply',
                              style: NewAppConst.customTextStyle(
                                  customFontFamily: 'Sans',
                                  customFontSize: 20.sp,
                                  customFontColor: Colors.white,
                                  customFontWeight: FontWeight.bold
                              ),
                            ),
                            runCode: () async {



                              List<LoanModel> filteredLoans = userState.loanList.where((loan) {

                                String currentUID = FirebaseAuth.instance.currentUser?.uid ?? '';
                                return
                                  loan.approved == false &&
                                      loan.status == 'pending' &&
                                      loan.uid == currentUID &&
                                      loan.loanType == 'ThreeWheeler';
                              }).toList();

                              if(filteredLoans.isEmpty){

                                try {
                                  // Get the current timestamp
                                  Timestamp createdAt = Timestamp.now();

                                  // Get the current user's UID
                                  String? uid = FirebaseAuth.instance.currentUser?.uid ?? '';

                                  // Create a new document reference in the "loans" collection
                                  DocumentReference<Map<String, dynamic>> newLoanRef =
                                  FirebaseFirestore.instance.collection('loans').doc();

                                  // Define the data for the new document
                                  Map<String, dynamic> data = {
                                    'approved': false,
                                    'created_at': createdAt,
                                    'emailID': userData.currentUser?.email??"email",
                                    'status': 'pending',
                                    'loan_type': 'ThreeWheeler',
                                    'uid': uid,
                                    "delivered" : false
                                  };

                                  // Add the data to the document
                                  await newLoanRef.set(data).then((value) {
                                    Fluttertoast.showToast(
                                        msg: "Applied For Three Wheeler Loan..",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pop(context);
                                  });


                                } catch (e) {
                                  print('Error adding new loan document: $e');
                                }

                              }
                              else {
                                Fluttertoast.showToast(
                                    msg: "Already applied for Three Wheeler Loan..",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                              }


                            });
                      }

                  );
                })
          )
        ],
      )





    /*  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:

          NewAppConst.customPadding(left: 15, top: 15, right: 15, bottom: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back,
                    color: Colors.black,)),
                  NewAppConst.customPadding(
                    bottom: 0,left: 14,top: 5,right: 0,
                    // padding: const EdgeInsets.only(left: 14,top: 5),
                    child: Text('Just few steps away from your dreams.',
                      style: NewAppConst.customTextStyle(
                          customFontFamily: 'Sans',
                          customFontWeight: FontWeight.bold,
                          customFontSize: 20,
                          customFontColor: Colors.black
                      ),),
                  ),
                  *//*  NewAppConst.customSizedBox(width: 0, height: 30),

                  Timeline(
                    indicators: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: NewAppConst.darkOrange,
                            shape: BoxShape.circle),
                        child: Icon(FeatherIcons.check,color: Colors.white,),
                      ),
                      *//**//*Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: NewAppConst.darkOrange,
                            shape: BoxShape.circle),
                        child: Icon(FeatherIcons.check,color: Colors.white,),
                      ),*//**//*
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: NewAppConst.darkOrange,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: NewAppConst.darkOrange,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: NewAppConst.darkOrange,
                            shape: BoxShape.circle),
                      ),
                    ],
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sign Up',
                          style: NewAppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontColor: Colors.black,
                              customFontWeight: FontWeight.normal
                          ),),
                      ),
                      *//**//*NewAppConst.customPadding(
                        bottom: 8,right: 8,left: 8,top: 8,

                        child: Text('Agent will assist',
                          style: NewAppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontWeight: FontWeight.normal,
                              customFontColor: Colors.black
                          ),),
                      ),*//**//*
                      NewAppConst.customPadding(
                        top: 8,right: 8,left: 8,bottom: 8,

                        child: Text('Select your plan',
                          style: NewAppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontColor: Colors.black,
                              customFontWeight: FontWeight.normal
                          ),),
                      ),
                      NewAppConst.customPadding(
                        top: 8,right: 8,left: 8,bottom: 8,
                        child: Text('Get your approval'
                          ,style: NewAppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontWeight: FontWeight.normal,
                              customFontColor: Colors.black
                          ),),
                      ),
                      NewAppConst.customPadding(
                        top: 8,right: 8,left: 8,bottom: 8,
                        child: Text('Done',
                          style: NewAppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontWeight: FontWeight.normal,
                              customFontColor: Colors.black
                          ),),
                      ),
                    ],
                  ),*//*
                  NewAppConst.customSizedBox(width: 0, height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              NewAppConst.customSizedBox(width: 0, height: 30),

                              SizedBox(
                                width: 270,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 230,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              //Colors.blue,
                                              NewAppConst.lightOrange,
                                              NewAppConst.lightOrange,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 50,
                              left:20,
                              child: Image.asset('assets/images/rickshaw.png', height: 200))
                        ],
                      ),
                    ],
                  ),
                  NewAppConst.customSizedBox(width: 0, height: 40),


                  Consumer<LoanProvider>(
                      builder: (context, userState ,child) {
                        return  Consumer<UserProvider>(
                            builder: (context, userData ,child){
                              return NewAppConst.customElevatedButton(
                                  child: Text(
                                    'Apply',
                                    style: NewAppConst.customTextStyle(
                                        customFontFamily: 'Sans',
                                        customFontSize: 20,
                                        customFontColor: Colors.white,
                                        customFontWeight: FontWeight.bold
                                    ),
                                  ),
                                  runCode: () async {



                                    List<LoanModel> filteredLoans = userState.loanList.where((loan) {

                                      String currentUID = FirebaseAuth.instance.currentUser?.uid ?? '';
                                      return
                                        loan.approved == false &&
                                            loan.status == 'pending' &&
                                            loan.uid == currentUID &&
                                            loan.loanType == 'ThreeWheeler';
                                    }).toList();

                                    if(filteredLoans.isEmpty){

                                      try {
                                        // Get the current timestamp
                                        Timestamp createdAt = Timestamp.now();

                                        // Get the current user's UID
                                        String? uid = FirebaseAuth.instance.currentUser?.uid ?? '';

                                        // Create a new document reference in the "loans" collection
                                        DocumentReference<Map<String, dynamic>> newLoanRef =
                                        FirebaseFirestore.instance.collection('loans').doc();

                                        // Define the data for the new document
                                        Map<String, dynamic> data = {
                                          'approved': false,
                                          'created_at': createdAt,
                                          'emailID': userData.currentUser?.email??"email",
                                          'status': 'pending',
                                          'loan_type': 'ThreeWheeler',
                                          'uid': uid,
                                        };

                                        // Add the data to the document
                                        await newLoanRef.set(data).then((value) {
                                          Fluttertoast.showToast(
                                              msg: "Applied For Three Wheeler Loan..",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          Navigator.pop(context);
                                        });


                                      } catch (e) {
                                        print('Error adding new loan document: $e');
                                      }

                                    }
                                    else {
                                      Fluttertoast.showToast(
                                          msg: "Already applied for Two Wheeler Loan..",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      Navigator.pop(context);
                                    }


                                  });
                            }

                        );
                      })



                ],
              ))
      ),*/
    ));
  }
}
