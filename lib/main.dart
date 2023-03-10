import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ind_flutter/Authentication/ForgetPassword.dart';

import 'package:ind_flutter/viewmodels/auth_viewmodel.dart';
import 'package:ind_flutter/viewmodels/global_ui_viewmodel.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'Authentication/Login.dart';
import 'Authentication/NewLogin.dart';
import 'Authentication/Register.dart';
import 'Authentication/firstscreens/FirstAuth.dart';
import 'Authentication/firstscreens/Screen3.dart';
import 'Authentication/firstscreens/Screens1.dart';
import 'Authentication/firstscreens/Screens2.dart';
import 'Screens/master.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//
//       home: MainApp(),
//     );
//   }
// }
//
//
// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);
//
//   @override
//   State<MainApp> createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Job Portal",
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       initialRoute: "/register",
//       routes: {
//         "/login": (BuildContext context) => NewLogin(),
//         "/register": (BuildContext context) => Register(),
//         "/forget": (BuildContext context) => Forgetpassword(),
//         "/homepage": (BuildContext context) => Homepage(),
//         "/accept": (BuildContext context) => AcceptAgreement(),
//         "/first": (BuildContext context) => ScreenOne(),
//
//       },
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider (create: (_) => AuthViewModel()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Image.asset("assets/images/loader.gif", height: 100, width: 100,),
        ),
        child: Consumer<GlobalUIViewModel>(
            builder: (context, loader, child) {
              if(loader.isLoading){
                context.loaderOverlay.show();
              }else{
                context.loaderOverlay.hide();
              }
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: "/first",
                routes: {
                  "/login": (BuildContext context) =>NewLogin(),
                  "/register": (BuildContext context) => Register(),
                  "/forget": (BuildContext context) => Forgetpassword(),
                  "/homepage": (BuildContext context) => Master(),
                  // "/accept": (BuildContext context) => AcceptAgreement(),
                  "/first": (BuildContext context) => ScreenOne(),
                  "/second": (BuildContext context) => ScreenTwo(),
                  "/third": (BuildContext context) => ScreenThree(),
                  "/firstAuth": (BuildContext context) => FirstAuth(),

                },
              );
            }
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
