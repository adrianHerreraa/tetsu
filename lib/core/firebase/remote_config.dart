import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class AppRemoteConfig {
  static final AppRemoteConfig _instance = AppRemoteConfig._();
  static bool _isInitialized = false;

  AppRemoteConfig._();

  static Future<AppRemoteConfig> getInstance() async {
    if (!_isInitialized) {
      await _instance._init();
      _isInitialized = true;
    }
    return _instance;
  }

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static const stgKeys = 'rkb_stg_keys';
  static const proKeys = '';

  Future<void> _init() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 0),
          minimumFetchInterval: const Duration(seconds: 0),
        ),
      );
      await _remoteConfig.fetchAndActivate();
    } on PlatformException catch (e) {
      log('Firebase Remote Config Error: $e');
    }
  }

  Future<Map<String, String>> getStgKeys() async {
    final value = _remoteConfig.getAll()[stgKeys]?.asString() ?? '';
    return value.isNotEmpty ? Map<String, String>.from(jsonDecode(value)) : {};
  }

  Future<Map<String, String>> getProKeys() async {
    final value = _remoteConfig.getAll()[proKeys]?.asString() ?? '';
    return value.isNotEmpty ? Map<String, String>.from(jsonDecode(value)) : {};
  }
}
