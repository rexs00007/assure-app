import 'package:assure/screens/utilScreens/otp_auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000), () {
      FirebaseAuth auth = FirebaseAuth.instance;

        if (auth.currentUser == null) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OtpScreen()),
          );

        } else {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );

        }


    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('SplashScreen')
        ));
  }
}
