import 'package:task_management/core/hive_db/db_helper.dart';
import 'package:task_management/injection_container.dart';

class LocalPreference {
  final DbHelper _dbHelper = sl();

  String? getString(String key) {
    return _dbHelper.prefBox.get(key);
  }

  Future<bool> setString(String key, String value) async {
    try {
      await _dbHelper.prefBox.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<String>? getStringList(String key) {
    return _dbHelper.prefBox.get(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    try {
      await _dbHelper.prefBox.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool? getBool(String key) {
    return _dbHelper.prefBox.get(key);
  }

  Future<bool> setBool(String key, bool value) async {
    try {
      await _dbHelper.prefBox.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  int? getInt(String key) {
    return _dbHelper.prefBox.get(key);
  }

  Future<bool> setInt(String key, int value) async {
    try {
      await _dbHelper.prefBox.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      await _dbHelper.prefBox.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(String key) async {
    try {
      await _dbHelper.prefBox.delete(key);
      return true;
    } catch (e) {
      return false;
    }
  }
}
