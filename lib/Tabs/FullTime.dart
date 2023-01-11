import 'package:flutter/material.dart';

class FullTime extends StatefulWidget {
  const FullTime({Key? key}) : super(key: key);

  @override
  State<FullTime> createState() => _FullTimeState();
}

class _FullTimeState extends State<FullTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("full time", style: TextStyle(color:Colors.white),)),
      backgroundColor: Colors.black12,
    );
  }
}
