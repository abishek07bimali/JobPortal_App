import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File? image;
  String? imageUrl;
  String? imagePath;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async{
    var selected = await _picker.pickImage(source: source, imageQuality: 50);
    if(selected != null){
      // print(selected.path);
      setState(() {
        image = File(selected.path);
      });
      Reference storageRef = FirebaseStorage.instance.ref();
      String dt = DateTime.now().microsecondsSinceEpoch.toString();
      storageRef.child("products")
          .child("product-$dt.jpg").putFile(File(selected.path))
          .then((p0) async{
        String url = await p0.ref.getDownloadURL();
        // print(url);
        setState(() {
          imagePath = p0.ref.fullPath;
          imageUrl = url;
        });

      });

    }
  }


  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Profile')),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: form,
              child: Column(children: [
                if(imageUrl != null) Image.network(imageUrl!, height: 200),

                // Center(
                //   child: Image.asset(
                //     "assets/logo/loginpage.png",
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Edit Profile",style: TextStyle(color:Colors.blue)),
                          style: TextButton.styleFrom(
                            elevation: 1,
                            shadowColor: Color(0x8AA0D5FF),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) =>
                                  AlertDialog(
                                    title: const Text(""),
                                    content: const Text("Do you want to Delete your Account?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacementNamed(
                                              "/login");
                                        },
                                        child: Container(
                                          color: Colors.red,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay",
                                            style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Text("Delete Profile",style: TextStyle(color:Colors.blue),),
                          style: TextButton.styleFrom(
                            elevation: 1,
                            shadowColor: Color(0x8AA0D5FF),
                          )),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: ElevatedButton(onPressed: (){

                        _pickImage(ImageSource.gallery);
                      },
                          child: Icon(Icons.camera)),
                    )
                  ],
                )
              ])),
        ));
  }
}
