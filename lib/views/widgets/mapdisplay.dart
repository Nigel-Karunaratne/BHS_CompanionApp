// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhs__companion__app/models/map_model.dart';
import 'widgets_all.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({Key? key}) : super(key: key);

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  final TransformationController _transformationController = TransformationController();

  //! late AnimationController _animationController;
  //* late Animation<Matrix4> _mapAnimation;

  @override
  Widget build(BuildContext context) {
    Provider.of<MapProvider>(context, listen: false).mapBuildContext = context;

    return OverflowBox(
      child: InteractiveViewer(
        maxScale: 4.5,
        minScale: 0.8,
        constrained: false,
        boundaryMargin: const EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
      
      
        child: GridPaper(
          child: ( Provider.of<MapProvider>(context).currentFloor == 1 ? Floor1Stack() : Floor2Stack() ),
        ),
      
        transformationController: _transformationController,
      
        onInteractionUpdate: (details) {
          //* double correctScaleValue = _transformationController.value.getMaxScaleOnAxis();
          //* print(correctScaleValue);
        },
      
        onInteractionEnd: (details) {
          
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //! _animationController.dispose();
    super.dispose();
  }

  void createAnimation() {

  }


}

class Floor1Stack extends StatefulWidget {
  const Floor1Stack({Key? key}) : super(key: key);

  @override
  State<Floor1Stack> createState() => _Floor1StackState();
}

class _Floor1StackState extends State<Floor1Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
            // delegate: MapViewerFlowDelegate(),
            // fit: StackFit.expand,
            alignment: Alignment.center,
        
        
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/img/map_floor1.png",
                ),
              ),

              MapButton(
                data: MapObjectData("Room 1", locationDescription: "located near the ____"),
                top: 50,
                left: 50,
              ),
              MapButton(
                data: MapObjectData("Room 2", locationDescription: "located near the ____"),
                top: 600,
                left: 450,
              ),
              MapButton(
                data: MapObjectData("Room 3", locationDescription: "located near the ____"),
                top: 500,
                left: 500,
              ),
              MapButton(
                data: MapObjectData("Room 4", locationDescription: "located near the ____"),
                top: 150,
                left: 350,
              ),
              MapButton(
                data: MapObjectData("Room 5", locationDescription: "located near the ____"),
                top: 560,
                left: 770,
              ),

            ],
          );
  }
}

class Floor2Stack extends StatefulWidget {
  const Floor2Stack({Key? key}) : super(key: key);

  @override
  State<Floor2Stack> createState() => _Floor2StackState();
}

class _Floor2StackState extends State<Floor2Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
            // delegate: MapViewerFlowDelegate(),
            // fit: StackFit.expand,
            alignment: Alignment.center,
        
        
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/img/map_floor2.png",
                ),
              ),
        
              // Align(
              //   child: Icon(Icons.plus_one, color: Colors.red,),
              //   alignment: Alignment.topCenter,
              // ),
              // Align(
              //   child: Icon(Icons.place, color: Colors.orange,),
              //   // widthFactor: 1.0,
              //   alignment: Alignment(0, 0),
              // ),
              // Align(
              //   child: Icon(Icons.place, color: Colors.yellow,),
              //   alignment: Alignment(0.2, 0),
              // ),
              // Align(
              //   child: Icon(Icons.place, color: Colors.green,),
              //   alignment: Alignment(0.5, 0),
              // ),
              // Align(
              //   child: Icon(Icons.place, color: Colors.blue,),
              //   alignment: Alignment(1, 0),
              // ),
            
              MapButton(data: MapObjectData("RedFloor2"), top: 100, left: 200),
              Positioned(
                child: Icon(Icons.place, color: Colors.orange,),
                top: 10,
                right: 0,
              ),
              Positioned(
                child: Icon(Icons.place, color: Colors.yellow,),
                top: 10,
                left: 10
              ),
              Positioned(
                child: Icon(Icons.place, color: Colors.green,),
                top: 30,
              ),
              Positioned(
                child: Icon(Icons.place, color: Colors.blue,),
        top:540
              ),
              Positioned(
                child: Icon(Icons.place, color: Colors.purple,),
        bottom: 540,
              ),
            ],
          );
  }
}