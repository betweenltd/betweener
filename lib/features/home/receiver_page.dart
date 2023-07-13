import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/active_sharin_service.dart';
import '../../services/ip_location_services.dart';

class ReceiverPage extends StatefulWidget {
  const ReceiverPage({Key? key}) : super(key: key);

  @override
  State<ReceiverPage> createState() => _ReceiverPageState();
}

class _ReceiverPageState extends State<ReceiverPage> {
  String? status;
  Timer? timer;
  dynamic streamResult;

  Stream<dynamic> myStream() async* {
    int counter = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print(counter++);
      getNearestSender(6);
    });

    yield counter;
  }

  @override
  void initState() {
    updatePosition(userId: 8);
    // setActiveSharing(userId: 6, type: ActiveSharingType.sender);
    // myStream().listen((event) {});
    getNearestSender(5);
    super.initState();
  }

  @override
  void dispose() {
    // removeActiveReceiver(userId: 5);
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$status'),
      ),
    );
  }
}
