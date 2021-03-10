/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future get({String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.get(key);
  }

  @override
  Future<void> put({String key, value}) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  @override
  Future<bool> remove({String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
