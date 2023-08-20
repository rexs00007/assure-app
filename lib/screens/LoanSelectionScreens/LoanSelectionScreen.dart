import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'PersonalLoanApplyNowScreen.dart';
import 'ThreeWheelerApplyNowScreen.dart';
import 'TwoWheelerApplyNowScreen.dart';

class LoanSelectionScreen extends StatefulWidget {
  const LoanSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LoanSelectionScreen> createState() => _LoanSelectionScreenState();
}

class _LoanSelectionScreenState extends State<LoanSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Select Loan Type',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          NewAppConst.customSizedBox(width: 0, height: 50),
                          Container(
                            width: 270,
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
                                          NewAppConst.lightOrange,
                                          NewAppConst.lightOrange,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Two wheeler loan',
                                      style: NewAppConst.customTextStyle(
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
                          left: 60,
                          child:
                          Image.asset('assets/images/bike_bw.png', height: 190))
                    ],
                  ),
                ),
              ],
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
                      NewAppConst.customSizedBox(width: 0, height: 50),
                      Container(
                        width: 270,
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
                                      NewAppConst.lightOrange,
                                      NewAppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Personal loan',
                                  style: NewAppConst.customTextStyle(
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
                      top: 1,
                      left: 20,
                      child: Image.asset('assets/images/boy.png', height: 200))
                ],
              ),
            ),

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
                      NewAppConst.customSizedBox(width: 0, height: 50),
                      Container(
                        width: 270,
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
                                      NewAppConst.lightOrange,
                                      NewAppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Three wheeler loan',
                                  style: NewAppConst.customTextStyle(
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
                      left: 20,
                      child:
                      Image.asset('assets/images/rickshaw.png', height: 190))
                ],
              ),
            ),

            SizedBox(height: 20,)

          ]
        ),
      ),
    ));
  }
}
