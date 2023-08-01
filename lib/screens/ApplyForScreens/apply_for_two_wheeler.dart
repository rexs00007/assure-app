import 'package:flutter/material.dart';
import 'package:assure/screens/ApplyForScreens/timeline.dart';
import 'package:assure/utils/constants.dart';

class ApplyForVehicleScreen extends StatefulWidget {
  const ApplyForVehicleScreen({Key? key}) : super(key: key);

  @override
  State<ApplyForVehicleScreen> createState() => _ApplyForVehicleScreenState();
}

class _ApplyForVehicleScreenState extends State<ApplyForVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:

        AppConst.customPadding(left: 15, top: 15, right: 15, bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back,
                  color: Colors.black,)),
                AppConst.customPadding(
                  bottom: 0,left: 14,top: 5,right: 0,
                 // padding: const EdgeInsets.only(left: 14,top: 5),
                  child: Text('Just few steps away from your dreams.',
                    style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontWeight: FontWeight.bold,
                        customFontSize: 20,
                      customFontColor: Colors.black
                    ),),
                ),
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
                      child: Text('Get your approval'
                        ,style: AppConst.customTextStyle(
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
                            customFontWeight: FontWeight.normal,
                            customFontColor: Colors.black
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
                            AppConst.customSizedBox(width: 0, height: 30),

                            SizedBox(
                              width: 270,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 190,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
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
                            top: 10,
                            left:50,
                            child: Image.asset('assets/images/bike.png', height: 200))
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
                          customFontColor: Colors.white,
                          customFontWeight: FontWeight.bold
                      ),
                    ),
                    runCode: (){}),

              ],
            ))
      ),
    ));
  }
}
