import 'package:betweener/providers/connectivity_provider.dart';
import 'package:betweener/services/users_services.dart';
import 'package:betweener/views/home/receiver_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/ip_location_services.dart';
import '../../services/long_press_to_share.dart';

class MyHomePageTest extends StatefulWidget {
  const MyHomePageTest({super.key, required this.title});
  final String title;

  @override
  State<MyHomePageTest> createState() => _MyHomePageTestState();
}

class _MyHomePageTestState extends State<MyHomePageTest> {
  Future<void> getFcm() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      print('fcmToken: $value');
      if (value != null) {
        updateFcm(6, value);
      }
    });
  }

  @override
  void initState() {
    getFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ReceiverPage();
                }),
              );
            },
            icon: Icon(Icons.call_received),
          )
        ],
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Provider.of<MyConnectivity>(context).connectionStatus.name,
            ),
            TextButton(
              onPressed: () {
                getUserIp();
              },
              child: Text('get ip'),
            ),
            TextButton(
              onPressed: () {},
              onLongPress: () {
                longPressToShare(userId: 5);
              },
              child: Text('long Press to share'),
            ),
          ],
        ),
      ]),
    );
  }
}
