import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop/enums/events.dart';
import 'package:workshop/models/event_m.dart';
import 'package:workshop/ui/tickets/menu_button.dart';
import 'package:workshop/ui/tickets/sheet_header.dart';

/// bottom bar's min height
const double minHeight = 120;

const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  AnimationController _anim;

  Duration durtaion = Duration(milliseconds: 600);

  @override
  initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    _anim = AnimationController(
      vsync: this,
      duration: durtaion,
    );
  }

  @override
  dispose() {
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
        for (EventM event in events) _buildIcon(event),
        MenuButton(),
      ],
    );
  }

  Widget _buildIcon(EventM event) {
    int index = events.indexOf(event);

    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(itemBorderRadius),
        child: Image.asset(
          event.assetName,
          fit: BoxFit.cover,
          // changes part of image that will be displayed (rly nice)
          alignment: Alignment(
            lerp(1, 0),
            0,
          ),
        ),
      ),
    );
  }

  // FUNCTIONS

  /// The 'details' object provides the position of the touch and the distance
  /// it has traveled since the last update.
  _handleDragUpdate(DragUpdateDetails details) {
    // Update the _anim by the movement done by user.
    _anim.value -= details.primaryDelta / maxHeight;
  }

  /// The velocity at which the pointer was moving when it stopped contacting
  /// the screen is available in the 'details'.
  _handleDragEnd(DragEndDetails details) {
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

  _toggle() {
    final bool isOpen = (_anim.status == AnimationStatus.completed);

    _anim.fling(velocity: isOpen ? -2 : 2);
  }

  // VALUES

  // similar to Tween - changes value depending on animation's value
  double lerp(double min, double max) {
    return lerpDouble(min, max, _anim.value);
  }

  double get maxHeight => MediaQuery.of(context).size.height;

  double get headerFontSize => lerp(14, 24);

  double get headerTopMargin {
    return lerp(20, 20 + MediaQuery.of(context).padding.top);
  }

  double get itemBorderRadius => lerp(8, 24);

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) {
    var lerpVal = lerp(
      iconStartMarginTop,
      iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
    );

    return lerpVal + headerTopMargin;
  }

  double iconLeftMargin(int index) {
    return lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);
  }
}
