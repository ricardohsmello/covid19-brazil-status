import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String title;

  Progress({this.title = 'Carregando'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[CircularProgressIndicator(), Text(title)],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
