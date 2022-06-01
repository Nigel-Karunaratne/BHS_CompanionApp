import 'package:flutter/material.dart';

class ResourcesButton extends StatefulWidget {
  final String header;
  final String description;
  final void Function() pressed;
  const ResourcesButton({Key? key, required this.header, required this.description, required this.pressed}) : super(key: key);

  @override
  State<ResourcesButton> createState() => _ResourcesButtonState();
}

class _ResourcesButtonState extends State<ResourcesButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return Colors.red[800];
          },
        ),
      ),
      onPressed: widget.pressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.header,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
          const Divider(
            height: 10,
            thickness: 3,
            color: Colors.white70,
          ),
          Text(
            widget.description,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}