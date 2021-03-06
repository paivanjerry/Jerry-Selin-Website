import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/rendering.dart';
import 'package:jerryselin/TitleHelper.dart';


class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
  final title;
  final isBackButton;
  final darkMode;
  MyAppBar({this.title, this.darkMode = false, this.isBackButton}) : super();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.darkMode ? Colors.black : Colors.deepPurple,
        leading:  (widget.isBackButton == true) ? BackButton(
            color: widget.darkMode ? Colors.deepPurple : Colors.white
        ) : null,
        title: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(),
        Flexible(child: Text(widget.title != null ? tr(widget.title) : "Jerry Selin")),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                  onTap: () {
                    context.locale = Locale('en');
                    Future.delayed(Duration(milliseconds: 100), () {TitleHelper()..refreshTitle();});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tooltip(
                              waitDuration: Duration(seconds: 1),
                              message: "English",
                              child: Container(child: Image.asset("assets/images/en.png")))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 2,
                          width: 40,
                          color: context.locale.toString().contains("en")
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      )
                    ],
                  )),
            ),
            GestureDetector(
              child: Column(
                children: [
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Tooltip(
                          waitDuration: Duration(seconds: 1),
                          message: "Suomi",
                          child: Container(child: Image.asset("assets/images/fi.png")))),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 2,
                      width: 40,
                      color: context.locale.toString().contains("fi")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  )
                ],
              ),
              onTap: () {
                context.locale = Locale('fi');
                Future.delayed(Duration(milliseconds: 100), () {TitleHelper()..refreshTitle();});
              },
            )
          ],
        )
      ],
    )));
  }
}
