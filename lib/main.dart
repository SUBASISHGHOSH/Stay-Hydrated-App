import 'package:flutter/material.dart';
import 'input page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          inactiveTrackColor: Color(0xffb4ccd4),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
        primaryColor: Color(0xFF0b020f),
        accentColor: Colors.red,
        scaffoldBackgroundColor: Color(0xFF13061A),
      ),
      home: InputPage(),
    );
  }
}
