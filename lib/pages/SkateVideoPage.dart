import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/ExternalVideoPlayer.dart';
import 'package:jerryselin/MobileNavigation.dart';
import 'package:jerryselin/MyAppBar.dart';

import 'package:jerryselin/TitleHelper.dart';
import 'dart:html' as html;

import 'package:jerryselin/VideoPlayerWidget.dart';

class SkateVideoPage extends StatefulWidget {
  static const String route = '/skatevideos';

  @override
  _SkateVideoPageState createState() => _SkateVideoPageState();
}

class _SkateVideoPageState extends State<SkateVideoPage> {
  @override
  void initState() {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: tr("skatevideos")
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "skatevideos", isBackButton: true,),
        endDrawer: MobileNavigation(),
        body: WillPopScope(
          onWillPop: (){
            TitleHelper()..changePrevTitle();
            return Future.value(true);
          },
          child: Center(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.black87,
                  child: Column(
                    children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: (){html.window.open(
                                      "https://www.youtube.com/channel/UCkqvtxhI1RNz8VGO2nVyCPw",
                                      "Jerry Selin Youtube channel");},
                                  child: Image.asset("assets/images/youtube.png", height: 50,)),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  tr("movies_by_date"),
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        color: Colors.black54,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExternalVideoPlayer(
                                  id: "iUQUBfTcy4A",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExternalVideoPlayer(
                                  id: "DLt9fkXZA0Y",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExternalVideoPlayer(
                                  id: "VUHGYFlNaUM",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExternalVideoPlayer(
                                  id: "Zw09Aaq3Sb8",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExternalVideoPlayer(
                                  id: "DHZO-FqhsmM",
                                ),
                              ),
                              Container(height: 100,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                      ),
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset("assets/images/instagram.png", width: 50,),
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
                      Container(height: 50,),
                      Container(
                        color: Colors.black38,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              /*
                              Text("https://www.instagram.com/p/CCv_nVjlFXk/"),
                              Text("https://www.instagram.com/p/CBNcR3MlaND/"),
                              Text("https://www.instagram.com/p/B-T6Mbjl3EL/"),
                              Text("https://www.instagram.com/p/B8wc-CulBAF/"),
                              Text("https://www.instagram.com/p/B-jqUjml-BP/"),

                               */


                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 10, left: 5, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          "https://www.instagram.com/p/CCv_nVjlFXk/",
                                          "Jerry Selin Instagram Video");
                                    },
                                    child: Text(
                                      "instagram.com/p/CCv_nVjlFXk/",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightBlueAccent),
                                    )),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.6,
                                child: VideoPlayerWidget(
                                    vidUrl: "https://scontent-hel2-1.cdninstagram.com/v/t50.2886-16/108106296_142816990767832_1493615049979675378_n.mp4?_nc_ht=scontent-hel2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=WbElrqid8MQAX9JXkjB&oe=5F638161&oh=52267c1dcd7c76269bd3ab5964e19b7f"
                                ),),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 10, left: 5, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          "https://www.instagram.com/p/B-T6Mbjl3EL/",
                                          "Jerry Selin Instagram Video");
                                    },
                                    child: Text(
                                      "instagram.com/p/B-T6Mbjl3EL/",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightBlueAccent),
                                    )),
                              ),

                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.6,
                                child: VideoPlayerWidget(
                                    vidUrl: "https://scontent-hel2-1.cdninstagram.com/v/t50.2886-16/91217467_245155450220016_7077355300659768749_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5jYXJvdXNlbF9pdGVtLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-hel2-1.cdninstagram.com&_nc_cat=100&_nc_ohc=M7-CBGvdIEcAX9u6GgR&vs=17950436488323887_3140882808&_nc_vs=HBksFQAYJEdEdmVid1h3Yllhejk5NEFBSzJ0RFFVbTBUZGlia1lMQUFBRhUAAsgBABUAGCRHSFowYndYaWRWVmtaMVlDQU1tUmZKUG51b3hxYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAABgAFt6Zuc319OI%2FFQIoAkMzLBdAE5mZmZmZmhgSZGFzaF9iYXNlbGluZV8xX3YxEQB17gcA&_nc_rid=af92571e51&oe=5F63882B&oh=7e260731cc4487076de549d429acf1be"
                                ),),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 10, left: 5, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          "https://www.instagram.com/p/B8wc-CulBAF/",
                                          "Jerry Selin Instagram Video");
                                    },
                                    child: Text(
                                      "instagram.com/p/B8wc-CulBAF/",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightBlueAccent),
                                    )),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.6,
                                child: VideoPlayerWidget(
                                    vidUrl: "https://scontent-hel2-1.cdninstagram.com/v/t50.2886-16/86480092_207282927322627_4051644264872848143_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-hel2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=z7dWc_hFJJAAX9dGmGw&vs=17844749455982406_615758503&_nc_vs=HBksFQAYJEdOeVVKd1VEUmtEUmhid0FBQV9yLWd2X1ZEbzRia1lMQUFBRhUAAsgBABUAGCRHTzVLTFFVOHRzM0NRdjBEQUFhZTBKQndmREVsYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAABgAFoye1%2BGP7bI%2FFQIoAkMzLBdAICHKwIMSbxgSZGFzaF9iYXNlbGluZV8xX3YxEQB16gcA&_nc_rid=5255868aec&oe=5F63264A&oh=1c153f707690d823b62623d23e086efc"
                                ),),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 10, left: 5, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          "https://www.instagram.com/p/B-jqUjml-BP/",
                                          "Jerry Selin Instagram Video");
                                    },
                                    child: Text(
                                      "instagram.com/p/B-jqUjml-BP/",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightBlueAccent),
                                    )),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.6,
                                child: VideoPlayerWidget(
                                    vidUrl: "https://scontent-hel2-1.cdninstagram.com/v/t50.2886-16/91603399_655656448501128_8707930058165108856_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-hel2-1.cdninstagram.com&_nc_cat=100&_nc_ohc=8Gyeo8Iu9swAX-WN3yA&vs=17846426066054489_2025150416&_nc_vs=HBksFQAYJEdNZkJkUVdJSmJYcFVGUUNBSGpBNEZWQXlOaDRia1lMQUFBRhUAAsgBABUAGCRHT2lYZUFXaEdQLWJXT29BQURLbXVJM095dzhhYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAABgAFrLCi8nbzrM%2FFQIoAkMzLBdAFKn752yLRBgSZGFzaF9iYXNlbGluZV8xX3YxEQB16gcA&_nc_rid=03abbeae9a&oe=5F638DDB&oh=c8ba76c32d9885c8f9721dede6f240d1"
                                ),),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 10, left: 5, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          "https://www.instagram.com/p/CBNcR3MlaND/",
                                          "Jerry Selin Instagram Video");
                                    },
                                    child: Text(
                                      "instagram.com/p/CBNcR3MlaND/",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightBlueAccent),
                                    )),
                              ),
                              Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.6,
                                  child: VideoPlayerWidget(
                                    vidUrl: "https://scontent-hel2-1.cdninstagram.com/v/t50.2886-16/102925182_3237445256294002_1431651248393709325_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-hel2-1.cdninstagram.com&_nc_cat=110&_nc_ohc=85ISsgPsSJAAX_0PGXj&vs=18031715116270008_2905463469&_nc_vs=HBksFQAYJEdINkRJZ1p5TG50MmNJQUxBQTFud0tZNVA5NFRia1lMQUFBRhUAAsgBABUAGCRHQjk2SkFZaW43djJQXzhBQUUxd0VrZWJPSjEyYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAABgAFvCR1tz574dAFQIoAkMzLBdAPJmZmZmZmhgSZGFzaF9iYXNlbGluZV8xX3YxEQB16gcA&_nc_rid=4325120742&oe=5F635F82&oh=d74cb018450371d17c1215b55f220bf2",)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
