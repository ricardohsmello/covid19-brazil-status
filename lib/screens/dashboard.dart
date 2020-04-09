import 'package:covid19_brazil_status/components/center_msg.dart';
import 'package:covid19_brazil_status/components/combo_box_states.dart';
import 'package:covid19_brazil_status/components/progress.dart';
import 'package:covid19_brazil_status/http/webclient.dart';
import 'package:covid19_brazil_status/models/InfoCard.dart';
import 'package:covid19_brazil_status/models/states.dart';
import 'package:covid19_brazil_status/models/statistics_by_states.dart';
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
  String _state = 'SP';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('COVID-19 Status Brasil'),
              brightness: Brightness.light,
              elevation: 1,
            ),
            body: Container(
              child: FutureBuilder<StatisticsStates>(
                  future: _webClient.fetchAllStatistics(_state),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        Progress();
                        break;
                      case ConnectionState.waiting:
                        Progress();
                        break;
                      case ConnectionState.active:
                        Progress();
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          final StatisticsStates statistics = snapshot.data;
                          if (statistics != null) {
                            return ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/covid.png'),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 220,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Selecione um estado: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      ComboBoxStates(
                                        buildItems: States.states,
                                        dropdownValue: _state ?? 'SP',
                                        onChangeValue: (st) {
                                          _state = st;
                                          setState(() {});
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.help),
                                        tooltip: 'Ajuda',
                                        onPressed: () {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Dados coletados do Centro de Ciência e Engenharia de Sistemas (CSSE)')));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(

                                  child: Column(
                                     children: <Widget>[
                                      StatusInfoCard(

                                          InfoCard(
                                              'Confirmados', statistics.cases),
                                          Colors.orange,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard(
                                              'Suspeitos', statistics.suspects),
                                          Colors.amber,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard('Descartados',
                                              statistics.refuses),
                                          Colors.green,
                                          Colors.white),
                                      StatusInfoCard(
                                          InfoCard('Mortes', statistics.deaths),
                                          Colors.red,
                                          Colors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Última atualização: ' +
                                            FormatterDate.apply(
                                                statistics.datetime),
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

                          break;
                        }

                        return CenteredMessage(
                          'Unknown error',
                          icon: Icons.warning,
                        );

                        break;
                    }
                    return Center(child: Progress());
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
