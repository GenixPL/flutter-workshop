import 'dart:math';

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
  AnimationController _fabController;
  Animation _fabAnimation;

  double lineMaxHeight;
  double _planeStartPosition;

  bool _isFabShown = false;

  @override
  initState() {
    super.initState();

    lineMaxHeight = (widget.availableHeight - iconSize - 16) * 0.7;
    _planeStartPosition = widget.availableHeight - 16 - iconSize;

    _fabController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _fabAnimation = Tween(
      begin: pi * 0.25,
      end: 0.0,
    ).animate(_fabController);

    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isFabShown = true;
          });
        }
      });

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
                  if (_isFabShown)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.redAccent,
                          child: AnimatedBuilder(
                            animation: _fabAnimation,
                            child: Icon(
                              Icons.fingerprint,
                              color: Colors.white,
                            ),
                            builder: (context, child) => Transform.rotate(
                              angle: _fabAnimation.value,
                              child: child,
                            ),
                          ),
                          onPressed: () => _fabController.forward(),
                        ),
                      ),
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
