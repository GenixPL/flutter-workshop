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
              color: Colors.white, // to remove
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.white, // to remove
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              color: Colors.white, // to remove
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
                              color: Colors.white, // to remove
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Container(),
                                  ),
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white, // to remove
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildDoubleRow(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white, // to remove
                      child: _buildFab(),
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
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Icon(
            iconData,
            color: Colors.redAccent,
          ),
        ),
        Expanded(
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

  Widget _buildDoubleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Icon(
            Icons.date_range,
            color: Colors.redAccent,
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: '29 June 2017'),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Departure',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '29 July 2017', // wtf - monthly flight?
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Departure',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.timeline),
          ),
        ),
      ],
    );
  }
}
