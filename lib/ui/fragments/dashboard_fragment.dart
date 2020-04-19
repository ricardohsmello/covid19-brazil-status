import 'package:covid19_brazil_status/ui/widgets/country_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/state_widget.dart';
import 'package:flutter/material.dart';

class DashboardFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            CountryWidget(),
            SelectStateWidget(),
          ],
        ));
  }
}
