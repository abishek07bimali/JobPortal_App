import 'package:flutter/material.dart';
import 'package:ind_flutter/Tabs/FullTime.dart';
import 'package:ind_flutter/Tabs/PartTime.dart';

import '../Tabs/ActiveTab.dart';

class Jobspage extends StatefulWidget {
  const Jobspage({Key? key}) : super(key: key);

  @override
  State<Jobspage> createState() => _JobspageState();
}

class _JobspageState extends State<Jobspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: Scaffold(

            // //Drawer
            // drawer: Drawer(
            //   child: ListView(
            //     padding: EdgeInsets.zero,
            //     children: [
            //       Container(
            //         height: 150,
            //         child: const DrawerHeader(
            //           decoration: BoxDecoration(
            //             color: Colors.blue,
            //           ),
            //           child: Center(child:
            //           Text('Abishek Bimali',
            //             style: TextStyle(fontSize: 20, color: Colors.white),)),
            //         ),
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.history,),
            //         title: const Text(
            //             'History', style: TextStyle(fontSize: 17)),
            //         onTap: () {
            //           // Update the state of the app.
            //           // ...
            //         },
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.logout,),
            //
            //         title: const Text('Logout', style: TextStyle(fontSize: 17)),
            //         onTap: () {
            //           showDialog(
            //             context: context,
            //             builder: (ctx) =>
            //                 AlertDialog(
            //                   title: const Text(""),
            //                   content: const Text("Do you want to logout?"),
            //                   actions: <Widget>[
            //                     TextButton(
            //                       onPressed: () {
            //                         Navigator.of(context).pushReplacementNamed(
            //                             "/login");
            //                       },
            //                       child: Container(
            //                         color: Colors.red,
            //                         padding: const EdgeInsets.all(14),
            //                         child: const Text("okay",
            //                           style: TextStyle(color: Colors.white),),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //           );
            //         },
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.note,),
            //         title: const Text('FAQ', style: TextStyle(fontSize: 17)),
            //         onTap: () {
            //           // Update the state of the app.
            //           // ...
            //         },
            //       ),
            //     ],
            //   ),
            // ),


            //AppBar
            // appBar: AppBar(
            //   title: TabBar(
            //     // padding: EdgeInsets.all(10),
            //     tabs: [
            //       Tab(
            //         text: "Active",
            //         icon: Icon(Icons.event_available),
            //       ),
            //       Tab(
            //         text: "Full Time",
            //         icon: Icon(Icons.access_time),
            //       ),
            //       Tab(
            //         text: "Part Time",
            //         icon: Icon(Icons.av_timer),
            //       ),
            //     ],
            //   ),
            // ),

            body: TabBarView(
              children: [
                ActiveTab(),
                // Text("All the jobs are shown here"),
                // Text("Full Time Jobs are showed here"),
                FullTime(),
                PartTime(),
                // Text("Part Time Jobs are showed here")
              ],
            ),

          )
      ),

    );
  }

}