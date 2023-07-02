import 'package:betweener/providers/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/ip_location_services.dart';
import '../../services/long_press_to_share.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    updatePosition(userId: 6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
