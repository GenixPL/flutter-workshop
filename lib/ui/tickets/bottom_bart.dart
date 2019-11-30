import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop/ui/tickets/menu_button.dart';
import 'package:workshop/ui/tickets/sheet_header.dart';

const double minHeight = 60;

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  AnimationController _anim;

  double get maxHeight => MediaQuery.of(context).size.height;

  Duration durtaion = Duration(milliseconds: 600);

  // similar to Tween - changes value depending on animation's value
  double lerp(double min, double max) => lerpDouble(min, max, _anim.value);

  double get headerFontSize => lerp(14, 24);
  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

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
        child: _buildContainer(),
      ),
    );
  }

  // WIDGETS

  Widget _buildContainer() {
    return GestureDetector(
      onTap: _toggle,
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: _buildContainerContent(),
      ),
    );
  }

  Widget _buildContainerContent() {
    return Stack(
      children: <Widget>[
        SheetHeader(
          fontSize: headerFontSize,
          topMargin: headerTopMargin,
        ),
        MenuButton(),
      ],
    );
  }

  // FUNCTIONS

  /// The 'details' object provides the position of the touch and the distance
  /// it has traveled since the last update.
  void _handleDragUpdate(DragUpdateDetails details) {
    // Update the _anim by the movement done by user.
    _anim.value -= details.primaryDelta / maxHeight;
  }

  /// The velocity at which the pointer was moving when it stopped contacting
  /// the screen is available in the 'details'.
  void _handleDragEnd(DragEndDetails details) {
    if (_anim.isAnimating || _anim.status == AnimationStatus.completed) {
      return;
    }

    // calculate the velocity of the gesture
    final double velocity = details.velocity.pixelsPerSecond.dy / maxHeight;

    if (velocity < 0.0) {
      // either continue it upwards
      _anim.fling(velocity: math.max(2.0, -velocity));

      //
    } else if (velocity > 0.0) {
      // or continue it downwards
      _anim.fling(velocity: math.min(-2.0, -velocity));

      //
    } else {
      // or just continue to whichever edge is closer
      _anim.fling(velocity: _anim.value < 0.5 ? -2.0 : 2.0);
    }
  }

  void _toggle() {
    final bool isOpen = (_anim.status == AnimationStatus.completed);

    _anim.fling(velocity: isOpen ? -2 : 2);
  }
}
