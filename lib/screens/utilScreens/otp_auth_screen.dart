import 'package:assure/utils/constants.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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
        .logIN(receivedID, otpController.text,context);

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
      resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

               Padding(
                 padding:  EdgeInsets.all(12.0.r),
                 child: Image.asset('assets/images/aahhNewLogo.png',
                  ),
               ),


              Text('GET OTP',
              style: NewAppConst.customTextStyle(
                customFontFamily: 'Sans',
                customFontSize: 26.sp,customFontColor: Colors.black,
                customFontWeight: FontWeight.bold
              )),
              NewAppConst.customSizedBox(width: 0, height: 20.h),
              Text('We will send one time password \n on this mobile number.',textAlign: TextAlign.center,
                  style: NewAppConst.customTextStyle(
                      customFontFamily: 'Sans',
                      customFontSize: 20.sp,
                      customFontColor: Colors.black,
                      customFontWeight: FontWeight.normal
                  )),
              Padding(
                padding:  EdgeInsets.all(25.0.r),
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
                padding:  EdgeInsets.only(left: 25.w,right: 25.h,bottom: 25.h),
                child: Visibility(
                  visible: otpFieldVisibility,
                  child:
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: NewAppConst.lightGreen,
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
                      //verifyOTPCode();
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
              NewAppConst.customPadding(left: 25.w, top: 0, right: 25.w, bottom: 0,
                  child: NewAppConst.customElevatedButton(
                      child: Text(
                        otpFieldVisibility ? 'Login' : 'Get OTP',
                        style: NewAppConst.customTextStyle(
                            customFontFamily: 'Sans',
                            customFontSize: 20.sp,
                            customFontColor: Colors.white,
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
                          Fluttertoast.showToast(
                              msg: "OTP Sent..",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          verifyUserPhoneNumber();
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      } ))
            ],
          ),
        ),
      );

  }
}
