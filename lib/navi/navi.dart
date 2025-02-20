import 'package:flutter/material.dart';
import 'Second.dart';
import 'mycalculator.dart';

void main()=>runApp(myCode());

class myCode extends StatelessWidget {
  const myCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my app',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("하마"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cat.jpg'),
          Image.network('https://i.namu.wiki/i/6rkorWGwEB2xjrQ-bfqtDhp55gurq7RSHfSgBrceXKzp7ghVQJctjec5XFEBh2be5nF5jE7IN7_JLdY-XxV_Dw.webp'),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Calculator()),
                );
              },
              child: Text("뒤로가기")
          )
        ],

      ),
    );
  }
}


