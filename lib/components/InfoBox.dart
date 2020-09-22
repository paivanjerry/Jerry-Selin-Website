import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatefulWidget {
  @override
  _InfoBoxState createState() => _InfoBoxState();
  final Widget child;
  final String title;
  final String description;

  InfoBox({this.child, this.title, this.description}) : super();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 20),
            child: Text(
              (widget.title ?? ""),
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          Text((widget.description ?? ""), style: TextStyle(fontSize: 16),),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: widget.child,
          )
        ],
      ),
    );
  }
}
