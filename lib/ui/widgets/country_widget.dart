import 'package:covid19_brazil_status/bloc/covid19_brasil_bloc.dart';
import 'package:covid19_brazil_status/ui/widgets/center_msg_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/progress_widget.dart';
import 'package:covid19_brazil_status/models/country_model.dart';
import 'package:covid19_brazil_status/util/constants.dart';
import 'package:flutter/material.dart';

class CountryWidget extends StatefulWidget {
  @override
  _CountryWidgetState createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  void initState() {
    super.initState();
    covid19BrasilBloc.getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CountryModel>(
        stream: covid19BrasilBloc.countryData.stream,
        builder: (context, AsyncSnapshot<CountryModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(title: Constants.msg_loading_countries);
              break;
            case ConnectionState.active:
              if (snapshot.hasData) {
                if (snapshot.data.error != null) {
                  return CenteredMessage(
                    snapshot.data.error,
                    icon: Icons.error,
                  );
                }

                if (snapshot.data.confirmed != null) {
                  return _buildCountryWidget(context, snapshot.data);
                }
              }

              break;
            case ConnectionState.done:
              // TODO
              break;
          }

          return CenteredMessage(
            Constants.err_occurred_country,
            icon: Icons.error,
          );
        });
  }
}

Widget _buildCountryWidget(BuildContext context, CountryModel countryModel) {
  return Card(
    margin: EdgeInsets.all(10),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              'Total geral no Brasil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            IconButton(
              icon: Icon(Icons.help),
              tooltip: Constants.help,
              onPressed: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(Constants.msg_help)));
              },
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      _RowInfo(
          title: Constants.confirmed,
          value: countryModel.confirmed,
          colorInfo: Colors.orange),
      _RowInfo(
          title: Constants.recovered,
          value: countryModel.recovered,
          colorInfo: Colors.green),
      _RowInfo(
          title: Constants.deaths,
          value: countryModel.deaths,
          colorInfo: Colors.red),
    ]),
  );
}

class _RowInfo extends StatelessWidget {
  final String title;
  final int value;
  final MaterialColor colorInfo;

  _RowInfo({this.title, this.value, this.colorInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15.0,
                width: 15.0,
                decoration: BoxDecoration(
                  color: colorInfo,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(title),
            ],
          ),
          Text(value.toString()),
        ],
      ),
    );
  }
}
