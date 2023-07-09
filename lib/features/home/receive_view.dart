import 'package:betweener/core/util/constants.dart';
import 'package:flutter/material.dart';

class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Receive"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Center(
          child: Icon(
            Icons.emergency_share,
            size: 150,
            color: kLinksColor,
          ),
        ));
  }
}
