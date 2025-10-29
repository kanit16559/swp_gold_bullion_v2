import 'package:shared_preferences/shared_preferences.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_key.dart';

class PreferencesService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isShowIntro {
    return _prefs?.getBool(AppKeys.isShowIntro) ?? false;
  }

  static Future<void> setIsShowIntro(bool value) async {
    await _prefs?.setBool(AppKeys.isShowIntro, value);
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }
}