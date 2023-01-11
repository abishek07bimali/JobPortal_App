import 'package:flutter/material.dart';
import 'package:ind_flutter/Menus/Settings.dart';
import 'package:ind_flutter/Menus/notification.dart';
import 'package:ind_flutter/Menus/profile.dart';

import '../Menus/Jobs.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentTab=0;
  final List<Widget> screens=[
    Jobspage(),
    NotificationPage(),
    Profile(),
    Settings(),
  ];

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=Jobspage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket:bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    // minWidth:40,
                    onPressed: (){
                      setState(() {
                        currentScreen=Jobspage();
                        currentTab=0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab==0? Colors.blue:Colors.grey,
                        ),
                        Text('Home',
                          style: TextStyle(color:currentTab==0 ? Colors.blue :Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    // minWidth:40,
                    onPressed: (){
                      setState(() {
                        currentScreen=NotificationPage();
                        currentTab=1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: currentTab==1? Colors.blue:Colors.grey,
                        ),
                        Text('Notification',
                          style: TextStyle(color:currentTab==1 ? Colors.blue :Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    // minWidth:40,
                    onPressed: (){
                      setState(() {
                        currentScreen=Profile();
                        currentTab=3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab==3? Colors.blue:Colors.grey,
                        ),
                        Text('Profile',
                          style: TextStyle(color:currentTab==3 ? Colors.blue :Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    // minWidth:40,
                    onPressed: (){
                      setState(() {
                        currentScreen=    Settings();
                        currentTab=4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab==4? Colors.blue:Colors.grey,
                        ),
                        Text('Settings',
                          style: TextStyle(color:currentTab==4 ? Colors.blue :Colors.grey),
                        )
                      ],
                    ),
                  ),



                ],
              )
            ],
          ),
        ),
      ),


    );
  }


}

