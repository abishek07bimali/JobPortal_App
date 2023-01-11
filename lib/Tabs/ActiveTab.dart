import 'package:flutter/material.dart';

import 'Jobs/Alljobs.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin:EdgeInsets.all(2),
                width: 250.0,
                color: Colors.red,
                child: ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (ctx) =>
                          AlertDialog(
                            title: const Text(""),
                            content: const Text("Do you want to see more?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("okay",
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Text("More"),
                ),

                  // child: AllJobs()
              ),
              Container(
                margin:EdgeInsets.all(2),
                width: 250.0,
                color: Colors.blue,

                  // child: AllJobs()
              ),
              Container(
                margin:EdgeInsets.all(2),
                width: 250.0,
                color: Colors.green,

              ),
              Container(
                margin:EdgeInsets.all(2),
                width: 250.0,
                color: Colors.yellow,
              ),
              Container(
                margin:EdgeInsets.all(2),
                width: 250.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),

     );
  }
}
