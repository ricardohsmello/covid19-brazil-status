import 'package:covid19_brazil_status/ui/widgets/country_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/state_widget.dart';
import 'package:covid19_brazil_status/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.appName),
        ),
        body: ListView(
          children: <Widget>[
            CountryWidget(),
            SelectStateWidget(),
          ],
        ));
  }
}
