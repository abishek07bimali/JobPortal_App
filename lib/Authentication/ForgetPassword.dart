import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController email = new TextEditingController();
  bool hidePassword = true;
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Reset Your Account')),
          backgroundColor: Colors.blue
          ,
          leading: BackButton(
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed("/login");
            },
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
                          controller: email,
                          validator: (String? value){
                            if(value == null || value == ""){
                              return "Email field is required";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter an email",
                              prefixIcon: Icon(Icons.mail)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: (){
                            if (form.currentState!.validate()) {
                                FirebaseAuth.instance.sendPasswordResetEmail(
                                    email: email.text).
                                then((value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar
                                      (
                                      backgroundColor: Colors.green,
                                      content: const Text('Password reset form is sent in your mail address.. '),
                                      duration: const Duration(seconds: 1),
                                    ))

                                );
                            }
                          },
                          child: Text("Verify" ),
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
