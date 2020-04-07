import 'package:covid19_brazil_status/components/center_msg.dart';
import 'package:covid19_brazil_status/components/progress.dart';
import 'package:covid19_brazil_status/http/webclient.dart';
import 'package:covid19_brazil_status/models/InfoCard.dart';
import 'package:covid19_brazil_status/models/Statistics.dart';
import 'package:covid19_brazil_status/util/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  WebClient _webClient = WebClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('COVID-19 Status Brasil'),
              brightness: Brightness.light,
              elevation: 1,
            ),
            body: Container(
              child: FutureBuilder<Statistics>(
                  future: _webClient.fetchAllStatistics(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        // TODO: Handle this case.
                        break;
                      case ConnectionState.waiting:
                        Progress();
                        break;
                      case ConnectionState.active:
                        // TODO: Handle this case.
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          final Statistics statistics = snapshot.data;
                          if (statistics != null) {
                            return ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
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
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.help),
                                        tooltip: 'Ajuda',
                                        onPressed: () {
                                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Dados coletados do Centro de Ciência e Engenharia de Sistemas (CSSE)')));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      StatusInfoCard(
                                          InfoCard('Confirmados',
                                              statistics.confirmed),
                                          Colors.orange,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard(
                                              'Suspeitos', statistics.cases),
                                          Colors.yellow,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard('Recuperados',
                                              statistics.recovered),
                                          Colors.green,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard('Mortes', statistics.deaths),
                                          Colors.red,
                                          Colors.white),
                                      SizedBox(height: 20,),
                                      Text(
                                        'Última atualiazação: ' +
                                            FormatterDate.apply(statistics.updatedAt),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          }
                        }

                        break;
                    }

                    return CenteredMessage(
                      'Unknown error..',
                      icon: Icons.warning,
                    );
                  }),
            )));
  }
}

class StatusInfoCard extends StatelessWidget {
  final InfoCard _infoCard;
  final MaterialColor _cardColor;
  final Color _textColor;

  StatusInfoCard(this._infoCard, this._cardColor, this._textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
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
