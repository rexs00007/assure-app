import 'package:flutter/material.dart';
import 'package:assure/timeline.dart';

import 'constants.dart';

class ApplyForPersonalScreen extends StatefulWidget {
  const ApplyForPersonalScreen({Key? key}) : super(key: key);

  @override
  State<ApplyForPersonalScreen> createState() => _ApplyForPersonalScreenState();
}

class _ApplyForPersonalScreenState extends State<ApplyForPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back,
              color: Colors.black,)),
              AppConst.customPadding(left: 14, top: 5, right: 0, bottom: 0, child: Text('Just few steps away from your dreams.',
                style: AppConst.customTextStyle(
                    customFontFamily: 'Sans',
                    customFontWeight: FontWeight.bold,
                    customFontSize: 20,
                  customFontColor: Colors.black
                ),)),
              AppConst.customSizedBox(width: 0, height: 30),
              Timeline(
                indicators: <Widget>[
                  Container(
                    height: 20,
                    width: 20,

                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                        shape: BoxShape.circle),
                  ),
                ],
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sign Up',
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontColor: Colors.black,
                        customFontWeight: FontWeight.normal
                    ),),
                  ),
                  AppConst.customPadding(
                    bottom: 8,right: 8,left: 8,top: 8,

                    child: Text('Agent will assist',
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontWeight: FontWeight.normal,
                        customFontColor: Colors.black
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,

                    child: Text('Select your plan',
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontColor: Colors.black,
                        customFontWeight: FontWeight.normal
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,
                    child: Text('Get your approval',
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontWeight: FontWeight.normal,
                        customFontColor: Colors.black
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,
                    child: Text('Done',
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontColor: Colors.black,
                        customFontWeight: FontWeight.normal
                    ),),
                  ),
                ],
              ),
              AppConst.customSizedBox(width: 0, height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          AppConst.customSizedBox(width: 0, height: 50),
                          SizedBox(
                            width: 270,

                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          //Colors.blue,
                                          AppConst.lightOrange,
                                          AppConst.lightOrange,
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
                          top: 0,
                          left:10,
                          child: Image.asset('assets/images/boy.png', height: 200))
                    ],
                  ),
                ],
              ),
              AppConst.customSizedBox(width: 0, height: 40),
              AppConst.customElevatedButton(
                  child: Text(
                    'Apply',
                    style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontColor: Colors.black,
                        customFontWeight: FontWeight.bold
                    ),
                  ),
                  runCode: (){}),


            ],
          ),
        ),
      ),
    ));
  }
}
