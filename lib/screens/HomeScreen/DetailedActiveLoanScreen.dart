import 'package:assure/providers/new_loan_provider.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:assure/utils/app_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/LoanModel.dart';
import '../../utils/constants.dart';

class DetailedActiveLoanScreen extends StatefulWidget {
//  const DetailedLoanScreen({Key? key}) : super(key: key);

  LoanModel CurrentActiveLoan;
  DetailedActiveLoanScreen(this.CurrentActiveLoan, {Key? key});

  @override
  State<DetailedActiveLoanScreen> createState() =>
      _DetailedActiveLoanScreenState();
}

class _DetailedActiveLoanScreenState extends State<DetailedActiveLoanScreen> {
  int? DueAmount = 0;
  int? totalPaid = 0;

  String timestampToString(Timestamp? timestamp) {
    if (timestamp == null) return "";
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat("dd MMMM, yyyy").format(dateTime);
    return formattedDate;
  }

  num getDueAmount() {
    // return 200-100;
    int? newTotalPaid = widget.CurrentActiveLoan.emi
        ?.fold(0, (previousValue, emi) => previousValue! + (emi.amount ?? 0));
    int? newTotalLoan = widget.CurrentActiveLoan.totalLoanAmount;
    int? idk = newTotalLoan! - newTotalPaid!;
    return idk;
  }

  @override
  Widget build(BuildContext context) {
    // NewLoanProvider loans = Provider.of<NewLoanProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.CurrentActiveLoan.loanType ?? "",
          // loans.newLoans[widget.CurretIndex].newLoanType??"",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Sans',
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        //alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 10,
                        decoration: BoxDecoration(
                          color: NewAppConst.lightOrange,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EMI /Month',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 29,
                                    fontFamily: 'Sans',
                                    color: Colors.white),
                              ),
                              Text(
                                "₹ " +
                                        widget.CurrentActiveLoan.currentEmi
                                            .toString() ??
                                    "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    fontFamily: 'Sans',
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Due Amount",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Sans',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text("Next Payment",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // DueAmount.toString(),
                                    getDueAmount().toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Sans',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(

                                      //"25/05/23",
                                      widget.CurrentActiveLoan.nextPayment !=
                                              null
                                          ? timestampToString(widget
                                              .CurrentActiveLoan.nextPayment)
                                          : timestampToString(Timestamp.now()),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Loan Amount",
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text("Loan Tenure",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹ " +
                                            widget.CurrentActiveLoan
                                                .totalLoanAmount
                                                .toString() ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Sans',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      widget.CurrentActiveLoan.tenure
                                                  .toString() +
                                              " months" ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Payment History',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // Text(loans.newLoans[widget.CurretIndex].paymentHistory![0].mode??""),
                widget.CurrentActiveLoan.emi!.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                        ),
                        shrinkWrap: true,
                        itemCount: widget.CurrentActiveLoan.emi!.length,
                        // itemCount: loans.newLoans[widget.CurretIndex].paymentHistory!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.CurrentActiveLoan.emi?[i]
                                                  .paymentMode ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        /* widget.CurrentActiveLoan.emi?[i].isVerified!=null &&
                                      widget.CurrentActiveLoan.emi?[i].isVerified==true ?
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(FeatherIcons.checkCircle,size: 20,),
                                  ) :
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(Icons.access_time,size: 20,),
                                  )*/
                                      ],
                                    ),
                                    Text(
                                      widget.CurrentActiveLoan.emi?[i]
                                                  .dueDate !=
                                              null
                                          ? timestampToString(widget
                                              .CurrentActiveLoan
                                              .emi?[i]
                                              .dueDate)
                                          : timestampToString(Timestamp.now()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.CurrentActiveLoan.emi?[i].amount
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.CurrentActiveLoan.emi?[i]
                                              .transactionID ??
                                          "-",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : SizedBox()
                /*  Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(

                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('PayTM UPI',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('Today',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('6,600',style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('txn id:120456157',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(

                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('gPay',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('21/04/23',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12,600',style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('txn id:120456157',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                    ],
                  ),
                )*/
              ],
            ),
          ),
          Consumer<UserProvider>(
            builder: (context, userState ,child){
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () async {

                    try {

                      int? nullableIntValue = widget.CurrentActiveLoan.currentEmi;
                      double doubleValue = nullableIntValue?.toDouble() ?? 0.0;

                      final res = await EasyUpiPaymentPlatform.instance.startPayment(
                        EasyUpiPaymentModel(
                          payeeVpa: 'aamirindi@oksbi',
                          payeeName: "Assure Capital Corp",
                          amount: doubleValue ,
                          description: "description",
                        ),
                      );

                      print('HueHue');
                    } catch (err) {
                      print(err);
                    }





                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: NewAppConst.darkOrange,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Total Outstanding Payment ₹ ${widget.CurrentActiveLoan.currentEmi.toString()} ',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
    }

          )
        ],
      ),
    ));
  }
}
