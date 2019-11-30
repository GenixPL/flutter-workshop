import 'package:flutter/material.dart';

class SecondPart extends StatefulWidget {
  @override
  _SecondPartState createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> {
  var _availableHeight;
  var _availableWidth;
  double iconSize = 32;

  @override
  Widget build(BuildContext context) {
    var mainContainerSize = (MediaQuery.of(context).size.height * 0.85) - 16;

    // take text buttons into account
    _availableHeight = mainContainerSize * 0.9;
    _availableWidth = MediaQuery.of(context).size.width - 16;

    return Container(
      color: Colors.yellow, // to remove
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blueAccent, // to remove
              child: Stack(
                children: <Widget>[
                  _buildPlane(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlane() {
    // 16 for FAB padding
    var top = _availableHeight - 16 - iconSize;

    return Positioned(
      top: top,
      left: _availableWidth / 2 - iconSize / 2,
      child: Container(
        width: iconSize,
        height: iconSize,
        color: Colors.amberAccent,
      ),
    );
  }
}
