import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage(
      this.message, {
        this.icon,
        this.iconSize = 34,
        this.fontSize = 18,
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: Icon(
                icon,
                size: iconSize,
              ),
              visible: icon != null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                message,
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
