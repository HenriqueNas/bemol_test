import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/l10n/l10n.dart';
import 'package:flutter/material.dart';

class BemolApp extends StatelessWidget {
  const BemolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _BemolMaterialApp();
  }
}

class _BemolMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const CounterPage(),
    );
  }
}
