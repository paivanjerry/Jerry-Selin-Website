import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jerryselin/components/MyAppBar.dart';
import 'package:jerryselin/components/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';
import 'package:jerryselin/components/InfoBox.dart';

class OtherPage extends StatefulWidget {
  static const String route = '/other';
  final String title = 'other';

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*
                  Text("Photoshoppi, Adobe After effects, Magix Vegas"),
                  Text("Instagram AR efektit"),
                  Text("Instagram giphy"),
                  Text("3D mallinnus - Solidworks, NX Cad, SketchUp, OnShape"),
                  Text("3D printing"),
                  Text(
                      "Elektroniikka, oma modifikaatio tästä https://www.instructables.com/id/Make-Your-Own-Simple-Cheap-Portable-Bluetooth-Spea/"),
                  Text("Projekti ÖÖ, eli netin välityksellä ohjattava sauna"),
                  Text(
                      "Tapahtumien järjestäminen (TTHP Toimihenkilö), Julisteet tähän"),
                  Text(
                      "Tavaraliikenteen ammattipätevyys (Kuorma-autonkuljettaja)"),
                  Text("PESU RY:n kissojen tilapäiskoti"),*/
                  Container(
                      width: w,
                      padding: EdgeInsets.only(top: 50),
                      child: InfoBox(
                        title: tr("skatepark_building"),
                        description: tr("skatepark_building_desc"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "images/bommari.png",
                                  width: w * 0.3,
                                ),
                                Text(tr("bommari"))
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "images/wakevalley.png",
                                  width: w * 0.3,
                                ),
                                Text(tr("wake_valley"))
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "images/annala.png",
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
                      title: tr("video_editing"),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("photo_editing"),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/search.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/rules.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/lightning.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/star.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/trophy.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                ],
                              ),
                              Image.asset(
                                "images/distantskatelogo.png",
                                width: w * 0.3,
                              ),
                              Image.asset(
                                "images/selinpixar.jpg",
                                width: w * 0.3,
                              ),
                            ],
                          ),
                          Column(

                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/creator.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/notes.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/hourglass.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/clock.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/roskis.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "images/register.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/puhelin.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/kaupunki.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/lisaajat.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                  Image.asset(
                                    "images/pinni.png",
                                    width: w * 0.3 * 0.2,
                                  ),
                                ],
                              ),
                              Image.asset(
                                "images/selinbroes.jpg",
                                width: w * 0.3,
                              ),
                            ],
                          ),
                          Image.asset(
                            "images/rona.jpg",
                            width: w * 0.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("3d_modelling"),
                      description: tr("3d_modelling_desc"),
                      child: (Image.asset(
                        "images/sketchup.png",
                        width: 500,
                      )),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("3d_printing"),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("electronics"),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("ar"),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("giphy"),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50),
                    child: InfoBox(
                      title: tr("events"), description: tr("events_desc"), child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("images/laitosjuliste.png", width: 300,),
                        Image.asset("images/abecsessarit.png", width: 300,),
                        Image.asset("images/kingofkampusjulisteuus.png", width: 300,),
                        Image.asset("images/gaalabommari.png", width: 300,),
                        Image.asset("images/tekramp.png", width: 300,),
                        Image.asset("images/herwoodridejulisteERG.png", width: 300,),
                    ],),
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: InfoBox(
                      title: tr("student"), description: tr("student_desc"),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
