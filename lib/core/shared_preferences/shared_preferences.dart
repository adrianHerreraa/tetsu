import 'package:shared_preferences/shared_preferences.dart';

/// Clase helper para manejar SharedPreferences de forma más elegante
class SharedPreferencesService {
  // Singleton
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();

  static SharedPreferences? _prefs;

  /// Inicializar, deberías llamarlo en main()
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // -------------------- GUARDAR DATOS --------------------

  Future<void> setInt(String key, int value) async =>
      await _prefs?.setInt(key, value);

  Future<void> setBool(String key, bool value) async =>
      await _prefs?.setBool(key, value);

  Future<void> setDouble(String key, double value) async =>
      await _prefs?.setDouble(key, value);

  Future<void> setString(String key, String value) async =>
      await _prefs?.setString(key, value);

  Future<void> setStringList(String key, List<String> value) async =>
      await _prefs?.setStringList(key, value);

  // -------------------- OBTENER DATOS --------------------

  int? getInt(String key) => _prefs?.getInt(key);
  bool? getBool(String key) => _prefs?.getBool(key);
  double? getDouble(String key) => _prefs?.getDouble(key);
  String? getString(String key) => _prefs?.getString(key);
  List<String>? getStringList(String key) => _prefs?.getStringList(key);

  // -------------------- ELIMINAR DATOS --------------------

  Future<void> remove(String key) async => await _prefs?.remove(key);

  Future<void> clear() async => await _prefs?.clear();
}

/// Llaves centralizadas para evitar typos en los keys
class PrefKeys {
  static const String sideMenu = 's.m_o';
}
