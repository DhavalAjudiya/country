import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Enable virtual display.
  //   if (Platform.isAndroid) WebView.platform = AndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const WebView(
        debuggingEnabled: true,
        gestureNavigationEnabled: true,
        allowsInlineMediaPlayback: false,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
