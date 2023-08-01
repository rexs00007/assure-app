import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';

class EmiCalScreen extends StatefulWidget {
  const EmiCalScreen({Key? key}) : super(key: key);

  @override
  State<EmiCalScreen> createState() => _EmiCalScreenState();
}

class _EmiCalScreenState extends State<EmiCalScreen> {

  int monthlyIncome = 10;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppConst.customSizedBox(width: 0, height: 30),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Principal Amount',style: AppConst.customTextStyle(
                    customFontFamily: 'Sans',
                    customFontWeight: FontWeight.normal,
                    customFontSize: 18,
                    customFontColor: Colors.black
                  ),),
                  const SizedBox(height: 5,),
                  Text('Rs. 16,90,000',style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                      customFontWeight: FontWeight.bold,
                      customFontSize: 30,
                    customFontColor: Colors.black
                  ),),
                  const SizedBox(height: 10,),
                  Text('Interest Amount',style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                      customFontWeight: FontWeight.normal,
                      customFontSize: 18,
                    customFontColor: Colors.black
                  ),),
                  const SizedBox(height: 5,),
                  Text('2 Months',style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                      customFontWeight: FontWeight.bold,
                      customFontSize: 30,
                    customFontColor: Colors.black
                  ),),

                ],
              ),
            ),
            const Divider(thickness: 2),
            AppConst.customPadding(left: 35, top: 35, right: 35, bottom: 35,

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('OCCUPATION',style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontWeight: FontWeight.bold,
                        customFontSize: 20,
                        customFontColor: Colors.black
                      ),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Gross Monthly Income',style:AppConst.customTextStyle(
                        customFontWeight: FontWeight.normal,
                        customFontFamily: 'Sans',
                        customFontSize: 20,
                        customFontColor: Colors.black
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Text(monthlyIncome.toString(),
                      style: AppConst.customTextStyle(
                        customFontFamily: 'Sans',
                        customFontSize: 19,
                        customFontColor: Colors.black,
                        customFontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Slider(activeColor: AppConst.darkOrange,inactiveColor: Colors.grey.shade300,
                    label: "Select Age",
                    value: monthlyIncome.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        monthlyIncome = value.toInt();
                      });
                    },
                    min: 5,
                    max: 100,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Gross Monthly Income',style:AppConst.customTextStyle(
                          customFontWeight: FontWeight.normal,
                          customFontFamily: 'Sans',
                          customFontSize: 20,
                        customFontColor: Colors.black
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Text(monthlyIncome.toString(),
                        style: AppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontSize: 19,
                            customFontColor: Colors.black,
                            customFontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                  Slider(activeColor: AppConst.darkOrange,inactiveColor: Colors.grey.shade300,
                    label: "Select Age",
                    value: monthlyIncome.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        monthlyIncome = value.toInt();
                      });
                    },
                    min: 5,
                    max: 100,
                  ),
                  AppConst.customSizedBox(width: 0, height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Gross Monthly Income',style:AppConst.customTextStyle(
                          customFontWeight: FontWeight.normal,
                          customFontFamily: 'Sans',
                          customFontSize: 20,
                        customFontColor: Colors.black
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Text(monthlyIncome.toString(),
                        style: AppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontSize: 19,
                            customFontWeight: FontWeight.bold,
                          customFontColor: Colors.black
                        ),),
                    ],
                  ),
                  Slider(activeColor: AppConst.darkOrange,inactiveColor: Colors.grey.shade300,
                    label: "Select Age",
                    value: monthlyIncome.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        monthlyIncome = value.toInt();
                      });
                    },
                    min: 5,
                    max: 100,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Gross Monthly Income',style:AppConst.customTextStyle(
                          customFontWeight: FontWeight.normal,
                          customFontFamily: 'Sans',
                          customFontSize: 20,
                        customFontColor: Colors.black
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Text(monthlyIncome.toString(),
                        style: AppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontSize: 19,
                            customFontWeight: FontWeight.bold,
                          customFontColor: Colors.black
                        ),),
                    ],
                  ),
                  Slider(activeColor: AppConst.darkOrange,inactiveColor: Colors.grey.shade300,
                    label: "Select Age",
                    value: monthlyIncome.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        monthlyIncome = value.toInt();
                      });
                    },
                    min: 5,
                    max: 100,
                  ),

                ],
              ),
            )
          ],
        ),
      );

  }
}
