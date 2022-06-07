import 'package:cuntry/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLunch extends StatelessWidget {
  const UrlLunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                // const url = 'https://sites.google.com/view/eshramcard3';
                const url = 'https://eshram.gov.in/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.privacy_tip),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                // String email = "contact@ouiquit.com";
                String email = "https://register.eshram.gov.in/#/user/self";
                if (await canLaunch(email)) {
                  await launch(email);
                } else {
                  throw 'Could not launch';
                }
              },
              child: const Text(
                'Email launch',
              ),
            ),
            TextButton(
              onPressed: () async {
                String url =
                    "https://www.youtube.com/watch?v=GZMTsvLZK8A&ab_channel=TheGrowingDeveloper";

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch';
                }
              },
              child: const Text(
                'You tub launch',
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewExample(),
                    ));
                // String url = "https://twitter.com/flutterdev?lang=en";
                // if (await canLaunch(url)) {
                //   await launch(url);
                // } else {
                //   throw 'Could not launch';
                // }
              },
              child: const Text(
                'twitter launch',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
