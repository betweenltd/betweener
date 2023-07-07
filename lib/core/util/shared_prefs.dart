import 'package:betweener/models/user_signin_model.dart';
import 'package:betweener/models/user_signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsController {
  final String _onBoardingKey = 'onBoarding';
  SharedPreferences? _prefs;

  static final SharedPrefsController _instance =
      SharedPrefsController._internal();

  factory SharedPrefsController() {
    return _instance;
  }

  Future<void> _checkInstance() async {
    if (_prefs == null) {
      await init();
    }
  }

  SharedPrefsController._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> shouldShowOnboarding() async {
    await _checkInstance();
    bool onboardingShown = _prefs?.getBool(_onBoardingKey) ?? false;
    return !onboardingShown;
  }

  Future<void> setOnboardingShown() async {
    await _checkInstance();
    await _prefs?.setBool(_onBoardingKey, true);
  }

  //for example if the logged in is user
  Future<bool> saveLoginData(UserSignInModel user) async {
    await _checkInstance();
    try {
      await _prefs?.setString('token', 'Bearer ${user.token}');
      await _prefs?.setString('id', user.user.id.toString());
      print(user.token);
      return true;
    } catch (e) {
      return false;
    }

    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  Future<bool> saveSignup(UserSignUpModel user) async {
    await _checkInstance();
    try {
      await _prefs?.setString('id', user.user.id.toString());
      await _prefs?.setString('token', 'Bearer ${user.token}');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<T?> getValueFor<T>(String key) async {
    await _checkInstance();
    if (_prefs!.containsKey(key)) {
      return _prefs?.get(key) as T;
    }
    return null;
  }

  Future<bool?> clear() async {
    await _checkInstance();
    return _prefs?.clear();
  }
}
