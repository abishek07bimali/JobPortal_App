import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightGreen,
                  Colors.red,
                ],
              )
          ),
          child: Column(

            children:[
              Container(
                alignment: Alignment.topRight,
                padding:EdgeInsets.fromLTRB(0, 30, 20,0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/firstAuth");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child:Text("Skip Tour"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 20, 10,0),
                child: Image.asset(
                  "assets/first/img.png",
                  height: 450,
                  width: 500,
                ),

              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 20, 10,0),
                child: Text("Find Your Dream Job Now", style: TextStyle(fontSize:25),)

              ),
              Container(
                alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 20, 10,0),
                  child: Text("We have reviewed every candidates's soft skills. We selected exceptional",
                      textAlign: TextAlign.center,
                      )),
              Container(
                alignment: Alignment.center,
                padding:EdgeInsets.fromLTRB(0, 30, 20,100),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/second");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child:Icon(Icons.arrow_circle_right),
                ),
              ),
          ]
          ),
        ),

      ),
    );
  }
}
