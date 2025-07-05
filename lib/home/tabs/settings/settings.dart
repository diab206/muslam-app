import 'package:flutter/material.dart';
import 'package:muslam_app/provider.dart';
import 'package:provider/provider.dart';
import 'package:muslam_app/my_theme.dart'; // Import your theme data

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);

    // Define text colors based on the theme mode
    final textColor = myProvider.darkMode ? Colors.white : MyThemeData.colorGold;
    final dropdownTextColor = myProvider.darkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dark Mode Toggle
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  color: textColor, // Use dynamic text color
                ),
              ),
              value: myProvider.darkMode,
              onChanged: (value) {
                myProvider.changeTheme(value);
              },
            ),

            // Language Selection
            ListTile(
              title: Text(
                'Language',
                style: TextStyle(
                  color: textColor, // Use dynamic text color
                ),
              ),
              trailing: DropdownButton<String>(
                value: myProvider.languageCode,
                dropdownColor: myProvider.darkMode ? Colors.grey[900] : Colors.white, // Set dropdown background color
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: textColor, // Set dropdown icon color
                ),
                style: TextStyle(
                  color: dropdownTextColor, // Set dropdown text color
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('العربية'),
                  ),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    myProvider.changeLanguage(newValue);
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            // Shows current settings (optional, for debugging)
          ],
        ),
      ),
    );
  }
}