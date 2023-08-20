import 'package:assure/providers/new_loan_provider.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:assure/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../providers/loan_provider.dart';
import '../../utilScreens/otp_auth_screen.dart';
import '../DetailedActiveLoanScreen.dart';

Widget userInfo(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: NewAppConst.customPadding(
              right: 10.w,
              left: 10.w,
              top: 10.h,
              bottom: 10.h,
              child: Row(
                children: [
                  /*Consumer<LoanProvider>(
                      builder: (context, userState, child) {
                        return userState.currentLoan?.profilePic != null
                            ? CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                userState.currentLoan?.profilePic ?? ""))
                            : Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                              color: NewAppConst.darkOrange,
                              shape: BoxShape.circle),
                        );
                      }),*/
                  NewAppConst.customSizedBox(width: 15.w, height: 0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<UserProvider>(
                            builder: (context, userState, child) {
                              return Text(userState.currentUser?.email ?? "",
                                  style: NewAppConst.customTextStyle(
                                      customFontColor: Colors.black,
                                      customFontFamily: 'Sans',
                                      customFontWeight: FontWeight.bold,
                                      customFontSize: 25));
                            }),
                        Text(
                          "Assure ID:1245467",
                          style: NewAppConst.customTextStyle(
                              customFontColor: Colors.black.withOpacity(0.7),
                              customFontWeight: FontWeight.normal,
                              customFontFamily: 'Sans',
                              customFontSize: 18.r),
                        ),

                       /* Consumer<NewLoanProvider>(
                            builder: (context, userState, child) {
                              return Text(
                                "Active loans: ${userState.newLoans.length.toString()}",
                                style: NewAppConst.customTextStyle(
                                    customFontColor: NewAppConst.darkOrange,
                                    customFontWeight: FontWeight.bold,
                                    customFontFamily: 'Sans',
                                    customFontSize: 18),
                              );
                            }),*/


                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {



                  }, icon: const Icon(Icons.notifications)),
              IconButton(
                  onPressed: () {

                    FirebaseAuth.instance.signOut();
                    Fluttertoast.showToast(
                        msg: "Logging Out..",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator
                        .of(context)
                        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                      return  OtpScreen();
                    }));

                  }, icon: const Icon(Icons.logout,color: Colors.redAccent,)),
            ],
          )
        ],
      ),

      /*NewAppConst.customPadding(
        left: 20,
        right: 0,
        top: 5,
        bottom: 5,
        child: Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Container(
                decoration: const BoxDecoration(
                    color: NewAppConst.lightOrange,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: NewAppConst.customPadding(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 10,
                    child: Text(
                      'Active loans',
                      style: NewAppConst.customTextStyle(
                          customFontSize: 18,
                          customFontFamily: 'Sans',
                          customFontColor: Colors.white,
                          customFontWeight: FontWeight.bold),
                    )),
              ),
            ),
            NewAppConst.customSizedBox(width: 10, height: 0),

           *//* Consumer<NewLoanProvider>(
                builder: (context, userState, child) {
                  return Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.80,
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userState.newLoans.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          double percentage = (userState.newLoans[i].painAmount ?? 0) / (userState.newLoans[i].totalAmount ?? 1);
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedLoanScreen(i)));
                              },
                              child: Container(
                                height: 167,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        blurRadius: 20,
                                        offset: Offset(10, 10),
                                      )
                                    ],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                child: NewAppConst.customPadding(
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                  left: 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        //width: 100,
                                        child: CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          lineWidth: 10.0,
                                          percent: 1 - percentage,
                                          reverse: true,
                                          arcBackgroundColor: NewAppConst.darkOrange,
                                          arcType: ArcType.FULL,
                                          center: Center(
                                            child: Text(
                                              (percentage * 100).toInt().toString() + '%',
                                              style: NewAppConst.customTextStyle(
                                                  customFontFamily: 'Sans',
                                                  customFontSize: 19,
                                                  customFontWeight: FontWeight.bold,
                                                  customFontColor: NewAppConst.darkOrange),
                                            ),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.yellow,
                                          progressColor: const Color(0xFFeaeaea),
                                        ),
                                      ),
                                      Text(
                                        userState.newLoans[i].newLoanType??"",
                                        style: NewAppConst.customTextStyle(
                                          customFontWeight: FontWeight.bold,
                                          customFontFamily: 'Sans',
                                          customFontSize: 19,
                                          customFontColor: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' 12/05/23 - 25/08/24',
                                            style: NewAppConst.customTextStyle(
                                                customFontSize: 13,
                                                customFontFamily: 'Sans',
                                                customFontWeight: FontWeight.normal,
                                                customFontColor: Colors.black.withOpacity(0.7)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),*//*






          ],
        ),
      )*/
    ],
  );
}