import 'package:betweener/models/user_signin_model.dart';
import 'package:betweener/models/user_signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { id, name, email, password, token, loggedIn, code }

class SharedPrefController {
  //singleton
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //for example if the logged in is user
  Future<bool> saveLoginData(UserSignInModel user) async {
    try {
      await _sharedPreferences.setBool('logged_in', true);
      await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
      await _sharedPreferences.setString('token', 'Bearer ${user.token}');
      await _sharedPreferences.setString('id', user.user.id.toString());
      print(user.token);
      return true;
    } catch (e) {
      return false;
    }

    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  Future<bool> saveSignup(UserSignUpModel user) async {
    try {
      await _sharedPreferences.setBool('logged_in', true);
      await _sharedPreferences.setString(
          PrefKeys.id.name, user.user.id.toString());
      await _sharedPreferences.setString('token', 'Bearer ${user.token}');
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get LoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
