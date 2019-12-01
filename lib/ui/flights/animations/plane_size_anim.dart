import 'package:flutter/material.dart';

class PlaneSizeAnim extends StatefulWidget {
  final double iconSize;
  final AnimationController planeSizeController;

  PlaneSizeAnim({
    @required this.iconSize,
    @required this.planeSizeController,
  });

  @override
  _PlaneSizeAnimState createState() => _PlaneSizeAnimState();
}

class _PlaneSizeAnimState extends State<PlaneSizeAnim>
    with TickerProviderStateMixin {
  Animation _planeSizeAnimation;

  @override
  initState() {
    super.initState();

    _planeSizeAnimation = Tween(
      begin: 2.0,
      end: 1.0,
    ).animate(widget.planeSizeController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _planeSizeAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 1), // why isn't it symmetical
        child: Icon(
          Icons.airplanemode_active,
          size: widget.iconSize,
          color: Colors.redAccent,
        ),
      ),
      builder: (context, child) => Transform.scale(
        child: child,
        scale: _planeSizeAnimation.value,
      ),
    );
  }
}
