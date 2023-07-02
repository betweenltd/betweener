import 'package:betweener/core/util/constants.dart';
import 'package:http/http.dart' as http;

void updateUserLocation(double long, double lat) async {
  var url = Uri.parse('$updateUserLocationUrl/5');
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
