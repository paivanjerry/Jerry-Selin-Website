import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DevItem.dart';

class DevSector extends StatefulWidget {
  @override
  _DevSectorState createState() => _DevSectorState();


  final String title;
  final Widget child;

  DevSector(
      { this.title, this.child})
      : super();
}

class _DevSectorState extends State<DevSector> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double pad = ((w < 700) ? 10 : 20);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: pad),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: pad),

        decoration: BoxDecoration(border: Border.all(
            color: Color.fromRGBO(103, 58, 183, 0.5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.deepPurple.shade400 /*Color(0xFF6200ed)*/,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 20,
            ),
            (widget.child ?? Container()),

          ],
        ),
      ),
    );
  }
}
