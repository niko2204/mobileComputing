import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MyApp());
;}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      home: MyWebView1(),
    );
  }
}

class MyWebView1 extends StatefulWidget {
  const MyWebView1({super.key});

  @override
  State<MyWebView1> createState() => _MyWebView1State();
}

class _MyWebView1State extends State<MyWebView1> {

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
  // Update loading bar.
    },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onHttpError: (HttpResponseError error) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://www.youtube.com'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 앱뷰~'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
