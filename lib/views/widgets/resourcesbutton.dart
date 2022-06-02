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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0,),
      child: TextButton(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                widget.description,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}