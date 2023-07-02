import 'package:betweener/services/connectivity_services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../services/ip_location_services.dart';
import '../services/users_services.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    getPosition();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
          ],
        ),
      ]),
    );
  }

  void getPosition() async {
    try {
      determinePosition().then((position) {
        updateUserLocation(position.longitude, position.latitude);
      });
    } catch (e) {
      print('$e test');
    }
  }
}
