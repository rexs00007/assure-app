import 'package:assure/screens/LoanSelectionScreens/LoanSelectionScreen.dart';
import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget titleWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [

      NewAppConst.customSizedBox(width: 0.w, height: 10.h),
      const Divider(
        thickness: 0.8,
      ),
      NewAppConst.customSizedBox(width: 0.w, height: 5.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 240.w  ,
            height: 200.h,
            child: Stack(
              children: [
                Positioned(
                  left: 20.w,
                  child: Container(
                    height: 160.h,
                    width: 160.w,
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
                        // color: AppConst.LightGreen,
                        shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  right: -50.w,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/girl_bw.png',
                      height: 260.h,
                      width: 290.w,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: NewAppConst.customPadding(
              right: 15.w, left: 0.w, top: 0.h, bottom: 0.w,
              child: Column(
                children: [
                  Text(
                    'Get instant two wheeler loan',
                    textAlign: TextAlign.center,
                    style: NewAppConst.customTextStyle(
                        customFontSize: 20.sp,
                        customFontWeight: FontWeight.bold,
                        customFontFamily: 'Sans',
                        customFontColor: Colors.black),
                  ),
                  NewAppConst.customSizedBox(width: 0, height: 10.h),
                  NewAppConst.customElevatedButton(
                      child: Text(
                        'Apply For Loan',
                        textAlign: TextAlign.center,
                        style: NewAppConst.customTextStyle(
                          customFontColor: Colors.white,
                          customFontFamily: 'Sans',
                          customFontSize: 16.sp,
                          customFontWeight: FontWeight.bold,
                        ),
                      ),
                      runCode: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoanSelectionScreen()),
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
      NewAppConst.customSizedBox(width: 0, height: 5.h),
      const Divider(
        thickness: 0.5,
      ),
    ],
  );
}