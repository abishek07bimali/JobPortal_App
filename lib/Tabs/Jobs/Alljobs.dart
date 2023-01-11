import 'package:flutter/material.dart';

class AllJobs extends StatelessWidget {
  const AllJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
