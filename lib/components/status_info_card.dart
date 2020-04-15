import 'package:flutter/material.dart';

class StatusInfoCard extends StatelessWidget {
  final InfoCard _infoCard;
  final MaterialColor _cardColor;
  final Color _textColor;

  StatusInfoCard(this._infoCard, this._cardColor, this._textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _cardColor ?? Colors.white,
        child: Padding(
          padding: null ?? EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  _infoCard.total.toString(),
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: _textColor),
                ),
              ),
              Center(
                child: Text(
                  _infoCard.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard {
  String title;
  int total;

  InfoCard(this.title, this.total);

  @override
  String toString() {
    return super.toString();
  }
}