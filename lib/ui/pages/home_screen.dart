import 'package:covid19_brazil_status/ui/fragments/about_app_fragment.dart';
import 'package:covid19_brazil_status/ui/fragments/about_author_fragment.dart';
import 'package:covid19_brazil_status/ui/fragments/dashboard_fragment.dart';
import 'package:covid19_brazil_status/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerItem {
  String title;
  FaIcon icon;
  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem(Constants.init, FaIcon(FontAwesomeIcons.home)),
    new DrawerItem(Constants.about_app, FaIcon(FontAwesomeIcons.infoCircle)),
    new DrawerItem(Constants.about_dev, FaIcon(FontAwesomeIcons.user)),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return DashboardFragment();
      case 1:
        return AboutFragment();
      case 2:
        return AuthorFragment();
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: d.icon,
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(_selectedDrawerIndex == 0 ? Constants.appName : widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/covid.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
//            new UserAccountsDrawerHeader(
//                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),

      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

