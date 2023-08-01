import 'package:flutter/material.dart';
import 'package:assure/screens/ApplyForScreens/timeline.dart';
import 'package:assure/utils/constants.dart';

class ApplyForThreeWheeler extends StatefulWidget {
  const ApplyForThreeWheeler({Key? key}) : super(key: key);

  @override
  State<ApplyForThreeWheeler> createState() => _ApplyForThreeWheelerState();
}

class _ApplyForThreeWheelerState extends State<ApplyForThreeWheeler> {
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
              AppConst.customPadding(left: 14, top: 5, right: 0, bottom: 0, child: const Text('Just few steps away from your dreams.',
                style: TextStyle(
                    fontFamily: 'Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),)),
              AppConst.customSizedBox(width: 0, height: 30),
              Timeline(
                indicators: <Widget>[
                  Container(
                    height: 20,
                    width: 20,

                    decoration: const BoxDecoration(
                        color: AppConst.darkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.darkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.darkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.darkOrange,
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: AppConst.darkOrange,
                        shape: BoxShape.circle),
                  ),
                ],
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Sign Up',style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20
                    ),),
                  ),
                  AppConst.customPadding(
                    bottom: 8,right: 8,left: 8,top: 8,

                    child: const Text('Agent will assist',style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,

                    child: const Text('Select your plan',style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,
                    child: const Text('Get your approval',style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20
                    ),),
                  ),
                  AppConst.customPadding(
                    top: 8,right: 8,left: 8,bottom: 8,
                    child: const Text('Done',style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20
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
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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
