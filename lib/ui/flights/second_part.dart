import 'package:flutter/material.dart';

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
  Animation _placeSizeAnimation;

  AnimationController _planePositionController;
  Animation _planePositionCurve;
  Animation<double> _placePositionAnimation;

  @override
  initState() {
    super.initState();

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

    _placeSizeAnimation = Tween(
      begin: 2.0,
      end: 1.0,
    ).animate(_planeSizeController);

    _planePositionCurve = CurvedAnimation(
      parent: _planePositionController,
      curve: Curves.easeInOutCubic,
    );

    _placePositionAnimation = Tween(
      begin: (widget.availableHeight - 16 - iconSize),
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
    // 16 for FAB padding

    return AnimatedBuilder(
      animation: _placePositionAnimation,
      builder: (context, child) => Positioned(
        top: _placePositionAnimation.value,
        left: widget.availableWidth / 2 - iconSize / 2,
        child: AnimatedBuilder(
          animation: _placeSizeAnimation,
          child: _buildPlane(iconSize),
          builder: (context, child) => Transform.scale(
            child: child,
            scale: _placeSizeAnimation.value,
          ),
        ),
      ),
    );
  }

  Widget _buildPlane(double iconSize) {
    return Icon(
      Icons.airplanemode_active,
      size: iconSize,
      color: Colors.redAccent,
    );
  }
}
