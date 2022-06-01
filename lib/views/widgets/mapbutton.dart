// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhs__companion__app/models/map_model.dart';

// ignore: must_be_immutable
class MapButton extends StatefulWidget {
  // MapObjectData data = MapObjectData("null");
  String id;
  double top = 0;
  double left = 0;
  Color? iconColor;

  MapButton({Key? key, required this.id, this.top = 0, this.left = 0, this.iconColor}) : super(key: key); 

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.place, color: widget.iconColor??Colors.red, size: 32.0,),
        onPressed: () {
          Provider.of<MapProvider>(context, listen: false).showOverlayFromProvider(RoomData.dataMap[widget.id]??MapObjectData("_error_ (${widget.id})", 1), context);
        },
      ),
      top: widget.top,
      left: widget.left,
    );
  }
}