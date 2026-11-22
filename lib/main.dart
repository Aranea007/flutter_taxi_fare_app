import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FlutterTaxiFareProject());
}

class FlutterTaxiFareProject extends StatefulWidget {
  const FlutterTaxiFareProject({super.key});

  @override
  State<FlutterTaxiFareProject> createState() => _FlutterTaxiFareProjectState();
}

class _FlutterTaxiFareProjectState extends State<FlutterTaxiFareProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
         textTheme: Theme.of(context).textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
        ),
      ),
    );
  }
}