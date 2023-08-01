import 'package:assure/screens/HomeScreen/widgets/EmiCalScreen.dart';
import 'package:assure/screens/HomeScreen/widgets/faqWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/loanTypeWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/titleWidget.dart';
import 'package:assure/screens/HomeScreen/widgets/userInfoWidget.dart';
import 'package:flutter/material.dart';



import 'package:assure/utils/constants.dart';

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
        body: AppConst.customPadding(
            left: 0,
            top: 10,
            right: 0,
            bottom: 10,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  userInfo(context),
                  titleWidget(),
                  loanType(context),
                   const EmiCalScreen(),
                  const faqWidget()
                ],
              ),
            )),


      ),
    );
  }



}
