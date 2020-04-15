import 'package:covid19_brazil_status/bloc/state_bloc.dart';
import 'package:covid19_brazil_status/components/center_msg.dart';
import 'package:covid19_brazil_status/components/combo_box_states.dart';
import 'package:covid19_brazil_status/components/progress.dart';
import 'package:covid19_brazil_status/components/status_info_card.dart';
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
    stateBloc.getState(uf);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateModel>(
        initialData: StateModel(),
        stream: stateBloc.subject.stream,
        builder: (context, AsyncSnapshot<StateModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            Constants.filter_by_state,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          ComboBoxStates(
                            buildItems: Constants.states.values.toList(),
                            dropdownValue: _state ?? 'SP',
                            onChangeValue: (st) {
                              _state = st;
                              stateBloc.getState(st);
                            },
                          ),
                        ],
                      ),
                    ),
                    StatusInfoCard(InfoCard(Constants.confirmed, snapshot.data.cases),
                        Colors.orange, Colors.white),
                    StatusInfoCard(
                        InfoCard(Constants.suspects, snapshot.data.suspects),
                        Colors.amber,
                        Colors.white),
                    StatusInfoCard(
                        InfoCard(Constants.discard, snapshot.data.refuses),
                        Colors.green,
                        Colors.white),
                    StatusInfoCard(InfoCard(Constants.deaths, snapshot.data.deaths),
                        Colors.red, Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Constants.last_update +
                          FormatterDate.apply(snapshot.data.datetime),
                      style: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.italic),
                    )
                  ],
                );
              }
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }

          return CenteredMessage(
            Constants.err_occurred,
            icon: Icons.error,
          );
        });
  }
}
