import 'package:flutter/material.dart';

class AppColors {

  static const Color primaryPurple = Color(0xFF6200EE);
  static const Color accentPurple = Color(0xFF7C4DFF);


  static const Color bgDarkBlue = Color(0xFF0B0024);
  static const Color bgBlack = Color(0xFF082257);

  // Card & Field Colors
  static const Color cardFill = Color(0xFF1E1E2C);
  static const Color fieldFill = Color(0xFF252535);

  // Text & Icon Colors
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color iconGrey = Color(0xFF757575);

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      bgDarkBlue,
      bgBlack,
    ],
  );
}