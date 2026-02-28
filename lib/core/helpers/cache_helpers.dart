import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences pref;
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else {
      throw UnsupportedError('Unsupported value type');
    }
  }

  static int? getIntData(String key) {
    return pref.getInt(key);
  }

  static double? getDoubleData(String key) {
    return pref.getDouble(key);
  }

  static String? getStringData(String key) {
    return pref.getString(key);
  }

  static bool? getBoolData(String key) {
    return pref.getBool(key);
  }

  static List<String>? getStringListData(String key) {
    return pref.getStringList(key);
  }

  static Future<bool> removeData(String key) async {
    return await pref.remove(key);
  }

  static Future<bool> clear() async {
    return pref.clear();
  }
}
