import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web View',
      theme: ThemeData(),
      home: const WebViewAll(),
    );
  }
}

class WebViewAll extends StatefulWidget {
  const WebViewAll({super.key});

  @override
  State<WebViewAll> createState() => _WebViewAllState();
}

class _WebViewAllState extends State<WebViewAll> {
  int _selectedIndex = 0;

  static const List<String> _urls = [
    "https://www.mokpo.ac.kr",
    "https://www.naver.com",
    "https://www.daum.net",
  ];

  static final List<Webview> _webViews = _urls.map((url) => Webview(url: url)).toList();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _webViews,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
