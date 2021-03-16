import 'package:flutter/material.dart';

// Data like color and width that will used in different places of app
class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  // top of the story card to make text easy to read
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black87],
  );
}
