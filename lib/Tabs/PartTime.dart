import 'package:flutter/material.dart';

class PartTime extends StatefulWidget {
  const PartTime({Key? key}) : super(key: key);

  @override
  State<PartTime> createState() => _PartTimeState();
}

class _PartTimeState extends State<PartTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("parttime Jobs",style: TextStyle(color:Colors.white),)),
      backgroundColor: Colors.blue,
    );
  }
}
