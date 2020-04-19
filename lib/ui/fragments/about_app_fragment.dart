import 'package:covid19_brazil_status/util/constants.dart';
import 'package:covid19_brazil_status/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutFragment extends StatefulWidget {
  @override
  _AboutFragmentState createState() => _AboutFragmentState();
}

class _AboutFragmentState extends State<AboutFragment> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 5,
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  _buildTop(),
                  SizedBox(
                    height: 50,
                  ),
                  _buildMiddle(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildBottom(),
                ],
              )),
        ),
      ],
    );
  }

  Column _buildTop() {
    return Column(
      children: <Widget>[
        Center(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(Constants.app_picture_link),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _packageInfo.appName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          Constants.app_version,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          _packageInfo.version,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
        ),
        Text(Constants.build_number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(
          _packageInfo.buildNumber,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
        ),
      ],
    );
  }

  Column _buildMiddle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Constants.data_from,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Text(Constants.msg_about_data),
        new InkResponse(
            onTap: () {
              Util.launchURL(Constants.arcgis_page);
            },
            child: new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Center(
                child: new Text(Constants.msg_more_to_know),
              ),
            )),
      ],
    );
  }

  Column _buildBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Constants.more,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Text(Constants.msg_more),
        new InkResponse(
            onTap: () {
              Util.launchURL(Constants.my_github_page);
            },
            child: new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Center(
                child: new Text(Constants.msg_page_on),
              ),
            )),
      ],
    );
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
}
