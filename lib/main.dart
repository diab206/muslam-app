import 'package:flutter/material.dart';
import 'package:muslam_app/provider.dart';
import 'package:provider/provider.dart';
import 'package:muslam_app/home/hadeth_name_details/hadeth_name_details.dart';
import 'package:muslam_app/home/home.dart';
import 'package:muslam_app/home/sura_name_details/sura_name_details.dart';
import 'package:muslam_app/my_theme.dart';
import 'package:muslam_app/splach_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MuslamApp(),
    ),
  );
}

class MuslamApp extends StatelessWidget {
  const MuslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates:  [
            AppLocalizations.delegate, // Add this

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
         Locale('en', ''),
         Locale('ar', ''),
      ],
        locale: Locale(provider.languageCode),

      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme, // Light theme
      darkTheme: MyThemeData.darkTheme, // Dark theme
     themeMode: provider.darkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        SuraNameDetails.routeName: (context) => SuraNameDetails(),
        HadethNameDetails.routeName: (context) => HadethNameDetails(),
      },
    );
  }
}