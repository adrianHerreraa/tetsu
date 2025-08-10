import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetsugym/config/app_widget.dart';
import 'package:tetsugym/core/providers/app_config_provider.dart';
import 'package:tetsugym/firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  final Map<String, String> appConfig = {'': ''};

  runZonedGuarded(
    () async {
      tz.initializeTimeZones();
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

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
