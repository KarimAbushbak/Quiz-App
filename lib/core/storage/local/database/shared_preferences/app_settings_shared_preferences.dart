import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../constants.dart';
import 'package:quizie/core/extensions/extensions.dart';

class AppSettingsSharedPreferences {
  static final _instance = AppSettingsSharedPreferences._internal();
  late SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences._internal();

  factory AppSettingsSharedPreferences() {
    return _instance;
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  clear() {
    _sharedPreferences.clear();
  }

  Future<void> incrementAnswered(String category) async {
    final key = 'answered_$category';
    int current = _sharedPreferences.getInt(key) ?? 0;
    if (current < 30) {
      await _sharedPreferences.setInt(key, current + 1);
    }
  }


  Future<int> getAnswered(String category) async {
    return _sharedPreferences.getInt('answered_$category') ?? 0;
  }


  Future<void> resetCategory(String category) async {
    await _sharedPreferences.setInt('answered_$category', 0);
  }

  Future<void> resetAll(List<String> categories) async {
    for (var category in categories) {
      await _sharedPreferences.setInt('answered_$category', 0);
    }
  }
}
