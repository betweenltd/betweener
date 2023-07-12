import 'dart:async';

import 'package:betweener/core/util/constants.dart';
import 'package:betweener/services/active_sharin_service.dart';
import 'package:betweener/services/ip_location_services.dart';
import 'package:flutter/material.dart';

class ReceiveView extends StatefulWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
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
    updatePosition(userId: 6);
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
    return const Center(
      child: Icon(
        Icons.emergency_share,
        size: 150,
        color: kLinksColor,
      ),
    );
  }
}
