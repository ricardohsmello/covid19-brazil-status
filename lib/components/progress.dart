import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Progress extends StatelessWidget {
  final String title;

  Progress({this.title = 'Carregando'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[CircularProgressIndicator(backgroundColor: Colors.white,), Text(title, style: TextStyle(color: Colors.white),)],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
