import 'package:flutter/material.dart';
import './screens/game.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


void main() {
  print('Hello from your Flutter app!');
  runApp(MyApp());
}
