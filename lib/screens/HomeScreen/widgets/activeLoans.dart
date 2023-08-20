import 'package:assure/providers/loan_provider.dart';
import 'package:assure/screens/HomeScreen/DetailedActiveLoanScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../models/LoanModel.dart';
import '../../../utils/constants.dart';

class ActiveLoans extends StatefulWidget {
  const ActiveLoans({Key? key}) : super(key: key);

  @override
  State<ActiveLoans> createState() => _ActiveLoansState();
}

class _ActiveLoansState extends State<ActiveLoans> {
  @override
  Widget build(BuildContext context) {
    List<LoanModel> loanList = Provider.of<LoanProvider>(context).loanList;
    List<LoanModel> approvedLoans = loanList.where((loan) => loan.approved == true

    && loan.assigned == true
    && loan.delivered == false
    ).toList();
    print('current loans');
    print(approvedLoans.length);
    print(approvedLoans[0].id);
    print(approvedLoans[0].emi?[0].amount);

    return approvedLoans.isEmpty?  SizedBox() :
       // Text('data');
      NewAppConst.customPadding(
      left: 20.w,
      right: 0.w,
      top: 5.h,
      bottom: 5.h,
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Container(
              decoration: const BoxDecoration(
                  color: NewAppConst.lightOrange,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: NewAppConst.customPadding(
                  left: 25.w  ,
                  right: 25.w ,
                  top: 10.h,
                  bottom: 10.h,
                  child: Text(
                    'Active loans',
                    style: NewAppConst.customTextStyle(
                        customFontSize: 18.sp,
                        customFontFamily: 'Sans',
                        customFontColor: Colors.white,
                        customFontWeight: FontWeight.bold),
                  )),
            ),
          ),
          NewAppConst.customSizedBox(width: 10.w, height: 0),
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 200.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: approvedLoans.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  int? newTotalPaid = approvedLoans[i].emi?.fold(0, (previousValue, emi) => previousValue! + (emi.amount ?? 0));
                  int? newTotalLoan = approvedLoans[i].totalLoanAmount;

                  double percentage = newTotalLoan != 0 ? newTotalPaid! / newTotalLoan! : 0.0;

                  return Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailedActiveLoanScreen(approvedLoans[i]),
                        ));
                      },
                      child: Container(
                        height: 167.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              blurRadius: 20,
                              offset: Offset(10, 10),
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: NewAppConst.customPadding(
                          top: 10.h,
                          right: 10.w,
                          bottom: 10.h,
                          left: 10.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0.r,
                                animation: true,
                                animationDuration: 2000,
                                lineWidth: 10.0,
                                percent: 1 - percentage,
                                reverse: true,
                                arcBackgroundColor: NewAppConst.darkOrange,
                                arcType: ArcType.FULL,
                                center: Center(
                                  child: Text(
                                    '${(percentage * 100).toInt()}%',
                                    style: NewAppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 19.sp,
                                      customFontWeight: FontWeight.bold,
                                      customFontColor: NewAppConst.darkOrange,
                                    ),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.yellow,
                                progressColor: const Color(0xFFeaeaea),
                              ),
                              Text(
                                approvedLoans[i].loanType ?? "",
                                style: NewAppConst.customTextStyle(
                                  customFontWeight: FontWeight.bold,
                                  customFontFamily: 'Sans',
                                  customFontSize: 19.sp,
                                  customFontColor: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' 12/05/23 - 25/08/24',
                                    style: NewAppConst.customTextStyle(
                                      customFontSize: 13,
                                      customFontFamily: 'Sans',
                                      customFontWeight: FontWeight.normal,
                                      customFontColor: Colors.black.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )


          /*Consumer<LoanProvider>(
                builder: (context, userState, child) {
                  List<LoanModel> approvedLoans =
                  loanList.where((loan) => loan.approved == true).toList();
                  return Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.80,
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: approvedLoans.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {

                          double percentage = (approvedLoans[i].paidAmount ?? 0) / (approvedLoans[i].totalLoanAmount ?? 1);
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: (){
                               // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedLoanScreen(i)));
                              },
                              child: Container(
                                height: 167,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        blurRadius: 20,
                                        offset: Offset(10, 10),
                                      )
                                    ],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                child: NewAppConst.customPadding(
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                  left: 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        //width: 100,
                                        child: CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          lineWidth: 10.0,
                                          percent: 1 - percentage,
                                          reverse: true,
                                          arcBackgroundColor: NewAppConst.darkOrange,
                                          arcType: ArcType.FULL,
                                          center: Center(
                                            child: Text(
                                              (percentage * 100).toInt().toString() + '%',
                                              style: NewAppConst.customTextStyle(
                                                  customFontFamily: 'Sans',
                                                  customFontSize: 19,
                                                  customFontWeight: FontWeight.bold,
                                                  customFontColor: NewAppConst.darkOrange),
                                            ),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.yellow,
                                          progressColor: const Color(0xFFeaeaea),
                                        ),
                                      ),
                                      Text(
                                        approvedLoans[i].loanType??"",
                                        style: NewAppConst.customTextStyle(
                                          customFontWeight: FontWeight.bold,
                                          customFontFamily: 'Sans',
                                          customFontSize: 19,
                                          customFontColor: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' 12/05/23 - 25/08/24',
                                            style: NewAppConst.customTextStyle(
                                                customFontSize: 13,
                                                customFontFamily: 'Sans',
                                                customFontWeight: FontWeight.normal,
                                                customFontColor: Colors.black.withOpacity(0.7)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),*/

        ],
      ),
    );
  }
}
