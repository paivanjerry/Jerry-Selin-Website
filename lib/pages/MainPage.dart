import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/TopBanner.dart';

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
        ApplicationSwitcherDescription(label: tr(MainPage.title)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DateTime now = new DateTime.now();
    DateTime nextBDay =DateTime.parse(now.year.toString() + "-09-18 00:00:00Z");
    Duration myAge = now.difference(DateTime.parse("1996-09-18 00:00:00Z"));
    int daysTillBDay = nextBDay.difference(now).inDays;
    if(daysTillBDay < 0){
      daysTillBDay = 365 + daysTillBDay;
    }
    double w = MediaQuery.of(context).size.width > 800
        ? 800
        : MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      appBar: MyAppBar(
        title: tr(MainPage.title),
      ),
      endDrawer: MobileNavigation(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBanner(),
                Container(
                  width: w,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    child: Text(
                      tr("welcome"),
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: w,
                      child: Text(tr("welcome_long"),
                          style: TextStyle(fontSize: 20))),
                ),
                Container(
                  width: w,
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "How old are you?",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  width: w,
                  padding: EdgeInsets.only(top: 10),
                  child: RichText(

                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Thank you for asking. I am '),
                        TextSpan(text: (myAge.inDays ~/ 365).toString(), style: new TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' years old and my birthday is just around the corner, only '),
                        TextSpan(text: daysTillBDay.toString(), style: new TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' days remaining. Remember to get me a nice present.'),

                      ],
                    ),
                  ),
                ),
                Container(height: 50,)
              ],

            ),
          )),
    );
  }
}
