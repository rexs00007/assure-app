import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../LoanSelectionScreens/PersonalLoanApplyNowScreen.dart';
import '../../LoanSelectionScreens/ThreeWheelerApplyNowScreen.dart';
import '../../LoanSelectionScreens/TwoWheelerApplyNowScreen.dart';


class loanType extends StatefulWidget {
  const loanType({Key? key}) : super(key: key);

  @override
  State<loanType> createState() => _loanTypeState();
}

class _loanTypeState extends State<loanType> {




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewAppConst.customSizedBox(width: 0, height: 10.h),
        Text(
          'Choose your loan type',
          style: NewAppConst.customTextStyle(
              customFontFamily: 'Sans',
              customFontWeight: FontWeight.bold,
              customFontSize: 20.sp,
              customFontColor: Colors.black),
        ),
        NewAppConst.customSizedBox(width: 0, height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TwoWheelerApplyNowScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      NewAppConst.customSizedBox(width: 0, height: 50.h),
                      Container(
                        width: 190.w ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
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
                              Padding(
                                padding:  EdgeInsets.all(8.0.r),
                                child: Text(
                                  'Two wheeler loan',
                                  style: NewAppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16.sp,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 0.h,
                      left: 10.w,
                      child:
                      Image.asset('assets/images/bike_bw.png', height: 200.h))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalLoanApplyNowScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      NewAppConst.customSizedBox(width: 0, height: 50.h),
                      Container(
                        width: 190.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
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
                              Padding(
                                padding:  EdgeInsets.all(8.0.r),
                                child: Text(
                                  'Personal loan',
                                  style: NewAppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16.sp,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 5.h,
                      left: -30.w,
                      child: Image.asset('assets/images/boy.png', height: 200.h))
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThreeWheelerApplyNowScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      NewAppConst.customSizedBox(width: 0, height: 50.h),
                      Container(
                        width: 270.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 150.h,

                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      NewAppConst.lightOrange,
                                      NewAppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(8.0.r),
                                child: Text(
                                  'Three wheeler loan',
                                  style: NewAppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16.sp,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 10.h,
                      left: 20.w  ,
                      child:
                      Image.asset('assets/images/rickshaw.png', height: 190.h))
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}



