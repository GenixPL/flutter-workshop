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

    return Positioned(
      top: 8,
      left: 0,
      child: Container(
        width: widget.availableWidth,
        height: maxHeight,
        child: Stack(
          children: <Widget>[
            for (int i = 0; i < 4; i++) _buildDot(i, maxHeight),
          ],
        ),
      ),
    );
  }

  _buildDot(int i, double maxHeight) {
    if (_animation.value < 50 * i + 50) {
      return Container();
    }

    double spacing = maxHeight * 0.65 / 3;

    return Positioned(
      top: maxHeight - 20 - i * spacing,
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
}
