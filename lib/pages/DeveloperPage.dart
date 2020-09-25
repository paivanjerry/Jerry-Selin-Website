/// Template page for new route
/// Use this as a template that contains all boilerplate for web page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';

class DeveloperPage extends StatefulWidget {
  static const String route = '/developer';
  final String title = 'developer';

  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: MobileNavigation(),
      body: WillPopScope(
        onWillPop: () {
          TitleHelper()..changePrevTitle();
          return Future.value(true);
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Under progress...")],
              ),
            )),
      ),
    );
  }
}
