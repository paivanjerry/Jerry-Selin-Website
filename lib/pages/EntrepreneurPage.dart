import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
/// Template page for new route
/// Use this as a template that contains all boilerplate for web page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jerryselin/components/Footer.dart';
import 'package:jerryselin/components/InfoBox.dart';
import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';

class EntrepreneurPage extends StatefulWidget {
  static const String route = '/entrepreneur';
  final String title = 'entrepreneur';

  @override
  _EntrepreneurPageState createState() => _EntrepreneurPageState();
}

class _EntrepreneurPageState extends State<EntrepreneurPage> {

  @override
  void initState() {
    TitleHelper().refreshTitle();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: tr(widget.title),
        isBackButton: true,),
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
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    width: min(700, MediaQuery.of(context).size.width),
                    child: Column(children: [
                    InfoBox(title: "Tmi Jerry Selin", description: tr("tmi_desc"),),
                  ],),),

                  Container(height: MediaQuery.of(context).size.height -340,),
                  Footer()
                ],
              ),
            )),
      ),
    );
  }
}
