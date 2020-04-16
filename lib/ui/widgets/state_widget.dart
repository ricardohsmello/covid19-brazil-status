import 'package:covid19_brazil_status/bloc/covid19_brasil_bloc.dart';
import 'package:covid19_brazil_status/ui/widgets/center_msg_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/cb_states_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/progress_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/status_info_widget.dart';
import 'package:covid19_brazil_status/models/state_model.dart';
import 'package:covid19_brazil_status/util/constants.dart';
import 'package:covid19_brazil_status/util/formatter.dart';
import 'package:flutter/material.dart';

class SelectStateWidget extends StatefulWidget {
  @override
  _SelectStateWidgetState createState() => _SelectStateWidgetState();
}

class _SelectStateWidgetState extends State<SelectStateWidget> {
  String uf = 'SP';
  String _state;

  @override
  void initState() {
    super.initState();
    covid19BrasilBloc.getState(uf);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateModel>(
        initialData: StateModel(),
        stream: covid19BrasilBloc.stateData.stream,
        builder: (context, AsyncSnapshot<StateModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(title: Constants.msg_loading_states);
              break;
            case ConnectionState.active:
              if (snapshot.hasData) {
                if (snapshot.data.suspects != null) {
                  return _buildSelectStateWidget(snapshot);
                }
              }
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }

          return CenteredMessage(
            Constants.err_occurred_states,
            icon: Icons.warning,
          );
        });
  }

  Widget _buildSelectStateWidget(AsyncSnapshot<StateModel> snapshot) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Constants.filter_by_state,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ComboBoxStates(
                    buildItems: Constants.states.values.toList(),
                    dropdownValue: _state ?? 'SP',
                    onChangeValue: (st) {
                      _state = st;
                      covid19BrasilBloc.getState(st);
                    },
                  ),
                ],
              ),
              StatusInfoCard(InfoCard(Constants.confirmed, snapshot.data.cases),
                  Colors.orange, Colors.white),
              StatusInfoCard(InfoCard(Constants.suspects, snapshot.data.suspects),
                  Colors.amber, Colors.white),
              StatusInfoCard(InfoCard(Constants.discard, snapshot.data.refuses),
                  Colors.green, Colors.white),
              StatusInfoCard(InfoCard(Constants.deaths, snapshot.data.deaths),
                  Colors.red, Colors.white),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),


        Text(
          Constants.last_update + FormatterDate.apply(snapshot.data.datetime),
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
