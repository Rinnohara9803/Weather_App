import 'package:flutter/material.dart';
import 'screen0.dart';

void main() {
  runApp(Clima_App());
}

class Clima_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/first',
      routes: {
        '/first': (context) => LoadingScreen(),
      },
    );
  }
}
