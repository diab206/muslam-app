import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  int currentIndex = 0;
  var languageCode = 'en';
  var darkMode = false;
  ThemeMode themeMode = ThemeMode.light;

  void setBottomNavBar(int index) {
    currentIndex = index;
    notifyListeners();
  }
  void changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }
  void changeTheme(bool isDark) {
    darkMode = isDark;
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light; // Update themeMode
    notifyListeners();
  }
  String getBackgroundColor() {
    if (themeMode == ThemeMode.light) {
      return 'assets/images/background.png';
    } else {
      return 'assets/images/background_dark.png';
    }
  }
}
