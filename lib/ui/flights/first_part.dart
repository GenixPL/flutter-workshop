import 'package:flutter/material.dart';

class FirstPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow, // to remove
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.redAccent, // to remove
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.lightBlue, // to remove
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              color: Colors.amber,
                              child: Column(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.amberAccent,
                              child: Column(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue, // to remove
                      child: Row(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blueAccent, // to remove
                      child: Row(),
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

  Widget _buildRowWithIconAndText(
    IconData iconData,
    String label,
    String content,
  ) {}
}
