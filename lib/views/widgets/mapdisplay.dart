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
  final bool showIcons = true;
  //! late AnimationController _animationController;
  //* late Animation<Matrix4> _mapAnimation;

  @override
  Widget build(BuildContext context) {
    Provider.of<MapProvider>(context, listen: false).mapBuildContext = context;
    int currentFloor = Provider.of<MapProvider>(context).currentFloor;
    bool showMarkers = Provider.of<MapProvider>(context).showMarkers;
    return OverflowBox(
      child: InteractiveViewer(
        maxScale: 4.5,
        minScale: 0.8,
        constrained: false,
        boundaryMargin: const EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
      
      
        child: GridPaper(
          // child: (currentFloor == 1 ? 
          //   (showMarkers ? Floor1StackIcon() : Floor1Stack()) : (showMarkers ? Floor2StackIcon() : Floor2Stack()) 
          // ),
          child: Builder(
            builder: (context) {
              switch(currentFloor) {
                case 0:
                  return FloorBasementStack(showIcons: showMarkers);
                case 1:
                  return Floor1Stack(showIcons: showMarkers);
                case 2:
                  return Floor2Stack(showIcons: showMarkers);
                default:
                  return Floor1Stack(showIcons: showMarkers);
              }
            }),
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
  const Floor1Stack({Key? key, required this.showIcons}) : super(key: key);

  final bool showIcons;
  @override
  State<Floor1Stack> createState() => _Floor1StackState();
}

class _Floor1StackState extends State<Floor1Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? layoutWithIcons() : [
        Center(
          child: Image.asset(
          "assets/img/map_floor1.png",
          ),
        ),
      ],
    );
  }

  List<Widget> layoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floor1.png",
        ),
      ),
      // * Dark Green (Health)
      MapButton(id: "187", top: 200, left: 380),
      MapButton(id: "188", top: 200, left: 415),
      MapButton(id: "189", top: 200, left: 455),
      MapButton(id: "190", top: 200, left: 495),
      MapButton(id: "Fitness Center", top: 260, left: 460),
      MapButton(id: "???", top: 245, left: 540), //office (idk if we need it)

      // * Light Purple (science)
      MapButton(id: "174", top: 320, left: 380),
      MapButton(id: "176", top: 320, left: 435),
      MapButton(id: "177", top: 320, left: 480),
      MapButton(id: "179", top: 320, left: 530),
      MapButton(id: "165", top: 380, left: 375),
      MapButton(id: "173", top: 380, left: 435),
      MapButton(id: "172", top: 380, left: 480),
      MapButton(id: "156", top: 380, left: 535),
      MapButton(id: "164", top: 450, left: 375),
      MapButton(id: "157", top: 450, left: 535),
      MapButton(id: "163", top: 500, left: 375),
      MapButton(id: "167", top: 480, left: 424),
      MapButton(id: "168", top: 505, left: 424),
      MapButton(id: "171", top: 480, left: 490),
      MapButton(id: "170", top: 505, left: 490),
      MapButton(id: "169 / Lecture Hall", top: 500, left: 460),
      MapButton(id: "158", top: 500, left: 535),
      MapButton(id: "???", top: 455, left: 490), //office (idk if we need it)

      // * Dark Blue (Music)
      MapButton(id: "191 / Chorus", top: 355, left: 640),
      MapButton(id: "192", top: 365, left: 688),
      MapButton(id: "Band Room", top: 355, left: 745),
      MapButton(id: "197 / Music Room", top: 405, left: 720),
      MapButton(id: "Auditorium", top: 510, left: 725),
      MapButton(id: "1SS", top: 405, left: 793), //! TODO: Figure out what room this is
      MapButton(id: "155", top: 405, left: 813),

      // * Red (Main Office)
      MapButton(id: "Nurse", top: 630, left: 710),
      MapButton(id: "Mail Room", top: 630, left: 790),
      MapButton(id: "Main OFfice", top: 680, left: 665),
      MapButton(id: "Guidance Conference", top: 680, left: 750),
      MapButton(id: "Guidance", top: 680, left: 800),

      // * Magenta (Cafeteria)
      MapButton(id: "Cafeteria B", top: 790, left: 700),
      MapButton(id: "Cafeteria A", top: 920, left: 680),

      // * Orange (Foreign Languages?)
      MapButton(id: "162", top: 548, left: 395),
      MapButton(id: "161", top: 548, left: 440),
      MapButton(id: "159", top: 548, left: 530),
      MapButton(id: "137", top: 778, left: 390),
      MapButton(id: "136", top: 778, left: 425),
      MapButton(id: "134", top: 778, left: 530),
      MapButton(id: "129", top: 830, left: 385),
      MapButton(id: "128", top: 880, left: 385),

      // * Yellow ()
      MapButton(id: "130A", top: 820, left: 425),
      MapButton(id: "130B", top: 845, left: 425),
      MapButton(id: "133 / Bridge", top: 835, left: 462),
      MapButton(id: "132", top: 820, left: 500),
      MapButton(id: "132 B", top: 845, left: 500),
      MapButton(id: "BCAT", top: 883, left: 423),

      // * Light Green (Libary Area)
      MapButton(id: "Lower Library", top: 610, left: 460),
      MapButton(id: "Tech Offices", top: 660, left: 440),
      MapButton(id: "Upper Library", top: 720, left: 460),
      MapButton(id: "Writing Center", top: 590, left: 542),
      MapButton(id: "Help Desk", top: 740, left: 374),
    ];
  }
}

class Floor2Stack extends StatefulWidget {
  const Floor2Stack({Key? key, required this.showIcons}) : super(key: key);
  final bool showIcons;
  
  @override
  State<Floor2Stack> createState() => _Floor2StackState();
}

class _Floor2StackState extends State<Floor2Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,  
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? showLayoutWithIcons() : [
        Center(
          child: Image.asset(
            "assets/img/map_floor2.png",
          ),
        ),
      ],
    );
  }

  List<Widget> showLayoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floor2.png",
        ),
      ),

      MapButton(id: "R1", top: 100, left: 200),
    ];
  }
}

class FloorBasementStack extends StatefulWidget {
  const FloorBasementStack({Key? key, required this.showIcons}) : super(key: key);
  final bool showIcons;

  @override
  State<FloorBasementStack> createState() => _FloorBasementStackState();
}

class _FloorBasementStackState extends State<FloorBasementStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,  
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? showLayoutWithIcons() : [
        Center(
          child: Image.asset(
            "assets/img/map_floor2.png",
          ),
        ),
      ],
    );
  }

  List<Widget> showLayoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floorB.png",
        ),
      ),

      MapButton(id: "R1", top: 100, left: 200),
    ];
  }
}
