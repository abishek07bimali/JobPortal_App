import 'dart:ui';

import 'package:flutter/material.dart';

class FirstAuth extends StatelessWidget {
  const FirstAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/firstAuth.jpg'),
        //       fit: BoxFit.cover
        //   ),
        // ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              // padding: EdgeInsets.fromLTRB(0, 10, 10,0),
              child: Image.asset(
                "assets/first/third.png",
                height: 450,
                width: 300,
              ),

            ),
            Text("With Work Stocks, you can learn everything about its features, an "
                "informative and comprehensive documentation source which it offers.",
              style: TextStyle(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500, ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
              height: 58,
              color: Colors.green,
              onPressed: () =>Navigator.of(context).pushReplacementNamed("/login"),

              child: const Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18),) ,
            ),
            const SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}










//
// import 'package:flutter/material.dart';
// import 'package:new_futter/Auth/Login.dart';
//
// class GetStartedPage extends StatelessWidget {
//   const GetStartedPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/images/firstAuth.jpg'),
//               fit: BoxFit.cover
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text('A digital music, podcast, and video service that gives you access to millions of songs and other content from creators all over the world.',
//               style: TextStyle(color:Colors.black, fontSize: 17, fontWeight: FontWeight.w600, ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32,),
//             MaterialButton(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
//               height: 58,
//               color: Colors.green,
//               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())),
//               child: const Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18),) ,
//             ),
//             const SizedBox(height: 32,)
//           ],
//         ),
//       ),
//     );
//   }
// }