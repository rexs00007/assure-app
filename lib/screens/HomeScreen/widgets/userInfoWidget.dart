import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../providers/loan_provider.dart';

Widget userInfo(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppConst.customPadding(
              right: 10,
              left: 10,
              top: 10,
              bottom: 10,
              child: Row(
                children: [
                  Consumer<LoanProvider>(
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
                              color: AppConst.darkOrange,
                              shape: BoxShape.circle),
                        );
                      }),
                  AppConst.customSizedBox(width: 15, height: 0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<LoanProvider>(
                            builder: (context, userState, child) {
                              return Text(userState.currentLoan?.name ?? "",
                                  style: AppConst.customTextStyle(
                                      customFontColor: Colors.black,
                                      customFontFamily: 'Sans',
                                      customFontWeight: FontWeight.bold,
                                      customFontSize: 25));
                            }),
                        Text(
                          "Assure ID:1245467",
                          style: AppConst.customTextStyle(
                              customFontColor: Colors.black.withOpacity(0.7),
                              customFontWeight: FontWeight.normal,
                              customFontFamily: 'Sans',
                              customFontSize: 18),
                        ),
                        Text(
                          "Active loans: 2",
                          style: AppConst.customTextStyle(
                              customFontColor: AppConst.darkOrange,
                              customFontWeight: FontWeight.bold,
                              customFontFamily: 'Sans',
                              customFontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      AppConst.customPadding(
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
                    color: AppConst.lightOrange,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: AppConst.customPadding(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 10,
                    child: Text(
                      'Active loans',
                      style: AppConst.customTextStyle(
                          customFontSize: 18,
                          customFontFamily: 'Sans',
                          customFontColor: Colors.white,
                          customFontWeight: FontWeight.bold),
                    )),
              ),
            ),
            AppConst.customSizedBox(width: 10, height: 0),
            Container(
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
              child: AppConst.customPadding(
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
                        percent: 0.9,
                        reverse: true,
                        arcBackgroundColor: AppConst.darkOrange,
                        arcType: ArcType.FULL,
                        center: Center(
                          child: Text(
                            "30 %",
                            style: AppConst.customTextStyle(
                                customFontFamily: 'Sans',
                                customFontSize: 19,
                                customFontWeight: FontWeight.bold,
                                customFontColor: AppConst.darkOrange),
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.yellow,
                        progressColor: const Color(0xFFeaeaea),
                      ),
                    ),
                    Text(
                      "Personal Loan",
                      style: AppConst.customTextStyle(
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
                          style: AppConst.customTextStyle(
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
            AppConst.customSizedBox(width: 5, height: 0),
            Container(
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
              child: AppConst.customPadding(
                top: 6,
                right: 10,
                bottom: 6,
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
                        percent: 0.9,
                        reverse: true,
                        arcBackgroundColor: AppConst.darkOrange,
                        arcType: ArcType.FULL,
                        center: Center(
                          child: Text(
                            "30 %",
                            style: AppConst.customTextStyle(
                                customFontFamily: 'Sans',
                                customFontSize: 19,
                                customFontWeight: FontWeight.bold,
                                customFontColor: AppConst.darkOrange),
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.yellow,
                        progressColor: const Color(0xFFeaeaea),
                      ),
                    ),
                    Text(
                      "Two wheeler\nloan",
                      textAlign: TextAlign.center,
                      style: AppConst.customTextStyle(
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
                          style: AppConst.customTextStyle(
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
          ],
        ),
      )
    ],
  );
}