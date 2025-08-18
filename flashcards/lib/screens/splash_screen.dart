import 'package:FlashCards/screens/flashcard_screen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Future<void> _navigateToNextScreen() async {
  //   await Future.delayed(const Duration(seconds: 1)); // Splash screen duration
  //   Navigator.pushReplacementNamed(
  //       context,  FlashcardScreen(),); // Replace '/home' with your next screen route
  // }
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash screen duration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FlashcardScreen(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     // Set the background color
  //     body: Center(
  //       child: Image.asset(
  //         'assets/logo.png',
  //         width: 100, // Adjust size as needed
  //         height: 100,
  //         fit: BoxFit.contain,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 12), // spacing between logo and text
            Text(
              'Powered by AEdiZz',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
