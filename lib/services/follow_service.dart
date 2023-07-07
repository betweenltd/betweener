import 'dart:io';

import 'package:betweener/core/util/constants.dart';
import 'package:betweener/core/util/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../models/followers_model.dart';

class FollowServices {
  static final sharedPrefsController = SharedPrefsController();

  static Future<int?> getFollowersCount() async {
    var url = Uri.parse(followersUrl);
    try {
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            await SharedPrefsController().getValueFor('token'),
      });

      if (response.statusCode == 200) {
        FollowersModel followers = followersModelFromJson(response.body);
        return followers.count;
      }
    } catch (e) {
      print('follow Service: $e');
      return null;
    }
    return null;
  }
}
