import '../core/util/constants.dart';
import 'package:http/http.dart' as http;

void setActiveSharing(
    {required int userId, required ActiveSharingType type}) async {
  var url = Uri.parse('$activeShare/$userId');
  var response = await http.post(
    url,
    body: {'type': type.name},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void removeActiveReceiver({required int userId}) async {
  var url = Uri.parse('$activeShare/$userId');
  var response = await http.delete(
    url,
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void getNearestSender(int userId) async {
  var url = Uri.parse('$activeShare/nearest/$userId');
  var response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
