import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ind_flutter/Authentication/ForgetPassword.dart';
import 'package:ind_flutter/ui/AcceptAgreement.dart';
import 'package:ind_flutter/ui/mainscreen.dart';


import 'Authentication/Login.dart';
import 'Authentication/NewLogin.dart';
import 'Authentication/OTP.dart';
import 'Authentication/Register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),

      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Job Portal",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "/homepage",
      routes: {
        "/login": (BuildContext context) => NewLogin(),
        "/register": (BuildContext context) => RegisterScreen(),
        "/forget": (BuildContext context) => Forgetpassword(),
        "/homepage": (BuildContext context) => Homepage(),
        "/accept": (BuildContext context) => AcceptAgreement(),

      },
    );
  }
}
