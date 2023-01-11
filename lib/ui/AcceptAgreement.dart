import 'package:flutter/material.dart';

class AcceptAgreement extends StatefulWidget {
  const AcceptAgreement({Key? key}) : super(key: key);

  @override
  State<AcceptAgreement> createState() => _AcceptAgreementState();
}

class _AcceptAgreementState extends State<AcceptAgreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accept the Agreement',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
        ),
        actions: <Widget>[
          TextButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text("Agreement Accepted")));          },
              child:Icon(Icons.question_mark,color: Colors.white,)
          )
        ],
      ),
body: SingleChildScrollView(
  child: Column(
      children: [
        ListView(

        ),
        Container(
          // alignment: Alignment.bottomCenter,
          child: ElevatedButton(onPressed: null, child:
          Text("Accept", style: TextStyle(color: Colors.blue))

          ),

        )
      ],
    ),
  ),
);
  }
}
