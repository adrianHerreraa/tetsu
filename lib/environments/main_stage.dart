import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetsugym/config/app_widget.dart';
import 'package:tetsugym/core/providers/app_config_provider.dart';
// import 'package:rickkickboxing/core/firebase/remote_config.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  final Map<String, String> appConfig = {'': ''};

  runZonedGuarded(
    () async {
      tz.initializeTimeZones();
      WidgetsFlutterBinding.ensureInitialized();

      if (kIsWeb) {
        await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyAE4t2zPkfk9YuDJD9HP2ikfb8VGf4N3T0",
            authDomain: "rickkickboxing-226d5.firebaseapp.com",
            projectId: "rickkickboxing-226d5",
            storageBucket: "rickkickboxing-226d5.firebasestorage.app",
            messagingSenderId: "858236175967",
            appId: "1:858236175967:web:d7c06fe5895ebebcf83dea",
            measurementId: "G-4X83V1T9B5",
          ),
        );
      } else {
        await Firebase.initializeApp();
      }

      // final config = await AppRemoteConfig.getInstance();
      // final keys = await config.getStgKeys();
      // appConfig[''] = keys[''].toString();

      runApp(
        ProviderScope(
          overrides: [appConfigProvider.overrideWithValue(appConfig)],
          child: AppWidget(),
        ),
      );
    },
    (error, stack) {
      log('$error - $stack');
    },
  );
}
