import 'dart:math';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class CardsAnim extends StatefulWidget {
  final AnimationController cardsAnimationController;
  final double lineMaxHeight;
  final double availableWidth;
  final double iconSize;

  CardsAnim({
    @required this.cardsAnimationController,
    @required this.lineMaxHeight,
    @required this.availableWidth,
    @required this.iconSize,
  });

  @override
  _CardsAnimState createState() => _CardsAnimState();
}

class _CardsAnimState extends State<CardsAnim> {
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(
      begin: 0,
      end: 1000,
    ).animate(widget.cardsAnimationController)
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = widget.lineMaxHeight + 16;
    double spacing = maxHeight * 0.65 / 3;
    double cardHeight = widget.lineMaxHeight / 4;

    return Positioned(
      top: 8,
      left: 0,
      child: Container(
        width: widget.availableWidth,
        height: maxHeight + cardHeight,
        child: Stack(
          children: <Widget>[
            for (int i = 3; i >= 0; i--)
              _buildLine(i, maxHeight - 20 - (3 - i) * spacing + 8),
            for (int i = 0; i < 4; i++)
              _buildDot(i, maxHeight - 20 - i * spacing),
            for (int i = 0; i < 4; i++)
              _buildCard(i, maxHeight - 20 - (3 - i) * spacing + 8, cardHeight),
          ],
        ),
      ),
    );
  }

  _buildDot(int i, double top) {
    if (_animation.value < 50 * i + 50) {
      return Container();
    }

    return Positioned(
      top: top,
      left: widget.availableWidth / 2 - 10,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            constraints: BoxConstraints(maxHeight: 3, maxWidth: 3),
            decoration: BoxDecoration(
              color: (i == 0 || i == 3) ? Colors.redAccent : Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  _buildLine(int i, double top) {
    if (_animation.value < 50 * i + 250) {
      return Container();
    }

    if (i % 2 == 0) {
      return Positioned(
        top: top,
        left: widget.availableWidth / 2,
        child: Animator<double>(
          duration: Duration(milliseconds: 200),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (anim) => Container(
            width: 60 * anim.value,
            height: 2,
            color: Colors.grey[300],
          ),
        ),
      );
    }

    return Positioned(
      top: top,
      right: widget.availableWidth / 2,
      child: Animator<double>(
        duration: Duration(milliseconds: 50),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (anim) => Container(
          width: 60 * anim.value,
          height: 2,
          color: Colors.grey[300],
        ),
      ),
    );
  }

  _buildCard(int i, double top, double cardHeight) {
    if (_animation.value < 50 * i + 450) {
      return Container();
    }

    var cardWidth = (widget.availableWidth / 2 - 60) * 0.8;

    if (i % 2 == 0) {
      return Positioned(
        top: top - cardHeight / 2,
        left: widget.availableWidth / 2 + 60,
        child: Animator<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (anim) => Container(
            width: cardWidth * anim.value,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildTileContent('DUPA'),
          ),
        ),
      );
    }

    return Positioned(
      top: top - cardHeight / 2,
      right: widget.availableWidth / 2 + 60,
      child: Animator<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (anim) => Container(
          width: cardWidth * anim.value,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildTileContent('DUPA'),
        ),
      ),
    );
  }

  Widget _buildTileContent(String text) {
    return Column(
      children: <Widget>[
        Text(text),
      ],
    );
  }
}
