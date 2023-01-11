import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {

TextEditingController otp = new TextEditingController();
bool hidePassword = true;
final form = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      // backgroundColor:Colors.transparent,
      title: Center(
        child: const Text("Verify OTP here",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,
            color: Colors.black),
        ),
      ),
    ),
      body: SingleChildScrollView(
          child: Form(
              key: form,
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: otp,
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "OTP field is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter an OTP",
                            prefixIcon: Icon(Icons.password_rounded)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Success, Account has been restored!!'),
                            duration: const Duration(seconds: 1),
                          ));
                          Navigator.of(context).pushReplacementNamed("/forget");
                        },

                        child: Text("Confirm" ),
                      ),
                    ),
                  ]
              )
          )
      )
  );
}
}
