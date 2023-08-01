
import 'package:assure/providers/loan_provider.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assure/screens/HomeScreen/HomeScreen.dart';
import 'screens/utilScreens/otp_auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // MyApp()
      MultiProvider(
          providers: [

            ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
            ChangeNotifierProvider<LoanProvider>(create: (_) => LoanProvider()),

          ],
          child: const MyNewApp()
      )
  );
}

class MyNewApp extends StatefulWidget {
  const MyNewApp({super.key});

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData(){
    Provider.of<UserProvider>(context,listen: false).initState();
    Provider.of<LoanProvider>(context,listen: false).initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<UserProvider>(
          builder: (context, userState, child) {
            if(userState.currentUser!=null)return const HomeScreen();
            return const OtpScreen();
          }
      ),
    );
  }
}



