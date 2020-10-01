import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter/rendering.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      constraints: BoxConstraints(minHeight: 60),
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Tooltip(
                    message: "Instagram",
                    child: GestureDetector(
                        onTap: () {
                          html.window.open("https://www.instagram.com/jerryselin/",
                              "Jerry Selin Instagram");
                        },
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Image.asset(
                              "assets/images/instagram.png",
                              height: 40,
                            ))),
                  ),
                  Tooltip(
                    message: "Youtube",
                    child: GestureDetector(
                        onTap: () {
                          html.window.open(
                              "https://www.youtube.com/channel/UCkqvtxhI1RNz8VGO2nVyCPw",
                              "Jerry Selin Youtube");
                        },
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Image.asset(
                              "assets/images/youtube.png",
                              height: 40,
                            ))),
                  ),
                  Tooltip(
                    message: "Github",
                    child: GestureDetector(
                        onTap: () {
                          html.window.open("https://github.com/paivanjerry",
                              "Jerry Selin Github");
                        },
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Image.asset(
                              "assets/images/github.png",
                              height: 40,
                            ))),
                  ),
                  Tooltip(
                    message: "Spottimettä",
                    child: GestureDetector(
                        onTap: () {
                          html.window.open("https://spottimetta.fi/",
                              "Spottimettä");
                        },
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Image.asset(
                              "assets/images/spottimetta.png",
                              height: 40,
                            ))),
                  ),
                  Tooltip(
                    message: "Distant S.K.A.T.E.",
                    child: GestureDetector(
                        onTap: () {
                          html.window.open("https://distantskate.com",
                              "Distant S.K.A.T.E.");
                        },
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Image.asset(
                              "assets/images/distantskate.png",
                              height: 40,
                            ))),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
              opacity: 1,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple,
              )),
        ],
      ),
    );
  }
}
