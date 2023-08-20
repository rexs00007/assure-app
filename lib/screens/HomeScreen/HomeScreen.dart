import 'package:assure/screens/HomeScreen/widgets/EmiCalScreen.dart';
import 'package:assure/screens/HomeScreen/widgets/activeLoans.dart';
import 'package:assure/screens/HomeScreen/widgets/cibilScoreWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/faqWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/loanTypeWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/titleWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/userInfoWidget.dart';
import 'package:flutter/material.dart';



import 'package:assure/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NewAppConst.customPadding(
            left: 0.w,
            top: 10.h,
            right: 0.w,
            bottom: 10.h,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  userInfo(context),
                  ActiveLoans(),
                  titleWidget(context),
                  loanType(),
                  CibilScoreWidget(),
                 //  const EmiCalScreen(),
                  const FaqWidget()
                ],
              ),
            )),


      ),
    );
  }



}
