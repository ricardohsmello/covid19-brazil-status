import 'package:covid19_brazil_status/models/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('COVID-19 Status Brasil'),
              brightness: Brightness.light,
              elevation: 1,
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/covid.png'),
                        fit: BoxFit.cover)),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Card(
                        color: Colors.cyan,
                        child: Container(
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Coronavirus COVID-19 ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                'Informações relacionadas ao Brasil',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
//                              Text(
//                                'Dados coletados do Centro de Ciência e Engenharia de Sistemas (CSSE)',
//                                style: TextStyle(
//                                    fontSize: 13,
//                                    fontStyle: FontStyle.italic,
//                                    color: Colors.black),
//                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StatusInfoCard(InfoCard('Confirmados', 2540),
                        Icons.confirmation_number, Colors.blue, Colors.white),
                    StatusInfoCard(InfoCard('Suspeitos', 5610),
                        Icons.confirmation_number, Colors.orange, Colors.white),
                    StatusInfoCard(InfoCard('Recuperados', 120),
                        Icons.record_voice_over, Colors.green, Colors.white),
                    StatusInfoCard(InfoCard('Mortes', 340),
                        Icons.record_voice_over, Colors.red, Colors.white),
                  ],
                ),
              ),
            )));
  }
}

class StatusInfoCard extends StatelessWidget {
  final InfoCard _infoCard;
  final IconData _icon;
  final MaterialColor _cardColor;
  final Color _textColor;

  StatusInfoCard(this._infoCard, this._icon, this._cardColor, this._textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: null ?? 98.0,
      height: null ?? 80.0,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _cardColor ?? Colors.white,
        child: Padding(
          padding: null ?? EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
