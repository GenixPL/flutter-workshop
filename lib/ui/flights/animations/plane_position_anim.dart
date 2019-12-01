import 'package:flutter/material.dart';

class PlanePositionAnim extends StatefulWidget {
  final Widget child;
  final AnimationController planePositionController;
  final double planeStartPosition;
  final double iconSize;
  final double lineMaxHeight;
  final double availableWidth;

  PlanePositionAnim({
    @required this.child,
    @required this.planePositionController,
    @required this.planeStartPosition,
    @required this.iconSize,
    @required this.lineMaxHeight,
    @required this.availableWidth,
  });

  @override
  _PlanePositionAnimState createState() => _PlanePositionAnimState();
}

class _PlanePositionAnimState extends State<PlanePositionAnim> {
  Animation _planePositionCurve;
  Animation<double> _planePositionAnimation;

  @override
  void initState() {
    super.initState();

    _planePositionCurve = CurvedAnimation(
      parent: widget.planePositionController,
      curve: Curves.easeInOutCubic,
    );

    _planePositionAnimation = Tween(
      begin: widget.planeStartPosition,
      end: (8.0),
    ).animate(_planePositionCurve)
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    var planeCurrentPosition = _planePositionAnimation.value;
    var planePositionPercentage =
        (widget.planeStartPosition - planeCurrentPosition) /
            widget.planeStartPosition;


    return Positioned(
      top: _planePositionAnimation.value,
      left: widget.availableWidth / 2 - widget.iconSize / 2,
      child: Container(
        color: Colors.lime,
        width: widget.iconSize,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 4,
                  height: widget.lineMaxHeight * planePositionPercentage,
                  color: Colors.grey[200],
                ),
              ),
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
