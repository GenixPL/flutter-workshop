import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  AnimationController _anim;

  double minHeight = 60;
  double get maxHeight => MediaQuery.of(context).size.height;

  Duration durtaion = Duration(milliseconds: 600);

  // similar to Tween - changes value depending on animation's value
  double lerp(double min, double max) => lerpDouble(min, max, _anim.value);

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    _anim = AnimationController(
      vsync: this,
      duration: durtaion,
    );
  }

  @override
  void dispose() {
    _anim.dispose();

    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) => Positioned(
        height: lerp(minHeight, maxHeight),
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          onTap: _toggle,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
          ),
        ),
      ),
    );
  }

  // FUNCTIONS

  void _toggle() {
    final bool isOpen = (_anim.status == AnimationStatus.completed);

    _anim.fling(velocity: isOpen ? -2 : 2);
  }
}
