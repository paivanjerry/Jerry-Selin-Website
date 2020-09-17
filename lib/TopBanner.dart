import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jerryselin/pages/OtherPage.dart';
import 'package:jerryselin/pages/SkateVideoPage.dart';

const double IMG_RES = 400 / 512;

class TopBanner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<TopBanner> {
  int _bannerMode = 1;
  Timer _bannerTimer;
  bool _bannerHover = false;

  @override
  void initState() {
    _bannerTimer = new Timer.periodic(Duration(seconds: 2), (Timer t) {
      if(_bannerHover){
        return;
      }
      setState(() {
        if (_bannerMode == 5) {
          setState(() {
            _bannerMode = 1;
          });
        } else {
          setState(() {
            _bannerMode += 1;
          });
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _bannerTimer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/images/jerry1.png"), context);
    precacheImage(AssetImage("assets/images/jerry2.png"), context);
    precacheImage(AssetImage("assets/images/jerry3.png"), context);
    precacheImage(AssetImage("assets/images/jerry4.png"), context);
    precacheImage(AssetImage("assets/images/jerry5.png"), context);
    precacheImage(AssetImage("assets/images/skatedeck.png"), context);
    precacheImage(AssetImage("assets/images/android.png"), context);
    precacheImage(AssetImage("assets/images/flutter.png"), context);
    precacheImage(AssetImage("assets/images/entrepreneur.png"), context);
    precacheImage(AssetImage("assets/images/hoyla.png"), context);
    precacheImage(AssetImage("assets/images/multitool.png"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MouseRegion(
            onHover: (event){setState(() {
              _bannerHover = true;
              _bannerMode = 5;
            });},
            onExit: (event){setState(() {
              _bannerHover = false;
            });},
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Center(
                    child: _bannerMode == 5
                        ? GestureDetector(
                      onTap: (){Navigator.of(context).pushNamed(OtherPage.route);},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    context.locale.toString().contains("en")
                                        ? "assets/images/multitool.png"
                                        : "assets/images/hoyla.png",
                                    height: 50),
                                Text(
                                  tr("jackofalltrades"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                        )
                        : Text(""))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MouseRegion(
                onHover: (event){setState(() {
                  _bannerHover = true;
                  _bannerMode = 4;
                });},
                onExit: (event){setState(() {
                  _bannerHover = false;
                });},
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: (MediaQuery.of(context).size.width / 3) * IMG_RES,
                    child: Center(
                      child: _bannerMode == 1
                          ? Text(
                              "Jerry",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            )
                          : (_bannerMode == 4
                              ? FittedBox(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/entrepreneur.png",
                                          height: 50),
                                      Container(
                                        child: Text(
                                          tr("entrepreneur"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(

                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ],
                                  ),
                              )
                              : Text("")),
                    )),
              ),
              MouseRegion(
                onHover: (event){setState(() {
                  _bannerHover = true;
                  _bannerMode = 1;
                });},
                onExit: (event){setState(() {
                  _bannerHover = false;
                });},
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: (MediaQuery.of(context).size.width / 3) * IMG_RES,
                    child: Image.asset(
                      "assets/images/jerry" + _bannerMode.toString() + ".png",
                      fit: BoxFit.fill,
                    )),
              ),
              MouseRegion(
                onHover: (event){setState(() {
                  _bannerHover = true;
                  _bannerMode = 2;
                });},
                onExit: (event){setState(() {
                  _bannerHover = false;
                });},
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: (MediaQuery.of(context).size.width / 3) * IMG_RES,
                    child: Center(
                        child: _bannerMode == 1
                            ? Text(
                                "Selin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              )
                            : (_bannerMode == 2
                                ? GestureDetector(
                          onTap: (){Navigator.of(context).pushNamed(SkateVideoPage.route);},
                          child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/skatedeck.png",
                                            height: 50),
                                        Text(
                                          tr("skater"),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                )
                                : Text("")))),
              ),
            ],
          ),
          MouseRegion(
            onHover: (event){setState(() {
              _bannerHover = true;
              _bannerMode = 3;
            });},
            onExit: (event){setState(() {
              _bannerHover = false;
            });},
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Center(
                  child: Container(
                      child: _bannerMode == 3
                          ? FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/android.png",
                                    height: 50,
                                  ),
                                  Text(
                                    "</>",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset("assets/images/flutter.png",
                                      height: 50),
                                  Text(
                                    tr("developer"),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Text("")),
                )),
          ),
        ],
      ),
    );
  }
}
