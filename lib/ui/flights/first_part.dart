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
                              color: Colors.amber, // to remove
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: _buildRowWithIconAndText(
                                      Icons.flight_takeoff,
                                      'From',
                                      'Kochfurt',
                                    ),
                                  ),
                                  Expanded(
                                    child: _buildRowWithIconAndText(
                                      Icons.flight_land,
                                      'To',
                                      'Lake XanderLand',
                                    ),
                                  ),
                                  Expanded(
                                    child: _buildRowWithIconAndText(
                                      Icons.flight_land,
                                      'To',
                                      'South Darian',
                                    ),
                                  ),
                                  Expanded(
                                    child: _buildRowWithIconAndText(
                                      Icons.person,
                                      'Passengers',
                                      '4',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.amberAccent, // to remove
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
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Icon(
            iconData,
            color: Colors.redAccent,
          ),
        ),
        Expanded(
          flex: 7,
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(text: content),
            ),
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
        ),
      ],
    );
  }
}
