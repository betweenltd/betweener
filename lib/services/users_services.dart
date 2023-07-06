import 'package:betweener/core/util/constants.dart';
import 'package:http/http.dart' as http;

void updateUserLocation(int userId, double long, double lat) async {
  var url = Uri.parse('$updateUserLocationUrl/$userId');
  var response = await http.put(
    url,
    body: {'long': '$long', 'lat': '$lat'},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void updateFcm(int userId, String fcm) async {
  var url = Uri.parse('$updateUserFcm/$userId');
  var response = await http.put(
    url,
    body: {'fcm': fcm},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
