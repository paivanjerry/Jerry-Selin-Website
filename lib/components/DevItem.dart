import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DevItem extends StatefulWidget {
  @override
  _DevItemState createState() => _DevItemState();
  final Widget child;
  final String title;
  final String description;
  final Widget titleIcon;
  final double width;

  DevItem({this.child, this.title, this.description, this.titleIcon, this.width}) : super();
}

class _DevItemState extends State<DevItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: widget.width ?? 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(widget.titleIcon != null)
                  widget.titleIcon,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(widget.title ?? "", style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          Container(height: 1, color: Colors.deepPurple, width: 300,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.description ?? "", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
          ),
          widget.child ?? Container()
        ],
      ),
    );
  }
}
