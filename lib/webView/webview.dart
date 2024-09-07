import 'package:flutter/material.dart';

void main() {
  runApp(Mywidet());
}


class Mywidet extends StatefulWidget {
  const Mywidet({super.key});

  @override
  State<Mywidet> createState() => _MywidgetState();
}

class _MywidgetState extends State<Mywidet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Webview'),
        ),
        body: const Text('Webview'
        ,style: TextStyle(fontSize: 20.0, color: Colors.blueAccent, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, decorationColor: Colors.red, decorationStyle: TextDecorationStyle.dotted, backgroundColor: Colors.yellowAccent, letterSpacing: 5.0, wordSpacing: 10.0, shadows: [Shadow(color: Colors.black, blurRadius: 10.0, offset: Offset(5.0, 5.0))]
        ),
        ),
      )
    );
  }
}
