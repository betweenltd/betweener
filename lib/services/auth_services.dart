import 'package:betweener/core/util/constants.dart';
import 'package:betweener/core/util/shared_prefs.dart';
import 'package:betweener/models/user_signin_model.dart';
import 'package:betweener/models/user_signup_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static final sharedPrefsController = SharedPrefsController();

  static Future<bool?> userSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(registerUrl);
    try {
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password
        },
      );

      if (response.statusCode == 201) {
        UserSignUpModel user = userSignUpModelFromJson(response.body);
        return await sharedPrefsController.saveSignup(user);
      }
    } catch (e) {
      return false;
    }
    return null;
  }

  static Future<bool?> userSignIn({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(loginUrl);

    try {
      var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        UserSignInModel user = userSignInModelFromJson(response.body);
        return await sharedPrefsController.saveLoginData(user);
      } else if (response.statusCode == 400) {
        return false;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
