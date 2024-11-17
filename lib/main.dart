import 'package:flipnpair/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlipNPair());
}

class FlipNPair extends StatelessWidget {
  const FlipNPair({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
