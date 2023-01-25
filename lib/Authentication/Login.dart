// import 'package:flutter/material.dart';
// import 'Register.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool hidepassword=true;
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
//                 margin: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                   onPressed: (){
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: const Text('snack'),
//                       duration: const Duration(seconds: 1),
//                       action: SnackBarAction(
//                         label: 'ACTION',
//                         onPressed: () {
//
//                         },
//                       ),
//                     ));
//                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
//                   },
//                   child: Text("Login" ),
//                 ),
//               ),
//               Container(
//                 child:TextButton(
//                   onPressed:(){
//                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
//                     Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()));
//
//                   },
//                   child: Text('New user?  Sign up here...',style: TextStyle(color: Colors.blueAccent),),
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
import 'package:ind_flutter/Authentication/OTP.dart';

import 'Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool hidePassword = true;
  final form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login() async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: email.text, password: password.text))
          .user;
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green, content: Text("Login Success")));

        Navigator.of(context).pushReplacementNamed("/homepage");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(children: [
            Center(
              child: Image.asset(
                "assets/logo/loginpage.png",
                height: 300,
                width: 300,
              ),
            ),
            Text(
              "Mero Jagir: Start Your Dream Job with us",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child:
              TextFormField(
                controller: email,
                validator: (String? value) {
                  if (value == null || value == "") {
                    return "Email field is required";
                  }

                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Enter an email",
                    prefixIcon: Icon(Icons.account_circle)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
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
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/forget");
                },
                child: Text(
                  'Forget Password? ',
                  style: TextStyle(color: Colors.blueAccent),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (form.currentState!.validate()) {
                    login();
                  }
                },
                child: Text("Login")),
            Container(
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()));
                  Navigator.of(context).pushReplacementNamed("/register");
                },
                child: Text(
                  'New user?  Join us for free..',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
