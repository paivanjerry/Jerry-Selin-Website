import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/MobileNavigation.dart';
import 'package:jerryselin/MyAppBar.dart';
import 'package:jerryselin/TopBanner.dart';

import 'package:easy_localization/easy_localization.dart';

class MainPage extends StatefulWidget {
  static const String route = '/';
  static const String title = 'jerryselin';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void initState() {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
            label: tr(MainPage.title)
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: tr(MainPage.title),),
      endDrawer: MobileNavigation(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBanner(),
            ],
          )),
    );
  }
}
