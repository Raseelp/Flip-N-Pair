import 'package:flipnpair/homePage.dart';
import 'package:flipnpair/provider/gameStateProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GameState(), child: FlipNPair()));
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
