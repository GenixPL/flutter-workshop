import 'dart:math';

import 'package:flutter/material.dart';

class ThirdPart extends StatefulWidget {
  @override
  _ThirdPartState createState() => _ThirdPartState();
}

class _ThirdPartState extends State<ThirdPart> with TickerProviderStateMixin {
  AnimationController _fabController;
  Animation _fabAnimation;

  @override
  initState() {
    super.initState();

    _fabController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _fabAnimation = Tween(
      begin: pi * 0.25,
      end: 0.0,
    ).animate(_fabController);
  }

  @override
  dispose() {
    _fabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildList()),
            _buildFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('A'),
        Text('A'),
        Text('A'),
        Text('A'),
      ],
    );
  }

  Widget _buildFab() {
    return Padding(
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
    );
  }
}
