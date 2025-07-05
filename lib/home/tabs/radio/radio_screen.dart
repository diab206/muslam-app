import 'package:flutter/material.dart';

import '../../../my_theme.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1, // 10% from top
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/radio_image.png',
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150), // Additional top spacing
                  Text(
                    'إذاعة القرآن الكريم',
                      style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: MyThemeData.colorGold),
                    ),
                  
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/Group 10.png',
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}