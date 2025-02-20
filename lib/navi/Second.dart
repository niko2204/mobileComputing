import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("강아지"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/기린.png'),
          Image.asset('assets/images/dog.jpg'),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("다음으로")
          )
        ],

      ),
    );
  }
}
