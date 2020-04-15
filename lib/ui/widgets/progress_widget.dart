import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String title;

  Progress({this.title = 'Carregando'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
