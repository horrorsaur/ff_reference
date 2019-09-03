import 'package:flutter/material.dart';
import 'package:ff_reference/screens/loading_screen.dart';

void main() => runApp(FFReference());

class FFReference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Color(0xFF222D37),
      ),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
