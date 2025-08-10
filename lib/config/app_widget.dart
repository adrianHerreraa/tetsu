import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tetsugym/routes/router_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Modular.get<AppConfig>();

    return MaterialApp.router(
      title: 'Rick Kick Boxing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routerConfig: appRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale.fromSubtags(languageCode: 'es')],
    );
  }
}
