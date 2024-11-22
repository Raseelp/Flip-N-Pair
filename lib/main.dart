import 'package:flipnpair/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FlipNPair());
}

class FlipNPair extends StatelessWidget {
  const FlipNPair({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.slackeyTextTheme(Theme.of(context).textTheme)),
      home: Homepage(),
    );
  }
}
