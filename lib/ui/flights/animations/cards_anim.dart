import 'dart:math';

import 'package:animator/animator.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
            color: Colors.grey[200],
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
          color: Colors.grey[200],
        ),
      ),
    );
  }

  // TODO: possible better transformation
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
          duration: Duration(milliseconds: 200),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (anim) => Container(
            width: cardWidth * anim.value,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: (i == 1)
              ? _buildTileContent(
                  'JFK-ORY',
                  '6h25m',
                  'JUN )%',
                  '\$851',
                  '9:26am-3:43pm',
                )
              : _buildTileContent(
                  'ERT-TVS',
                  '6h25m',
                  'JUN 20',
                  '\$718',
                  '9:26am-3:43pm',
                ),
          ),
        ),
      );
    }

    return Positioned(
      top: top - cardHeight / 2,
      right: widget.availableWidth / 2 + 60,
      child: Animator<double>(
        duration: Duration(milliseconds: 200),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (anim) => Container(
          width: cardWidth * anim.value,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: (i == 1)
              ? _buildTileContent(
                  'MRG-FTB',
                  '6h25m',
                  'JUN 20',
                  '\$532',
                  '9:26am-3:43pm',
                )
              : _buildTileContent(
                  'KKR-RTY',
                  '6h25m',
                  'JUN 20',
                  '\$663',
                  '9:26am-3:43pm',
                ),
        ),
      ),
    );
  }

  Widget _buildTileContent(
    String text1,
    String text2,
    String text3,
    String text4,
    String text5,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: Text(
                    text1,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 4,
                  child: Text(
                    text2,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: AutoSizeText(
                    text3,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 4,
                  child: AutoSizeText(
                    text4,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: AutoSizeText(
                    text5,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 6,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
