import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello World'),
          ),
          body: MyWidget(),
        //   bottomNavigationBar: BottomNavigationBar(
        //     items: [
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.search),
        //         label: 'Search',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.settings),
        //         label: 'Settings',
        //       ),
        //     ],
        // ),
    )
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool enabled = false;
  String stateText = "disabled";
  void changeCheck() {
    setState(() {
      if (enabled) {
        enabled = false;
        stateText = "disabled";
      } else {
        enabled = true;
        stateText = "enabled";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: (enabled ? Icon(Icons.check_box, size:20,):
              Icon(Icons.check_box_outline_blank, size:20)),
              color: Colors.red,
              onPressed: changeCheck,
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text('$stateText', style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold)),
            )
          ]
      ),
    );
  }
}
