import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';

Widget titleWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [

      AppConst.customSizedBox(width: 0, height: 10),
      const Divider(
        thickness: 0.8,
      ),
      AppConst.customSizedBox(width: 0, height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 240,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  child: Container(
                    height: 160,
                    width: 160,
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
                        // color: AppConst.LightGreen,
                        shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  right: -50,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/girl_bw.png',
                      height: 260,
                      width: 290,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: AppConst.customPadding(
              right: 15, left: 0, top: 0, bottom: 0,
              child: Column(
                children: [
                  Text(
                    'Get instant two wheeler loan',
                    textAlign: TextAlign.center,
                    style: AppConst.customTextStyle(
                        customFontSize: 20,
                        customFontWeight: FontWeight.bold,
                        customFontFamily: 'Sans',
                        customFontColor: Colors.black),
                  ),
                  AppConst.customSizedBox(width: 0, height: 10),
                  AppConst.customElevatedButton(
                      child: Text(
                        'Apply For Another Loan',
                        textAlign: TextAlign.center,
                        style: AppConst.customTextStyle(
                          customFontColor: Colors.white,
                          customFontFamily: 'Sans',
                          customFontSize: 16,
                          customFontWeight: FontWeight.bold,
                        ),
                      ),
                      runCode: () {})
                ],
              ),
            ),
          )
        ],
      ),
      AppConst.customSizedBox(width: 0, height: 5),
      const Divider(
        thickness: 0.5,
      ),
    ],
  );
}