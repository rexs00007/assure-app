import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../ApplyForScreens/apply_for_personal_loan.dart';
import '../../ApplyForScreens/apply_for_two_wheeler.dart';

Widget loanType(BuildContext context) {
  return Column(
    children: [
      AppConst.customSizedBox(width: 0, height: 10),
      Text(
        'Choose your loan type',
        style: AppConst.customTextStyle(
            customFontFamily: 'Sans',
            customFontWeight: FontWeight.bold,
            customFontSize: 20,
            customFontColor: Colors.black),
      ),
      AppConst.customSizedBox(width: 0, height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ApplyForVehicleScreen()),
              );
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    AppConst.customSizedBox(width: 0, height: 50),
                    Container(
                      width: 170,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Two wheeler loan',
                                style: AppConst.customTextStyle(
                                    customFontFamily: 'Sans',
                                    customFontSize: 16,
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
                    top: 10,
                    left: 10,
                    child:
                    Image.asset('assets/images/bike_bw.png', height: 190))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ApplyForPersonalScreen()),
              );
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    AppConst.customSizedBox(width: 0, height: 50),
                    Container(
                      width: 170,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Personal loan',
                                style: AppConst.customTextStyle(
                                    customFontFamily: 'Sans',
                                    customFontSize: 16,
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
                    top: 0,
                    left: -50,
                    child: Image.asset('assets/images/boy.png', height: 200))
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
                    builder: (context) => const ApplyForVehicleScreen()),
              );
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    AppConst.customSizedBox(width: 0, height: 50),
                    Container(
                      width: 170,
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
                              height: 150,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppConst.lightOrange,
                                    AppConst.lightOrange,
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Three wheeler loan',
                                style: AppConst.customTextStyle(
                                    customFontFamily: 'Sans',
                                    customFontSize: 16,
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
                    top: 10,
                    left: 10,
                    child:
                    Image.asset('assets/images/bike_bw.png', height: 190))
              ],
            ),
          ),
        ],
      ),
      AppConst.customSizedBox(width: 0, height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 20,
                    offset: Offset(10, 10),
                  )
                ]
              // borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            width: MediaQuery.of(context).size.width - 20,
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 50,
                      height: 100,
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
                      child: AppConst.customPadding(
                        top: 10,
                        bottom: 10,
                        left: 5,
                        right: 5,
                        child: Image.asset(
                          "assets/images/meter.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Get your cibil score',
                        style: AppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontSize: 20,
                            customFontColor: Colors.black,
                            customFontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )),
      )
    ],
  );
}