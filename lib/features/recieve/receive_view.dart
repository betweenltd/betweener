import 'dart:async';

import 'package:betweener/core/util/constants.dart';
import 'package:betweener/core/util/shared_prefs.dart';
import 'package:betweener/models/nearest_users_model.dart';
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
  dynamic userId;
  NearestUsersModel? nearestUsersModel;

  Stream<NearestUsersModel?> myStream() async* {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getNearestSender(int.parse(userId)).then((value) {
        nearestUsersModel = value;
      });
    });

    yield nearestUsersModel;
  }

  updateLocation() async {
    userId = await SharedPrefsController().getValueFor('id');

    updatePosition(userId: int.parse(userId)).whenComplete(() {
      setActiveSharing(
              userId: int.parse(userId), type: ActiveSharingType.receiver)
          .then((value) {
        getNearestSender(int.parse(userId)).then((value) {
          nearestUsersModel = value;
        });
      });
    });
  }

  @override
  void initState() {
    updateLocation();

    super.initState();
  }

  @override
  void dispose() {
    removeActiveReceiver(userId: int.parse(userId));
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<NearestUsersModel?>(
        stream: myStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text('${snapshot.data!.nearestUsers[index].user}');
              },
              itemCount: snapshot.data!.nearestUsers.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
