import 'dart:math';

import 'package:easy_localization/easy_localization.dart';

/// Template page for new route
/// Use this as a template that contains all boilerplate for web page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jerryselin/components/DevItem.dart';
import 'package:jerryselin/components/DevSector.dart';
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
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      appBar: MyAppBar(
        title: tr("developer"),
        darkMode: true,
      ),
      endDrawer: MobileNavigation(),
      body: WillPopScope(
        onWillPop: () {
          TitleHelper()..changePrevTitle();
          return Future.value(true);
        },
        child: Stack(
          children: [
            Container(
              color: Color(0xFF1b1b1b),
              child: Center(
                  child: Container(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: max(w, 900),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tr("dev_title"),
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.deepPurple
                                        .shade300 /*Color(0xFF6200ed)*/,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( tr("dev_intro_1"),
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( tr("dev_intro_2"),
                                style: TextStyle(color: Colors.white, ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Opacity(
                                opacity: 0.3,
                                child: Container(
                                  height: 1,
                                  color: Colors.deepPurple,
                                )),
                            Container(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tr("dev_intro_end"),
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                      ),
                      DevSector(
                        title: tr("mobile"),
                        child: Wrap(
                          spacing: 20,
                          children: [
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/android.png",
                                height: 40,
                              ),
                              title: "Android",
                              description: "",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/flutter.png",
                                height: 40,
                              ),
                              title: "Flutter",
                              description: "",
                            ),
                          ],
                        ),
                      ),
                      DevSector(
                        title: tr("web"),
                        child: Wrap(
                          spacing: 20,
                          children: [
                            DevItem(
                              width: w,
                              titleIcon: Text("</>", style: TextStyle(fontSize: 40, color: Colors.white),),
                              title: "HTML + CSS + Javascript",
                              //description: "My first page Spottimettä. Also Distant skate web site (HTML 5 components)",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/react.png",
                                height: 40,
                              ),
                              title: "React",
                              description: "",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/vue-js.png",
                                height: 40,
                              ),
                              title: "Vue",
                              description: "",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/wordpress.png",
                                height: 40,
                              ),
                              title: "WordPress",
                              description: "",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/flutter.png",
                                height: 40,
                              ),
                              title: "Flutter",
                              description: "",
                            ),
                          ],
                        ),
                      ),
                      DevSector(
                        title: tr("server"),
                        child: Wrap(
                          spacing: 20,
                          children: [
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/firebase.png",
                                height: 40,
                              ),
                              title: "Firebase",
                              description: "",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/node-js.png",
                                height: 40,
                              ),
                              title: "Node JS",
                             // description: "I have used Node JS functions with my mobile app backends. Node JS is familiar to me from non-personal projects.",
                            ),
                          ],
                        ),
                      ),
                      DevSector(
                        title: tr("other"),
                        child: Wrap(
                          spacing: 20,
                          children: [
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/python.png",
                                height: 40,
                              ),
                              title: "Python",
                              //description: "Selenium web scrape bot, Telegram bots",
                            ),
                            DevItem(
                              width: w,
                              titleIcon: Image.asset(
                                "assets/images/arduino.png",
                                height: 40,
                              ),
                              title: "Arduino",
                              description: "",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),

            // Under app bar purple line
            Opacity(
                opacity: 0.7,
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.deepPurple,
                )),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print(scrollController.offset);
          scrollController.animateTo(0,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        tooltip: tr("scroll_top"),
        child: new Icon(Icons.arrow_upward),
      ),
    );
  }
}
