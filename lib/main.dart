import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale? _appLocale;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/home":
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomePage(
                      localeChangeCallback: _localeChangeCallback,
                    ),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
                transitionDuration: Duration(seconds: 1));

          case "/signUp":
            return PageRouteBuilder(
                pageBuilder: (ctx, __, ___) => SignUpPage(
                    localeChangeCallback: _localeChangeCallback,
                    signUpSuccessfulCallback: () {
                      Navigator.of(ctx).pushNamedAndRemoveUntil(
                        '/home',
                        (route) => false,
                      );
                    }));
        }
        return null;
      },
      initialRoute: '/signUp',
      locale: _appLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  void _localeChangeCallback(String? value) => setState(() {
        _appLocale = (value == null ? null : Locale(value));
      });
}
