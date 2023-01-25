import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text("Next"),
        ),
      ),
    );
  }
}
