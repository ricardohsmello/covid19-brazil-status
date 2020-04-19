import 'package:covid19_brazil_status/util/constants.dart';
import 'package:covid19_brazil_status/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthorFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Column(
                    children: <Widget>[

                      Text(
                          Constants.fragment_author_about_dev, style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(Constants.author_picture_link),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildContactInfo(context),
        ],
      ),
    );
  }

  Row _buildContactInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.instagram),
          onPressed: () {
            Util.launchURL(Constants.insta_page);
          },
        ),
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.github),
          onPressed: () {
            Util.launchURL(Constants.github_page);
          },
        ),
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.facebook),
          onPressed: () {
            Util.launchURL(Constants.facebook_page);
          },
        ),
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () {
            Util.launchURL(Constants.linkedin_page);
          },
        ),
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.google),
          onPressed: () {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(Constants.gmail_page)));
          },
        ),
        IconButton(
          iconSize: 24,
          icon: FaIcon(FontAwesomeIcons.twitter),
          onPressed: () {
            Util.launchURL(Constants.twitter_page);
          },
        ),
      ],
    );
  }
}
