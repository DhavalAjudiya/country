import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_web_browser/flutter_web_browser.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  bool isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    openBrowserTab();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: InAppWebView(
      //   initialUrlRequest:
      //       URLRequest(url: Uri.parse("https://uidai.gov.in/")),
      // )
      body: WebView(
        initialUrl: 'https://uidai.gov.in/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('--------WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('------------blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('----------allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('--------Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('----------Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
      // body: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     Positioned(
      //         top: 50,
      //         child: Container(
      //           height: 40,
      //           color: Colors.red,
      //         )),
      //     new Center(
      //       child: new RaisedButton(
      //         onPressed: () => openBrowserTab(),
      //         child: new Text('Open website'),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(
      url: "https://eshram.gov.in/",
      // androidToolbarColor: Colors.deepPurple
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
// class WebViewExampleState extends State<WebViewExample> {``   `
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Enable virtual display.
//   //   if (Platform.isAndroid) WebView.platform = AndroidWebView();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const WebView(
//         debuggingEnabled: true,
//         gestureNavigationEnabled: true,
//         allowsInlineMediaPlayback: false,
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: 'https://flutter.dev',
//       ),
//     );
//   }
}
