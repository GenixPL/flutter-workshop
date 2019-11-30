import 'package:flutter/material.dart';
import 'package:workshop/ui/tickets/bottom/bottom_bart.dart';

class MenuButton extends StatelessWidget {
  final double size = 28;
  
  @override
  Widget build(BuildContext context) {
    var bottomPadding = (minHeight - size) / 2;
    
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