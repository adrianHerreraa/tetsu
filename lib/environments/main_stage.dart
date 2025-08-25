import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetsugym/config/app_widget.dart';
import 'package:tetsugym/core/providers/app_config_provider.dart';
import 'package:tetsugym/core/shared_preferences/shared_preferences.dart';
import 'package:tetsugym/firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  final Map<String, String> appConfig = {'': ''};

  await runZonedGuarded(
    () async {
      tz.initializeTimeZones();
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await SharedPreferencesService.init();

      // final config = await AppRemoteConfig.getInstance();
      // final keys = await config.getStgKeys();
      // appConfig[''] = keys[''].toString();

      runApp(
        ProviderScope(
          overrides: [appConfigProvider.overrideWithValue(appConfig)],
          child: const AppWidget(),
        ),
      );
    },
    (error, stack) {
      log('$error - $stack');
    },
  );
}
