import 'dart:math';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:easy_localization/easy_localization.dart';

/// Template page for new route
/// Use this as a template that contains all boilerplate for web page

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jerryselin/components/DevItem.dart';
import 'package:jerryselin/components/DevSector.dart';
import 'package:jerryselin/components/Footer.dart';
import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';
import 'dart:html' as html;

import 'package:jerryselin/pages/OtherPage.dart';

class DeveloperPage extends StatefulWidget {
  static const String route = '/developer';
  final String title = 'developer';

  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  ScrollController scrollController = ScrollController();

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      scrollController.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  @override
  void initState() {
    TitleHelper().refreshTitle();
    super.initState();
  }

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
                      child: DraggableScrollbar.semicircle(
                backgroundColor: Colors.deepPurple.shade50,
                controller: scrollController,
                alwaysVisibleScrollThumb: true,
                child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
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
                                child: Text(
                                  tr("dev_intro_1"),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tr("dev_intro_2"),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                                description: [
                                  TextSpan(text: tr("android_desc")),
                                  TextSpan(
                                      text: tr("play_store"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://play.google.com/store/apps/details?id=com.jerry.spottimett",
                                              "Play Store Spottimettä");
                                        }),
                                ],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/flutter.png",
                                  height: 40,
                                ),
                                title: "Flutter",
                                description: [
                                  TextSpan(text: tr("flutter_desc_1")),
                                  TextSpan(
                                      text: tr("spottimetta_ios"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://apps.apple.com/us/app/spottimett%C3%A4/id1508565237",
                                              "App Store Spottimettä");
                                        }),
                                  TextSpan(text: tr("flutter_desc_2")),
                                  TextSpan(
                                      text: tr("ios"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://apps.apple.com/us/app/distant-skate/id1515744987",
                                              "App Store Distant S.K.A.T.E.");
                                        }),
                                  TextSpan(text: " & "),
                                  TextSpan(
                                      text: tr("android"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://play.google.com/store/apps/details?id=fi.spottimetta.distantskate",
                                              "Play Store Distant S.K.A.T.E.");
                                        }),
                                ],
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
                                  titleWidth: 400,
                                  titleIcon: Text(
                                    "</>",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.blue.shade300),
                                  ),
                                  title: "HTML + CSS + Javascript",
                                  description: [
                                    TextSpan(text: tr("html_css_js_desc_1")),
                                    TextSpan(
                                        text: tr("spottimetta_web"),
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade300,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            html.window.open(
                                                "https://spottimetta.fi/webapp",
                                                "Spottimettä web");
                                          }),
                                    TextSpan(text: tr("html_css_js_desc_2")),
                                    TextSpan(
                                        text: tr("distant_web_page"),
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade300,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            html.window.open(
                                                "https://distantskate.com",
                                                "Distant S.K.A.T.E. web page");
                                          }),
                                    TextSpan(text: tr("html_css_js_desc_3")),
                                  ]),
                              DevItem(
                                  width: w,
                                  titleIcon: Image.asset(
                                    "assets/images/react.png",
                                    height: 40,
                                  ),
                                  title: "React",
                                  description: [
                                    TextSpan(text: tr("react_desc_1")),
                                    TextSpan(
                                        text: tr("data_spottimetta"),
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade300,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            html.window.open(
                                                "https://data.spottimetta.fi",
                                                "Data Spottimettä");
                                          }),
                                    TextSpan(text: tr("react_desc_2")),
                                  ]),
                              DevItem(
                                width: w,
                                titleWidth: 200,
                                titleIcon: Image.asset(
                                  "assets/images/vue-js.png",
                                  height: 40,
                                ),
                                title: "Vue",
                                description: [
                                  TextSpan(text: tr("vue_desc_1")),
                                  TextSpan(
                                      text: tr("napalm_site"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://napalmcustom.com",
                                              "Napalm Custom");
                                        }),
                                  TextSpan(text: tr("vue_desc_2")),
                                  TextSpan(
                                      text: tr("vue_desc_3"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://skeittivideot.fi",
                                              "Skeittivideot.fi");
                                        }),
                                  TextSpan(text: tr("vue_desc_4")),
                                ],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/wordpress.png",
                                  height: 40,
                                ),
                                title: "WordPress",
                                description: [TextSpan(text: tr("wordpress_desc"))],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/flutter.png",
                                  height: 40,
                                ),
                                title: "Flutter",
                                description: [
                                  TextSpan(text: tr("flutter_web_desc_1")),
                                  TextSpan(
                                      text: tr("flutter_web_desc_2"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      ),
                                  TextSpan(text: tr("flutter_web_desc_3")),
                                ],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/phaser.png",
                                  height: 40,
                                ),
                                title: "Phaser 3",
                                description: [
                                  TextSpan(text: tr("phaser_desc")),
                                  TextSpan(
                                      text: tr("phaser_desc_2"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://lifeof.jerrysel.in",
                                              "Life of Jerry");
                                        }),
                                  TextSpan(text: tr("phaser_desc_3")),
                                  TextSpan(text: tr("phaser_desc_4")),
                                  TextSpan(
                                      text: tr("phaser_desc_5"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          html.window.open(
                                              "https://youtu.be/CPUW_K6APX0",
                                              "Life of Jerry - Preview video");
                                        }),
                                  TextSpan(text: "."),
                                ],
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
                                description: [TextSpan(text: tr("firebase_desc"))],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/node-js.png",
                                  height: 40,
                                ),
                                title: "Node JS",
                                description: [TextSpan(text: tr("node_desc"))],
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
                                description: [TextSpan(text: tr("python_desc"))],
                              ),
                              DevItem(
                                width: w,
                                titleIcon: Image.asset(
                                  "assets/images/arduino.png",
                                  height: 40,
                                ),
                                title: "Arduino",
                                description: [
                                  TextSpan(text: tr("arduino_desc")),
                                  TextSpan(
                                      text: tr("other_page"),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushNamed(OtherPage.route);
                                        }),
                                  TextSpan(text: tr("dot"))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Footer(),
                      ],
                    );
                  },
                ),
              ))),
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
