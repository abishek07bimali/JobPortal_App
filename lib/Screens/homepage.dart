import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Image.asset("assets/first/third.png"),

          Padding(
            padding: EdgeInsets.all(100),
              child: Text("hello"))
        ],
      )
    );
  }
}
