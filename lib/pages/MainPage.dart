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

  bool cachedOtherPage = false;

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(seconds: 3), () {
      print("CAHCEIMAGEE");
      if (cachedOtherPage) {
        return;
      }
      precacheImage(AssetImage("assets/images/bommari.png"), context);
      precacheImage(AssetImage("assets/images/bommarikyosti.jpg"), context);
      precacheImage(AssetImage("assets/images/wakevalley.png"), context);
      precacheImage(AssetImage("assets/images/annala.png"), context);
      precacheImage(AssetImage("assets/images/distantskatelogo.png"), context);
      precacheImage(AssetImage("assets/images/selinbroes.jpg"), context);
      precacheImage(AssetImage("assets/images/selinpixar.jpg"), context);
      precacheImage(AssetImage("assets/images/rona.jpg"), context);

      cachedOtherPage = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime nextBDay =
        DateTime.parse(now.year.toString() + "-09-18 00:00:00Z");
    Duration myAge = now.difference(DateTime.parse("1996-09-18 00:00:00Z"));
    int daysTillBDay = nextBDay.difference(now).inDays;
    if (daysTillBDay < 0) {
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
                    tr("how_old"),
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: tr("bday1")),
                        TextSpan(
                            text: (myAge.inDays ~/ 365).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: tr("bday2")),
                        TextSpan(
                            text: daysTillBDay.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: tr("bday3")),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: w,
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    tr("how_you_learned"),
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: tr("how_you_learned_answer")),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                )
              ],
            ),
          )),
    );
  }
}
