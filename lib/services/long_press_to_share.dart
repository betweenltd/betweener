import '../core/util/constants.dart';
import 'package:http/http.dart' as http;

Future<void> longPressToShare({required int userId}) async {
  var url = Uri.parse('$longPressShareUrl/$userId');
  var response = await http.get(
    url,
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
