import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/components/Footer.dart';
import 'package:jerryselin/components/YoutubeVideoPlayer.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/components/MyAppBar.dart';

import 'package:jerryselin/TitleHelper.dart';
import 'dart:html' as html;

import 'package:jerryselin/components/InstagramPlayer.dart';

class SkateVideoPage extends StatefulWidget {
  static const String route = '/skatevideos';

  @override
  _SkateVideoPageState createState() => _SkateVideoPageState();
}

class _SkateVideoPageState extends State<SkateVideoPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(label: tr("skatevideos")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "skatevideos",
          isBackButton: true,
        ),
        endDrawer: MobileNavigation(),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            print(scrollController.offset);
            scrollController.animateTo(0,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          tooltip: tr("scroll_top"),
          child: new Icon(Icons.arrow_upward),
        ),
        body: WillPopScope(
          onWillPop: () {
            TitleHelper()..changePrevTitle();
            return Future.value(true);
          },
          child: Center(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: DraggableScrollbar.semicircle(
                  backgroundColor: Colors.deepPurple.shade50,
                  controller: scrollController,
                  alwaysVisibleScrollThumb: true,
                  child: ListView.builder(

                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black87,
                        child: Column(
                          children: [
                            FittedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          html.window.open(
                                              "https://www.youtube.com/channel/UCkqvtxhI1RNz8VGO2nVyCPw",
                                              "Jerry Selin Youtube channel");
                                        },
                                        child: Image.asset(
                                          "assets/images/youtube.png",
                                          height: 50,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        tr("movies_by_date"),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black54,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "gbX5wr3KpP4",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "iUQUBfTcy4A",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "DLt9fkXZA0Y",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "VUHGYFlNaUM",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "Zw09Aaq3Sb8",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: YoutubeVideoPlayer(
                                        id: "DHZO-FqhsmM",
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            ),
                            FittedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        "assets/images/instagram.png",
                                        width: 50,
                                      ),
                                    ),
                                    Text(tr("ig_highlights") + " ",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  html.window.open(
                                      "https://www.instagram.com/jerryselin/",
                                      "Jerry Selin Instagram");
                                },
                                child: Text(
                                  "@jerryselin",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                )),
                            Container(
                              height: 50,
                            ),
                            Container(
                              color: Colors.black38,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                          900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                          0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                        "https://www.instagram.com/p/CHvIL_9FRHU/",
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                              0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                            "https://www.instagram.com/p/CCv_nVjlFXk/",
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                              0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                            "https://www.instagram.com/p/B-T6Mbjl3EL/",
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                              0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                            "https://www.instagram.com/p/B8wc-CulBAF/",
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                              0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                            "https://www.instagram.com/p/B-jqUjml-BP/",
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              900
                                          ? 900
                                          : MediaQuery.of(context).size.width *
                                              0.95,
                                      child: InstagramPlayer(
                                        pageUrl:
                                            "https://www.instagram.com/p/CBNcR3MlaND/",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                            ),
                            Footer()
                          ],
                        ),
                      );
                    },
                  ),
                )),
          ),
        ));
  }
}

