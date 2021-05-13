import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get isFirstTime => _sharedPrefs.getBool(keyIsFirstTime) ?? true;

  set isFirstTime(bool value) {
    _sharedPrefs.setBool(keyIsFirstTime, value);
  }
}

// constants/strings.dart
const String keyIsFirstTime = "key_isFirstTime";
