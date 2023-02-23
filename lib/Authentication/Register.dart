import 'package:flutter/material.dart';
import 'package:ind_flutter/Authentication/Login.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/global_ui_viewmodel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  bool hidePassword = true;
  bool hidePassword1 = true;
  final form = GlobalKey<FormState>();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void register() async{
    if(form.currentState == null || !form.currentState!.validate()){
      return;
    }
    _ui.loadState(true);
    try{
      await _auth.register(
          UserModel(
              email: email.text,
              password: password.text,
              phone: phonenumber.text,
              fullname: fullname.text,
              username: username.text,
              address: address.text
          ))

      .then((value) {
        Navigator.of(context).pushReplacementNamed("/login");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const LoginScreen()),
        // );
      })
          .catchError((e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    }catch(err){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }



  bool validatePassword(String pass){
    String _password = pass.trim();
    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.lightGreen,
            child: Form(
                key: form,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: fullname,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Full Name is required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                              hintText: 'Enter Your Full Name',
                              prefixIcon: Icon(Icons.account_circle),
                            ),
                          ),
                        ),



                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: email,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Email field is required";
                              }
                              else if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value))
                              {
                                return "Please Enter a Valid Email";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter Your Email',
                              prefixIcon: Icon(Icons.mail),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: username,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Username field is required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                              hintText: 'Enter Your Username',
                              prefixIcon: Icon(Icons.account_circle),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: phonenumber,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Phone Number is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              hintText: 'Enter Your Phone Number',
                              prefixIcon: Icon(Icons.call),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: address,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Address is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              hintText: 'Enter Your Address',
                              prefixIcon: Icon(Icons.location_city),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: password,
                            onChanged: (value){
                              form.currentState!.validate();
                            },
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Password field is required";
                              }
                              else{
                                //call function to check password
                                bool result = validatePassword(value);
                                if(result){
                                  // create account event
                                  return null;
                                }else{
                                  return " Password should contain Capital, small letter & Number";
                                }
                              }                              },
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
                          padding: const EdgeInsets.all(5),
                          child: LinearProgressIndicator(
                            value: password_strength,
                            backgroundColor: Colors.grey[300],
                            minHeight: 5,
                            color: password_strength <= 1 / 4
                                ? Colors.green
                                : password_strength == 2 / 4
                                ? Colors.yellow
                                : password_strength == 3 / 4
                                ? Colors.blue
                                : Colors.red,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            controller: password1,
                            validator: (String? value) {
                              if (value == null || value == "") {
                                return "Password field is required";
                              }
                              if (value !=password.text) {
                                return "Password didn't match";
                              }
                              return null;
                            },
                            obscureText: hidePassword1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Re-Enter Password',
                                hintText: "Re-Enter Your Password",
                                prefixIcon: Icon(Icons.key),
                                suffixIcon: !hidePassword1
                                    ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        hidePassword1 = !hidePassword1;
                                      });
                                    },
                                    child: Icon(Icons.visibility))
                                    : InkWell(
                                    onTap: () {
                                      setState(() {
                                        hidePassword1 = !hidePassword1;
                                      });
                                    },
                                    child: Icon(Icons.visibility_off))),
                          ),
                        ),


                        ElevatedButton(
                          // textColor: Colors.white,
                          // color: Colors.blue,
                          child: Text('Signup'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )
                            ),
                          ),
                          // onPressed:password_strength != 1 ? null : (){
                            onPressed:(){
                              if (form.currentState!.validate()) {
                                register();
                                //
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => const LoginScreen(),),
                                // );
                            }
                          },
                        ),

                      ],
                    )
                )
            ),
          ),
          // ),
        )
    );
  }
}

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/user_model.dart';
//
// import '../../viewmodels/auth_viewmodel.dart';
// import '../../viewmodels/global_ui_viewmodel.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _phoneNumberController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _gender = TextEditingController();
//
//   bool _obscureTextPassword = true;
//   bool _obscureTextPasswordConfirm = true;
//
//   late GlobalUIViewModel _ui;
//   late AuthViewModel _auth;
//
//   @override
//   void initState() {
//     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//     _auth = Provider.of<AuthViewModel>(context, listen: false);
//     super.initState();
//   }
//
//
//   void register() async{
//     if(_formKey.currentState == null || !_formKey.currentState!.validate()){
//       return;
//     }
//     _ui.loadState(true);
//     try{
//       await _auth.register(
//           UserModel(
//               email: _emailController.text,
//               password: _passwordController.text,
//               phone: _phoneNumberController.text,
//               username: _usernameController.text,
//               name: _nameController.text
//           )).then((value) {
//         Navigator.of(context).pushReplacementNamed("/login");
//       })
//           .catchError((e){
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
//       });
//     }catch(err){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
//     }
//     _ui.loadState(false);
//   }
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "assets/images/logo.png",
//                     height: 100,
//                     width: 100,
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _nameController,
//                     validator: ValidateSignup.name,
//                     keyboardType: TextInputType.name,
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.person,
//                         color: Colors.black,
//                         size: 22.0,
//                       ),
//                       hintText: 'First Name',
//                       hintStyle:
//                       TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _phoneNumberController,
//                     validator: ValidateSignup.phone,
//                     keyboardType: TextInputType.phone,
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.phone,
//                         color: Colors.black,
//                         size: 22.0,
//                       ),
//                       hintText: 'Phone Number',
//                       hintStyle:
//                       TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _usernameController,
//                     validator: ValidateSignup.username,
//                     keyboardType: TextInputType.text,
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         color: Colors.black,
//                         size: 22.0,
//                       ),
//                       hintText: 'Username',
//                       hintStyle:
//                       TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: ValidateSignup.emailValidate,
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Colors.black,
//                         size: 22.0,
//                       ),
//                       hintText: 'Email Address',
//                       hintStyle:
//                       TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: _obscureTextPassword,
//                     validator: (String? value)=>ValidateSignup.password(value, _confirmPasswordController),
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.lock,
//                         size: 22.0,
//                         color: Colors.black,
//                       ),
//                       hintText: 'Password',
//                       hintStyle: const TextStyle(
//                           fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _obscureTextPassword = !_obscureTextPassword;
//                           });
//                         },
//                         child: Icon(
//                           _obscureTextPassword
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           size: 20.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     controller: _confirmPasswordController,
//                     obscureText: _obscureTextPasswordConfirm,
//                     validator: (String? value)=>ValidateSignup.password(value, _passwordController),
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.lock_clock,
//                         size: 22.0,
//                         color: Colors.black,
//                       ),
//                       hintText: 'Confirm Password',
//                       hintStyle: const TextStyle(
//                           fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _obscureTextPasswordConfirm = !_obscureTextPasswordConfirm;
//                           });
//                         },
//                         child: Icon(
//                           _obscureTextPasswordConfirm
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           size: 20.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   side: BorderSide(color: Colors.blue)
//                               )
//                           ),
//                           padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
//                         ),
//                         onPressed: (){
//                           register();
//                         }, child: Text("Sign Up", style: TextStyle(
//                         fontSize: 20
//                     ),)),
//                   ),
//                   SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Already have an account? ", style: TextStyle(
//                           color: Colors.grey.shade800
//                       ),),
//                       InkWell(
//                           onTap: (){
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("Sign in", style: TextStyle(color: Colors.blue),))
//                     ],
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ValidateSignup{
//   static String? name(String? value){
//     if(value == null || value.isEmpty ){
//       return "Name is required";
//     }
//     return null;
//   }
//   static String? emailValidate(String? value){
//
//     final RegExp emailValid =
//     RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     if(value == null || value.isEmpty ){
//       return "Email is required";
//     }
//     if(!emailValid.hasMatch(value)){
//       return "Please enter a valid email";
//     }
//     return null;
//   }
//   static String? phone(String? value){
//     if(value == null || value.isEmpty ){
//       return "Phone number is required";
//     }
//     return null;
//   }
//
//   static String? username(String? value){
//     if(value == null || value.isEmpty ){
//       return "Username is required";
//     }
//     return null;
//   }
//   static String? password(String? value, TextEditingController otherPassword){
//     if(value == null || value.isEmpty ){
//       return "Password is required";
//     }
//     if(value.length < 8){
//       return "Password should be at least 8 character";
//     }
//     if(otherPassword.text != value){
//       return "Please make sure both the password are the same";
//     }
//     return null;
//   }
// }
