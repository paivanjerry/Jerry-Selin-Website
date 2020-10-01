import 'dart:math';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/components/Footer.dart';
import 'package:jerryselin/components/InstagramPlayer.dart';
import 'package:jerryselin/components/LocalVideoLoopPlayer.dart';

import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';
import 'package:jerryselin/components/InfoBox.dart';
import 'package:jerryselin/components/YoutubeVideoPlayer.dart';
import 'package:video_player/video_player.dart';

class OtherPage extends StatefulWidget {
  static const String route = '/other';
  final String title = 'other';

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  ScrollController scrollController = ScrollController();

  void initState() {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(label: tr(widget.title)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width > 800
        ? 800
        : MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      appBar: MyAppBar(title: tr(widget.title), isBackButton: true),
      endDrawer: MobileNavigation(),
      body: WillPopScope(
        onWillPop: () {
          TitleHelper()..changePrevTitle();
          return Future.value(true);
        },
        child: Container(
            color: Colors.orange.shade50,
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
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 20,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: w,
                                padding: EdgeInsets.only(top: 50),
                                child: InfoBox(
                                  title: tr("skatepark_building"),
                                  description: tr("skatepark_building_desc"),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.end,
                                    alignment: WrapAlignment.center,
                                    spacing: 10,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/bommari.png",
                                            width: w * 0.3,
                                          ),
                                          Image.asset(
                                            "assets/images/bommarikyosti.jpg",
                                            width: w * 0.3,
                                          ),
                                          Text(tr("bommari"))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/wakevalley.png",
                                            width: w * 0.3,
                                          ),
                                          Text(tr("wake_valley"))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/annala.png",
                                            width: w * 0.3,
                                          ),
                                          Text(tr("parent_mini"))
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("photo_editing"),
                                child: w > 700
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: getPhotoEditChildren(w),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: getPhotoEditChildren(w),
                                      ),
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("video_editing"),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceAround,
                                  crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 10,
                                  children: [
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/B-HRX7Hlfrk/",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/B5r8WfpFDL3/",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/BOelnSWD5tv/",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/BL3dQbXDfwu/",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/BO69I9IDgY-/",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: InstagramPlayer(
                                          pageUrl:
                                              "https://www.instagram.com/p/B964PeDFylL/",
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: w,
                                  padding: EdgeInsets.only(top: 50),
                                  child: InfoBox(
                                    title: tr("3d_modelling"),
                                    description: tr("3d_modelling_desc"),
                                    child: Wrap(
                                      spacing: 10,
                                      children: [
                                        Image.asset(
                                          "assets/images/sketchup.png",
                                          width: 350,
                                        ),
                                        Image.network(
                                          "https://i.giphy.com/media/nOrKdXcwDsoEdk7BFT/source.gif",
                                          width: 350,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: w,
                                  padding: EdgeInsets.only(top: 50),
                                  child: InfoBox(
                                    title: tr("3d_printing"),
                                    child: Wrap(
                                      children: [
                                        Image.asset(
                                          "assets/images/phonecase.jpg",
                                          width: w * 0.45,
                                        ),
                                        Container(
                                            width: w * 0.45,
                                            child: LocalVideoLoopPlayer(
                                                asset:
                                                    "assets/videos/clipper.mp4"))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("electronics"),
                                description: tr("electronics_desc_1"),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      "assets/images/speaker.jpg",
                                      width: 400,
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: tr("electronics_desc_2")),
                                          TextSpan(
                                              text: tr("electronics_desc_3"),
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold)),
                                          TextSpan(
                                              text: tr("electronics_desc_4")),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 10,
                                      children: [
                                        Container(
                                            width: 450,
                                            child: InstagramPlayer(
                                              pageUrl:
                                                  "https://www.instagram.com/p/CFjWS_EJfVl/",
                                              loopMode: true,
                                            )),
                                        Image.asset(
                                          "assets/images/sauna.jpg",
                                          width: w > 700 ? 250 : w,
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: tr("electronics_desc_5"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text: tr("electronics_desc_6")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("ar"),
                                description: tr("ar_desc"),
                                child: (Wrap(
                                  children: [
                                    Container(
                                        width: w * 0.45,
                                        child: LocalVideoLoopPlayer(
                                          asset:
                                              "assets/videos/whichspot.mp4",
                                        )),
                                    Container(
                                        width: w * 0.45,
                                        child: LocalVideoLoopPlayer(
                                          asset:
                                              "assets/videos/whichtrick.mp4",
                                        )),
                                  ],
                                )),
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("giphy"),
                                description: tr("giphy_desc"),
                                child: Wrap(
                                  children: [
                                    Image.network(
                                      "https://i.giphy.com/media/Pkj8wqgJNr2pa5q4Pl/giphy.webp",
                                      width: 200,
                                    ),
                                    Image.network(
                                      "https://i.giphy.com/media/j0phBlU23cLCWnr1Ns/giphy-downsized.gif",
                                      width: 200,
                                    ),
                                    Image.network(
                                      "https://i.giphy.com/media/UuSCDKzF0TpdSCcYMr/source.gif",
                                      width: 200,
                                    ),
                                    Image.network(
                                      "https://i.giphy.com/media/U7EB6CXEGRwiqXxwSu/giphy.webp",
                                      width: 200,
                                    ),
                                    Image.network(
                                      "https://i.giphy.com/media/QYpWm08DeldJ5LOEYl/giphy.webp",
                                      width: 200,
                                    ),
                                    Image.network(
                                      "https://i.giphy.com/media/fADpHWLIloT6PLRFFL/giphy.webp",
                                      width: 200,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(top: 50),
                              child: InfoBox(
                                title: tr("events"),
                                description: tr("events_desc"),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/laitosjuliste.jpg",
                                      width: 300,
                                    ),
                                    Image.asset(
                                      "assets/images/abecsessarit.png",
                                      width: 300,
                                    ),
                                    Image.asset(
                                      "assets/images/kingofkampus.jpg",
                                      width: 300,
                                    ),
                                    Image.asset(
                                      "assets/images/gaalabommari.JPG",
                                      width: 300,
                                    ),
                                    Image.asset(
                                      "assets/images/tekramp.jpg",
                                      width: 300,
                                    ),
                                    Image.asset(
                                      "assets/images/herwoodride.JPG",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            ),
                            Footer()
                          ],
                        ),
                      );
                    }))),
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

  List<Widget> getPhotoEditChildren(double w) {
    if (w < 700) {
      w = w * 2;
    }
    return [
      Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/search.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/rules.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/lightning.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/star.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/trophy.png",
                width: w * 0.3 * 0.2,
              ),
            ],
          ),
          Image.asset(
            "assets/images/distantskatelogo.png",
            width: w * 0.3,
          ),
          Image.asset(
            "assets/images/selinpixar.jpg",
            width: w * 0.3,
          ),
        ],
      ),
      Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/creator.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/notes.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/hourglass.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/clock.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/roskis.png",
                width: w * 0.3 * 0.2,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/register.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/puhelin.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/kaupunki.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/lisaajat.png",
                width: w * 0.3 * 0.2,
              ),
              Image.asset(
                "assets/images/pinni.png",
                width: w * 0.3 * 0.2,
              ),
            ],
          ),
          Image.asset(
            "assets/images/selinbroes.jpg",
            width: w * 0.3,
          ),
        ],
      ),
      Image.asset(
        "assets/images/rona.jpg",
        width: w * 0.3,
      ),
    ];
  }
}
