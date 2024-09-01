import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mercator_test/Network/Base/NetworkApiService.dart';
import 'package:mercator_test/Utility/appTheme.dart';
import 'package:mercator_test/View/Pages/homePage.dart';
import 'generated/l10n.dart';

// Global Instance
final NetworkApiService networkApiService = NetworkApiService();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     locale: const Locale("ar"),
      title: 'Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
     
      home: const HomePage(),
    );
  }
}
