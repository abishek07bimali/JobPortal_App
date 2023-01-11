// import 'package:flutter/material.dart';
//
// import 'OTP.dart';
//
// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   bool hidepassword=true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Image.asset(
//                 "assets/logo/loginpage.png",
//                 height: 200,
//                 width: 200,
//
//               ),
//           Text( "Mero Jagir: Create your free Account and start your journey together with us!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 15),
//                 ),
//
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   // controller: email,
//                   decoration: InputDecoration(
//                       hintText: "Enter the Username",
//                       prefixIcon: Icon(Icons.account_circle)
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   // controller: email,
//                   decoration: InputDecoration(
//                       hintText: "Enter your mail",
//                       prefixIcon: Icon(Icons.mail)
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   // controller: email,
//                   obscureText: hidepassword,
//                   // style: TextStyle(color:Colors.red),
//                   decoration: InputDecoration(
//                       hintText: "Enter the password",
//                       prefixIcon: Icon(Icons.key),
//                       suffixIcon:hidepassword?
//                       InkWell(
//                           onTap: (){
//                             setState(() {
//                               hidepassword=!hidepassword;
//                             });
//                           },
//                           child: Icon(Icons.visibility))
//                           :InkWell(
//                           onTap: (){
//                             setState(() {
//                               hidepassword=!hidepassword;
//                             });
//                           },
//                           child: Icon(Icons.visibility_off))
//
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   // controller: email,
//                   obscureText: hidepassword,
//                   // style: TextStyle(color:Colors.red),
//                   decoration: InputDecoration(
//                       hintText: "Re-Enter the password",
//                       prefixIcon: Icon(Icons.key),
//                       suffixIcon:hidepassword?
//                       InkWell(
//                           onTap: (){
//                             setState(() {
//                               hidepassword=!hidepassword;
//                             });
//                           },
//                           child: Icon(Icons.visibility))
//                           :InkWell(
//                           onTap: (){
//                             setState(() {
//                               hidepassword=!hidepassword;
//                             });
//                           },
//                           child: Icon(Icons.visibility_off))
//
//                   ),
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                   onPressed: (){
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: const Text('OTP has been sent to your mail!!'),
//                       duration: const Duration(seconds: 1),
//                     ));
//                     Navigator.push(context,MaterialPageRoute(builder: (context)=>OTP()));
//                   },
//                   child: Text("Verify" ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool hidePassword = true;
  final form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ))
          .user;
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("Register Success")));
        Navigator.of(context).pushReplacementNamed("/login");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signup For Free',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/logo/loginpage.png",
                  height: 300,
                  width: 300,
                ),
              ),
              Text(
                "Mero Jagir: Create your free Account and start your journey together with us!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.lightBlue[900]),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: email,
                  validator: (String? value) {
                    if (value == null || value == "") {
                      return "Email field is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter an email", prefixIcon: Icon(Icons.mail)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: password,
                  validator: (String? value) {
                    if (value == null || value == "") {
                      return "Password field is required";
                    }
                    return null;
                  },
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: !hidePassword
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(Icons.visibility))
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(Icons.visibility_off))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (form.currentState!.validate()) {
                      register();
                    }
                  },
                  child: Text("Join Now")),
            ],
          ),
        ),
      ),
    );
  }
}
