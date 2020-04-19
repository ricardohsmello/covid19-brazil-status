import 'package:covid19_brazil_status/ui/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
