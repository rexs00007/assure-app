import 'package:assure/constants.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';


import 'homescreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String userNumber = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  var otpFieldVisibility = false;
  var receivedID = '';

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: userNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) {
                if (kDebugMode) {
                  print('Logged In Successfully');
                }
              }


        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print(e.message);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTPCode() async {


    Provider.of<UserProvider>(context,listen: false)
        .logIN(receivedID, otpController.text);

  /*  if (kDebugMode) {
      print('verifying otp');
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otpController.text,
    );

    await auth
        .signInWithCredential(credential)
        .then((value) {
          if (kDebugMode) {
            print(value);
          }
          if(value.user!=null){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
          else {
            if (kDebugMode) {
              print('Something went wrong');
            }
          }

    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


              //color: Colors.orange,
             Image.asset('assets/images/aahhNewLogo.png',
           //height: 350,
               // width: 350,
               // fit: BoxFit.contain,
              ),

          //  AppConst.customSizedBox(width: 0, height: 20),

            Text('GET OTP',
            style: AppConst.customTextStyle(
              customFontFamily: 'Sans',
              customFontSize: 26,customFontColor: Colors.black,
              customFontWeight: FontWeight.bold
            )),
            AppConst.customSizedBox(width: 0, height: 20),
            Text('We will send one time password \n on this mobile number.',textAlign: TextAlign.center,
                style: AppConst.customTextStyle(
                    customFontFamily: 'Sans',
                    customFontSize: 20,
                    customFontColor: Colors.black,
                    customFontWeight: FontWeight.normal
                )),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                onChanged: (val) {
                  userNumber = "+91$val";
                },

                decoration:  InputDecoration(
                  hintText: 'Phone Number',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
              child: Visibility(
                visible: otpFieldVisibility,
                child:
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: AppConst.LightGreen,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //borderWidth: 4.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    otpController.text = code;
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    otpController.text = verificationCode;
                    verifyOTPCode();
                    /*showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );*/
                  }, // end onSubmit
                ),
                /*TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    hintText: 'OTP Code',
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),*/
              ),
            ),
            AppConst.customPadding(left: 25, top: 0, right: 25, bottom: 0,
                child: AppConst.customElevatedButton(
                    child: Text(
                      otpFieldVisibility ? 'Login' : 'Get OTP',
                      style: AppConst.customTextStyle(
                          customFontFamily: 'Sans',
                          customFontSize: 20,
                          customFontColor: Colors.black,
                          customFontWeight: FontWeight.bold
                      ),
                    ),
                    runCode: (){
                      if (kDebugMode) {
                        print(userNumber);
                      }
                      if (otpFieldVisibility) {
                        if (kDebugMode) {
                          print('second step');
                        }
                        if (kDebugMode) {
                          print(otpController.text);
                        }
                        verifyOTPCode();
                      } else {
                        if (kDebugMode) {
                          print('first step');
                        }
                        verifyUserPhoneNumber();
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    } ))
          ],
        ),
      );

  }
}
