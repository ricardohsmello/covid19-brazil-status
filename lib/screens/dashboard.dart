import 'package:covid19_brazil_status/bloc/dashboard_cards_bloc.dart';
import 'package:covid19_brazil_status/bloc/dashboard_states_bloc.dart';
import 'package:covid19_brazil_status/components/center_msg.dart';
import 'package:covid19_brazil_status/components/combo_box_states.dart';
import 'package:covid19_brazil_status/components/progress.dart';
import 'package:covid19_brazil_status/components/status_info_card.dart';
import 'package:covid19_brazil_status/models/info_card.dart';
import 'package:covid19_brazil_status/models/states.dart';
import 'package:covid19_brazil_status/models/statistics_by_states.dart';
import 'package:covid19_brazil_status/util/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DashboardStatesBloc blocStates = DashboardStatesBloc();
DashboardCardsBloc blocCards = DashboardCardsBloc();

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Status Brasil'),
      ),
      body: ListView(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/covid.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        SelectStateWidget(),
        InfoCardsWidget(),
        SizedBox(height: 50,),
      ],)
    );
  }
}

class SelectStateWidget extends StatelessWidget {
  String _state;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selecione um estado: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          StreamBuilder<String>(
              stream: blocStates.output,
              builder: (context, snapshot) {
                return ComboBoxStates(
                  buildItems: States.states.values.toList(),
                  dropdownValue: _state ?? 'SP',
                  onChangeValue: (st) {
                    _state = st;
                    blocCards.input.add(st);
                    blocStates.input.add(st);
                  },
                );
              }),
          IconButton(
            icon: Icon(Icons.help),
            tooltip: 'Ajuda',
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Dados coletados do Centro de Ciência e Engenharia de Sistemas (CSSE)')));
            },
          ),
        ],
      ),
    );
  }
}

class InfoCardsWidget extends StatefulWidget {
  @override
  _InfoCardsWidgetState createState() => _InfoCardsWidgetState();
}

class _InfoCardsWidgetState extends State<InfoCardsWidget> {
  @override
  void initState() {
    super.initState();
    blocCards.input.add('SP');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StatisticsStates>(
        stream: blocCards.output,
        initialData: StatisticsStates(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CenteredMessage(
              'Unknown error',
              icon: Icons.warning,
            );
          }

          if (snapshot.hasData) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                Progress();
                break;
              case ConnectionState.active:
                return _loadInfoCards(snapshot);
                break;
              case ConnectionState.done:
                return _loadInfoCards(snapshot);
                break;
            }
          }

          return Padding(
            padding: const EdgeInsets.all(28.0),
            child: CenteredMessage(
              'Selecione um estado para filtrar',
              icon: Icons.warning,
            ),
          );
        });
  }

  Column _loadInfoCards(AsyncSnapshot<StatisticsStates> snapshot) {
    StatisticsStates statistics = snapshot.data;

    return Column(
      children: <Widget>[
        StatusInfoCard(InfoCard('Confirmados', statistics.cases), Colors.orange,
            Colors.white),
        StatusInfoCard(InfoCard('Suspeitos', statistics.suspects), Colors.amber,
            Colors.white),
        StatusInfoCard(InfoCard('Descartados', statistics.refuses),
            Colors.green, Colors.white),
        StatusInfoCard(
            InfoCard('Mortes', statistics.deaths), Colors.red, Colors.white),
        SizedBox(
          height: 20,
        ),
        Text(
          'Última atualização: ' + FormatterDate.apply(statistics.datetime),
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
