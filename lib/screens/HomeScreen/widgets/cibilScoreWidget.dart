import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/UserModel.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/constants.dart';

class CibilScoreWidget extends StatefulWidget {
  const CibilScoreWidget({Key? key}) : super(key: key);

  @override
  State<CibilScoreWidget> createState() => _CibilScoreWidgetState();
}

class _CibilScoreWidgetState extends State<CibilScoreWidget> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  void SubmitCibilData(String name,String number,String DocID){
    String documentId = DocID;
    CibilDetails newCibilDetails = CibilDetails(
      createdAt: Timestamp.now(),
      name: name,
      complete: false,
      number: number.toString(),
    );


    DocumentReference<Map<String, dynamic>> docRef = FirebaseFirestore.instance.collection('clients').doc(documentId);


    docRef.update({
      'cibil': {
        'complete': false,
        'data': newCibilDetails.toMap(),
      },
    }).then((_) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Applied for cibil score..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp);
      nameCtrl.clear();
      numberCtrl.clear();
      print('Cibil map updated successfully!');
    }).catchError((error) {
      // Handle any errors that may occur during the update process
      print('Error updating cibil map: $error');
    });
  }


  void ShowCibil() {
    showMaterialModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => Consumer<UserProvider>(
          builder: (context, userState ,child) {

            TextEditingController nameCtrl = TextEditingController();
            TextEditingController numberCtrl = TextEditingController();

            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: FractionallySizedBox(
                // heightFactor: 0.8,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: ModalScrollController.of(context),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                        padding:  EdgeInsets.all(12.0.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(8.0.r),
                                      child: Text('Apply For Cibil Score',
                                      style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontSize: 18.sp,
                                        color: NewAppConst.darkOrange,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.all(12.0.r),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Name",
                                          labelStyle:
                                          const TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2)),
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                        ),
                                        controller: nameCtrl,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.all(12.0.r),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Number",
                                          labelStyle:
                                          const TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2)),
                                          hintText: "Number",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                        ),
                                        controller: numberCtrl,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),


                                    Padding(
                                      padding:  EdgeInsets.only(left: 25.w ,right: 25.w,bottom: 10.h),
                                      child: NewAppConst.customElevatedButton(
                                          child: Text(
                                            'Submit',
                                            style: NewAppConst.customTextStyle(
                                                customFontFamily: 'Sans',
                                                customFontSize: 20.sp,
                                                customFontColor: Colors.white,
                                                customFontWeight: FontWeight.bold
                                            ),
                                          ),
                                          runCode: () async {
                                            nameCtrl.text = 'siddhesh';
                                            numberCtrl.text = '12345';

                                            if(nameCtrl.text.isNotEmpty &&
                                                numberCtrl.text.isNotEmpty) {
                                              SubmitCibilData(nameCtrl.text,numberCtrl.text,
                                              userState.currentUser!.docID??"");
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Please enter name & number",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.redAccent,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }


                                          }),
                                    ),

                                  ],
                                ) ,


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, userState ,child) {
          return Padding(
            padding:  EdgeInsets.only(left: 10.w, right: 10.h,top: 30.h),
            child: GestureDetector(

              onTap: () async {


                showModalBottomSheet<void>(

                  context: context,
                  builder: (BuildContext context) {
                    return Consumer<UserProvider>(
                        builder: (context, userState ,child) {



                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: FractionallySizedBox(
                              // heightFactor: 0.8,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  controller: ModalScrollController.of(context),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(15))),
                                    child: Padding(
                                      padding:  EdgeInsets.all(12.0.r),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [



                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.all(8.0.r),
                                                child: Text('Apply For Cibil Score',
                                                  style: TextStyle(
                                                      fontFamily: 'Sans',
                                                      fontSize: 18.sp,
                                                      color: NewAppConst.darkOrange,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.all(12.0.r),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText: "Name",
                                                    labelStyle:
                                                    const TextStyle(color: Colors.black),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 2)),
                                                    hintText: "Name",
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),

                                                  ),
                                                  controller: nameCtrl,
                                                  keyboardType: TextInputType.text,
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.all(12.0.r),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText: "Number",
                                                    labelStyle:
                                                    const TextStyle(color: Colors.black),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 2)),
                                                    hintText: "Number",
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),

                                                  ),
                                                  controller: numberCtrl,
                                                  keyboardType: TextInputType.number,
                                                ),
                                              ),


                                              Padding(
                                                padding:  EdgeInsets.only(left: 25.w ,right: 25.w,bottom: 10.h),
                                                child: NewAppConst.customElevatedButton(
                                                    child: Text(
                                                      'Submit',
                                                      style: NewAppConst.customTextStyle(
                                                          customFontFamily: 'Sans',
                                                          customFontSize: 20.sp,
                                                          customFontColor: Colors.white,
                                                          customFontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    runCode: () async {


                                                      if(nameCtrl.text.isNotEmpty &&
                                                          numberCtrl.text.isNotEmpty) {
                                                        SubmitCibilData(nameCtrl.text,numberCtrl.text,
                                                            userState.currentUser!.docID??"");
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg: "Please enter name & number",
                                                            toastLength: Toast.LENGTH_SHORT,
                                                            gravity: ToastGravity.BOTTOM,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor: Colors.redAccent,
                                                            textColor: Colors.white,
                                                            fontSize: 16.0);
                                                      }


                                                    }),
                                              ),

                                            ],
                                          ) ,


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                    );
                  },
                );






                /*showMaterialModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.4),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (context) =>
                      Consumer<UserProvider>(
                      builder: (context, userState ,child) {

                        TextEditingController nameCtrl = TextEditingController();
                        TextEditingController numberCtrl = TextEditingController();

                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: FractionallySizedBox(
                            // heightFactor: 0.8,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                controller: ModalScrollController.of(context),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(15))),
                                  child: Padding(
                                    padding:  EdgeInsets.all(12.0.r),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.all(8.0.r),
                                              child: Text('Apply For Cibil Score',
                                                style: TextStyle(
                                                    fontFamily: 'Sans',
                                                    fontSize: 18.sp,
                                                    color: NewAppConst.darkOrange,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.all(12.0.r),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "Name",
                                                  labelStyle:
                                                  const TextStyle(color: Colors.black),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                          color: Colors.grey,
                                                          width: 2)),
                                                  hintText: "Name",
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),

                                                ),
                                                controller: nameCtrl,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.all(12.0.r),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "Number",
                                                  labelStyle:
                                                  const TextStyle(color: Colors.black),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                          color: Colors.grey,
                                                          width: 2)),
                                                  hintText: "Number",
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),

                                                ),
                                                controller: numberCtrl,
                                                keyboardType: TextInputType.number,
                                              ),
                                            ),


                                            Padding(
                                              padding:  EdgeInsets.only(left: 25.w ,right: 25.w,bottom: 10.h),
                                              child: NewAppConst.customElevatedButton(
                                                  child: Text(
                                                    'Submit',
                                                    style: NewAppConst.customTextStyle(
                                                        customFontFamily: 'Sans',
                                                        customFontSize: 20.sp,
                                                        customFontColor: Colors.white,
                                                        customFontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  runCode: () async {
                                                    nameCtrl.text = 'siddhesh';
                                                    numberCtrl.text = '12345';

                                                    if(nameCtrl.text.isNotEmpty &&
                                                        numberCtrl.text.isNotEmpty) {
                                                      SubmitCibilData(nameCtrl.text,numberCtrl.text,
                                                          userState.currentUser!.docID??"");
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg: "Please enter name & number",
                                                          toastLength: Toast.LENGTH_SHORT,
                                                          gravity: ToastGravity.BOTTOM,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor: Colors.redAccent,
                                                          textColor: Colors.white,
                                                          fontSize: 16.0);
                                                    }


                                                  }),
                                            ),

                                          ],
                                        ) ,


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                  ),
                );*/



              },

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
                  width: MediaQuery.of(context).size.width - 20.w ,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: 50.w,
                            height: 100.h,
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
                            child: NewAppConst.customPadding(
                              top: 10.h,
                              bottom: 10.h,
                              left: 5.w,
                              right: 5.w,
                              child: Image.asset(
                                "assets/images/meter.png",
                                height: 20.h,
                                width: 20.w,
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
                              style: NewAppConst.customTextStyle(
                                  customFontFamily: 'Sans',
                                  customFontSize: 20.sp,
                                  customFontColor: Colors.black,
                                  customFontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          );
        }

    );
  }
}


class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          // when raised button is pressed
          // we display showModalBottomSheet
          showModalBottomSheet<void>(
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text

              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('GeeksforGeeks'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // RaisedButton is deprecated and should not be used
      // Use ElevatedButton instead.

      // child: RaisedButton(
      //     child: const Text('showModalBottomSheet'),
      //     onPressed: () {

      //     // when raised button is pressed
      //     // we display showModalBottomSheet
      //     showModalBottomSheet<void>(

      //         // context and builder are
      //         // required properties in this widget
      //         context: context,
      //         builder: (BuildContext context) {

      //         // we set up a container inside which
      //         // we create center column and display text
      //         return Container(
      //             height: 200,
      //             child: Center(
      //             child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                 const Text('GeeksforGeeks'),
      //                 ],
      //             ),
      //             ),
      //         );
      //         },
      //     );
      //     },
      // ),
    );
  }
}