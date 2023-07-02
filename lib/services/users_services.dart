import 'package:betweener/core/util/constants.dart';
import 'package:http/http.dart' as http;

void updateUserLocation(double long, double lat) async {
  var url = Uri.http('$updateUserLocationUrl/4');
  var response = await http.put(
    url,
    body: {'long': '1', 'lat': '2'},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
