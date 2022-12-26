import 'package:flutter/material.dart';

class BoardTile extends StatefulWidget {
  final VoidCallback? onTap;
  final String content;

  const BoardTile({
    required this.content,
    this.onTap,
    super.key,
  });

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(
          8,
        ),
        color: Colors.black,
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            widget.content,
            style: const TextStyle(
              fontSize: 40,
              fontFamily: "press start2p regular",
            ),
          ),
        ),
      ),
    );
  }
}
