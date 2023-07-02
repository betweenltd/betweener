import 'package:betweener/core/util/constants.dart';
import 'package:http/http.dart' as http;

void updateUserLocation(double long, double lat) async {
  var url = Uri.http('$updateUserLocationUrl/1');
  var response = await http.post(
    url,
    body: {'long': long, 'lat': lat},
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
