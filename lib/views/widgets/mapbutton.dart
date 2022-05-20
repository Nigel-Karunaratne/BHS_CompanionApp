// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhs__companion__app/models/map_model.dart';

// ignore: must_be_immutable
class MapButton extends StatefulWidget {
  MapObjectData data = MapObjectData("null");
  double top = 0;
  double left = 0;

  MapButton({Key? key, required this.data, this.top = 0, this.left = 0}) : super(key: key); 

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.place, color: Colors.red,),
        onPressed: () {
          Provider.of<MapProvider>(context, listen: false).showOverlayFromProvider(widget.data, context);
        },
      ),
      top: widget.top,
      left: widget.left,
    );
  }
}