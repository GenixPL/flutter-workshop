import 'package:flutter/material.dart';
import 'package:workshop/ui/flights/animations/plane_size_anim.dart';

class SecondPart extends StatefulWidget {
  final double mainContainerSize;
  final double availableHeight;
  final double availableWidth;

  SecondPart({
    @required this.mainContainerSize,
    @required this.availableHeight,
    @required this.availableWidth,
  });

  @override
  _SecondPartState createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> with TickerProviderStateMixin {
  double iconSize = 44;

  AnimationController _planeSizeController;

  AnimationController _planePositionController;
  Animation _planePositionCurve;
  Animation<double> _planePositionAnimation;

  double lineMaxHeight;
  double planeStartPosition;

  @override
  initState() {
    super.initState();

    lineMaxHeight = (widget.availableHeight - iconSize - 16) * 0.7;
    planeStartPosition = widget.availableHeight - 16 - iconSize;

    _planePositionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _planeSizeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _planePositionController.forward();
        }
      });

    _planePositionCurve = CurvedAnimation(
      parent: _planePositionController,
      curve: Curves.easeInOutCubic,
    );

    _planePositionAnimation = Tween(
      begin: planeStartPosition,
      end: (8.0),
    ).animate(_planePositionCurve);

    Future.delayed(Duration(milliseconds: 250)).then((_) {
      _planeSizeController.forward();
    });
  }

  @override
  dispose() {
    _planeSizeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow, // to remove
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blueAccent, // to remove
              child: Stack(
                children: <Widget>[
                  _buildPlaneAnimations(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaneAnimations() {
    return AnimatedBuilder(
      animation: _planePositionAnimation,
      builder: (context, child) => Positioned(
        top: _planePositionAnimation.value,
        left: widget.availableWidth / 2 - iconSize / 2,
        child: _buildPlane(iconSize),
      ),
    );
  }

  Widget _buildPlane(double iconSize) {
    var planeCurrentPosition = _planePositionAnimation.value;
    var planePositionPercentage =
        (planeStartPosition - planeCurrentPosition) / planeStartPosition;

    return Container(
      color: Colors.lime,
      width: iconSize,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 4,
                height: lineMaxHeight * planePositionPercentage,
                color: Colors.grey[200],
              ),
            ),
          ),
          PlaneSizeAnim(
            iconSize: iconSize,
            planeSizeController: _planeSizeController,
          ),
        ],
      ),
    );
  }
}
