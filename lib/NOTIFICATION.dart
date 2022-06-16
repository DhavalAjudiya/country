import 'package:badges/badges.dart';
import 'package:cuntry/notification_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title    importance: Importance.high,
  playSound: true,
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Local Notification'),
    );
  }
}

final List showNotificationData = [];
final List notificationTitle = [];
final List notificationDescription = [];

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? title;
  GestureTapCallback? onTap;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("token--->>$token");
    });
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
          setState(
            () {
              notificationTitle.add(notification.title);
            },
          );
          print("notification.title--->>>${notificationTitle.length}");
          notificationDescription.add(notification.body);
          print("notification.body--->>>${notificationDescription.last}");
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title ?? ""),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.body ?? "",
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  ///send notification when press button
  void showNotification() {
    final String sound;
    setState(
      () {
        _counter++;
      },
    );
    flutterLocalNotificationsPlugin.show(
      0,
      "Testing $_counter",
      "How you are you ",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.high,
          color: Colors.blue,
          channelDescription: '123',
          playSound: true,
          icon: '@mipmap/ic_launcher',
          channelShowBadge: true,
          channelAction: AndroidNotificationChannelAction.createIfNotExists,
          enableLights: true,
        ),
      ),
    );
    showNotificationData.add(
      "Testing $_counter\nHow you are you ",
    );
    print("showNotificationData--->>>$showNotificationData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title ?? ""),
        actions: [
          const SizedBox(
            height: 500,
          ),
          Badge(
            shape: BadgeShape.circle,
            badgeColor: Colors.orange,
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "${notificationTitle.length}",
              style: const TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topEnd(
              top: 0,
              end: -5,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_active,
                size: 25,
              ),
              onPressed: onTapNotification,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: showNotification,
        // onPressed: () {},
        child: const Icon(Icons.launch),
      ),
    );
  }

  onTapNotification() {
    print("notificationTitle.length == 0---->>>>>${notificationTitle.length}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Notification2(
          id: notificationTitle,
          body: notificationDescription,
          // getData: showNotificationData,
          // description: notificationDescription,
          // title: notificationTitle,
        ),
      ),
    );
  }
}
