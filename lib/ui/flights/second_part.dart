import 'package:flutter/material.dart';
import 'package:workshop/ui/flights/animations/cards_anim.dart';
import 'package:workshop/ui/flights/animations/plane_position_anim.dart';
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
  AnimationController _cardsAnimationController;

  double lineMaxHeight;
  double _planeStartPosition;

  @override
  initState() {
    super.initState();

    lineMaxHeight = (widget.availableHeight - iconSize - 16) * 0.7;
    _planeStartPosition = widget.availableHeight - 16 - iconSize;

    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

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
          Future.delayed(Duration(milliseconds: 800)).then((_) {
            _cardsAnimationController.forward();
          });
        }
      });

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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  _buildPlaneAnimations(),
                  CardsAnim(
                    availableWidth: widget.availableWidth,
                    cardsAnimationController: _cardsAnimationController,
                    iconSize: iconSize,
                    lineMaxHeight: lineMaxHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaneAnimations() {
    return PlanePositionAnim(
      availableWidth: widget.availableWidth,
      lineMaxHeight: lineMaxHeight,
      planePositionController: _planePositionController,
      planeStartPosition: _planeStartPosition,
      iconSize: iconSize,
      child: PlaneSizeAnim(
        iconSize: iconSize,
        planeSizeController: _planeSizeController,
      ),
    );
  }
}
