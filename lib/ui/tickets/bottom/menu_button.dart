import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final double barMinHeight;

  final double size = 28;

  MenuButton({
    @required this.barMinHeight,
  });

  @override
  Widget build(BuildContext context) {
    var bottomPadding = (barMinHeight - size) / 2;

    return Positioned(
      right: 0,
      bottom: bottomPadding,
      child: Icon(
        Icons.menu,
        color: Colors.amber,
        size: size,
      ),
    );
  }
}
