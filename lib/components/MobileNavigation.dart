import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jerryselin/components/musicWidget.dart';
import 'package:jerryselin/pages/DeveloperPage.dart';
import 'package:jerryselin/pages/EntrepreneurPage.dart';
import 'package:jerryselin/pages/MainPage.dart';
import 'package:jerryselin/pages/OtherPage.dart';
import 'package:jerryselin/pages/SkateVideoPage.dart';

import 'package:jerryselin/audioPlayer.dart';

import '../bgEntry.dart';

class MobileNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(

            child: DrawerHeader(

              child: Text(
                tr('navigation'),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
          ),
          ListTile(
            title: Text(tr("frontpage")),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(MainPage.route);
            },
          ),
          ListTile(
            title: Text(tr('skatevideos')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(SkateVideoPage.route);
            },
          ),
          ListTile(
            title: Text(tr('developer')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DeveloperPage.route);
            },
          ),
          ListTile(
            title: Text(tr('entrepreneur')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(EntrepreneurPage.route);
            },
          ),
          ListTile(
            title: Text(tr('other')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(OtherPage.route);
            },
          ),
          InkWell(
            onTap: (){},
            child: Container(
              height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: MusicWidget(),
              ),
          ),
        ],
      ),
    );
  }
  startAudio() =>
      AudioService.start(backgroundTaskEntrypoint: backgroundTaskEntrypoint);

  stopAudio() => AudioService.stop();


}//widget
