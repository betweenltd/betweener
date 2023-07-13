import 'dart:io';

import 'package:betweener/core/util/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../core/util/constants.dart';
import '../models/nearest_users_model.dart';

Future setActiveSharing(
    {required int userId, required ActiveSharingType type}) async {
  var url = Uri.parse('$activeShare/$userId');
  var response = await http.post(
    url,
    body: {'type': type.name},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      HttpHeaders.authorizationHeader:
          await SharedPrefsController().getValueFor('token'),
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void removeActiveReceiver({required int userId}) async {
  var url = Uri.parse('$activeShare/$userId');
  var response = await http.delete(url, headers: {
    HttpHeaders.authorizationHeader:
        await SharedPrefsController().getValueFor('token'),
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<NearestUsersModel> getNearestSender(int userId) async {
  var url = Uri.parse('$activeShare/nearest/$userId');
  var response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          await SharedPrefsController().getValueFor('token'),
    },
  );

  if (response.statusCode == 200) {
    return nearestUsersModelFromJson(response.body);
  } else {
    return Future.error('active sharing error');
  }
}
