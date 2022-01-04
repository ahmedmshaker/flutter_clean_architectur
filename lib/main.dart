import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rent_ready_task/core/config/config_reader.dart';
import 'package:rent_ready_task/di/injection_container.dart';
import 'package:rent_ready_task/features/accounts/presentation/screens/responsive_accounts_screen.dart';
import 'package:rent_ready_task/l10n/l10n.dart';
import 'nonweb_url_strategy.dart'
    if (dart.library.html) 'web_url_strategy.dart'; //to fix this issue https://stackoverflow.com/questions/69107380/error-while-running-app-on-ios-or-android-using-flutter
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureApp();
  runApp(const MyApp());
}

Future<void> configureApp() async {
  configureUrl();
  await ConfigReader.initialize();
  configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Ready',
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveAccountsScreen(),
    );
  }
}
