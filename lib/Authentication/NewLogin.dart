import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({Key? key}) : super(key: key);

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
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
        // appBar: AppBar(
        //   title: Text('Flutter TextField Example'),
        // ),
        body: SingleChildScrollView(
        child: Form(
        key: form,
           child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                      controller: email,
                      validator: (String? value) {
                        if (value == null || value == "") {
                          return "Email field is required";
                        }

                        return null;
                      },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                        prefixIcon: Icon(Icons.account_circle),
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
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
                        border: OutlineInputBorder(),
                        labelText: 'Password',
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


                Padding(
                  padding: EdgeInsets.all(15),
                  child:  Container(
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
                ),

                ElevatedButton(
                  // textColor: Colors.white,
                  // color: Colors.blue,
                  child: Text('Login'),
                  onPressed: (){},
                ),


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


              ],
            )
        )
    )
    )
    );
  }
}