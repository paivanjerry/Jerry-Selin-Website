import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jerryselin/MyAppBar.dart';
import 'package:jerryselin/MobileNavigation.dart';
import 'package:jerryselin/TitleHelper.dart';

class OtherPage extends StatefulWidget {
  static const String route = '/other';
  final String title = 'other';
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {

  void initState() {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
            label: tr(widget.title)
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: tr(widget.title), isBackButton: true),
      endDrawer: MobileNavigation(),
      body: WillPopScope(
        onWillPop: (){
          TitleHelper()..changePrevTitle();
          return Future.value(true);
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Photoshoppi, Adobe After effects, Magix Vegas"),
                  Text("Instagram AR efektit"),
                  Text("Instagram giphy"),
                  Text("3D mallinnus - Solidworks, NX Cad, SketchUp, OnShape"),
                  Text("3D printing"),
                  Text("Elektroniikka, oma modifikaatio tästä https://www.instructables.com/id/Make-Your-Own-Simple-Cheap-Portable-Bluetooth-Spea/"),
                  Text("Projekti ÖÖ, eli netin välityksellä ohjattava sauna"),
                  Text("Skedeparkkien raksailu (Ylön mini, annala mini, bommari)"),
                  Text("Tapahtumien järjestäminen (TTHP Toimihenkilö), Julisteet tähän"),
                  Text("Tavaraliikenteen ammattipätevyys (Kuorma-autonkuljettaja)"),
                  Text("PESU RY:n kissojen tilapäiskoti"),
                ],
              ),
            )),
      ),
    );
  }
}
