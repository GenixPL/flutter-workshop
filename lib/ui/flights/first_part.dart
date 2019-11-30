import 'package:flutter/material.dart';

final textFromFull = 'Kochfurt';
final textTo1Full = 'Lake XanderLand';
final textTo2Full = 'South Darian';
final textPassengersFull = '4';
final textDepartureFull = '29 June 2017';
final textArrivalFull = '29 July 2017';

final int textLength = textFromFull.length +
    textTo1Full.length +
    textTo2Full.length +
    textPassengersFull.length +
    textDepartureFull.length +
    textArrivalFull.length;

class FirstPart extends StatefulWidget {
  @override
  _FirstPartState createState() => _FirstPartState();
}

class _FirstPartState extends State<FirstPart>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  var textFrom = '';
  var textTo1 = '';
  var textTo2 = '';
  var textPassengers = '';
  var textDeparture = '';
  var textArrival = '';

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = IntTween(
      begin: 0,
      end: textLength,
    ).animate(_animationController);

    _animation.addListener(_animationListener);

    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    _animation.removeListener(_animationListener);

    super.dispose();
  }

  _animationListener() {
    setState(() {
      int i = _animation.value;

      // don't read it ot you gonna have nightmares
      if (i <= textFromFull.length) {
        textFrom = textFromFull.substring(0, i);
      } else if (i > textFromFull.length &&
          i <= textFromFull.length + textTo1Full.length) {
        i = i - textFromFull.length;
        textFrom = textFromFull;
        textTo1 = textTo1Full.substring(0, i);
      } else if (i > textFromFull.length + textTo1Full.length &&
          i <= textFromFull.length + textTo1Full.length + textTo2Full.length) {
        i = i - textFromFull.length - textTo1Full.length;
        textFrom = textFromFull;
        textTo1 = textTo1Full;
        textTo2 = textTo2Full.substring(0, i);
      } else if (i >
              textFromFull.length + textTo1Full.length + textTo2Full.length &&
          i <=
              textFromFull.length +
                  textTo1Full.length +
                  textTo2Full.length +
                  textPassengersFull.length) {
        i = i -
            textFromFull.length -
            textTo1Full.length -
            textPassengersFull.length;

        textFrom = textFromFull;
        textTo1 = textTo1Full;
        textTo2 = textTo2Full;
        textPassengers = textPassengersFull.substring(0, i);
      } else if (i >
              textFromFull.length +
                  textTo1Full.length +
                  textTo2Full.length +
                  textPassengersFull.length &&
          i <=
              textFromFull.length +
                  textTo1Full.length +
                  textTo2Full.length +
                  textPassengersFull.length +
                  textDepartureFull.length) {
        i = i -
            textFromFull.length -
            textTo1Full.length -
            textPassengersFull.length -
            textDepartureFull.length;

        textFrom = textFromFull;
        textTo1 = textTo1Full;
        textTo2 = textTo2Full;
        textPassengers = textPassengersFull;
        textDeparture = textDepartureFull.substring(0, i);
      } else if (i >
              textFromFull.length +
                  textTo1Full.length +
                  textTo2Full.length +
                  textPassengersFull.length +
                  textDepartureFull.length &&
          i <=
              textFromFull.length +
                  textTo1Full.length +
                  textTo2Full.length +
                  textPassengersFull.length +
                  textDepartureFull.length +
                  textArrivalFull.length) {
        i = i -
            textFromFull.length -
            textTo1Full.length -
            textPassengersFull.length -
            textDepartureFull.length -
            textArrivalFull.length;

        textFrom = textFromFull;
        textTo1 = textTo1Full;
        textTo2 = textTo2Full;
        textPassengers = textPassengersFull;
        textDeparture = textDepartureFull;
        textArrival = textArrivalFull.substring(0, i);
      }
    });
  }

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
                  _buildUpperPart(),
                  _buildMiddlePart(),
                  _buildLowerPart(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpperPart() {
    return Expanded(
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
                        textFrom,
                      ),
                    ),
                    Expanded(
                      child: _buildRowWithIconAndText(
                        Icons.flight_land,
                        'To',
                        textTo1,
                      ),
                    ),
                    Expanded(
                      child: _buildRowWithIconAndText(
                        Icons.flight_land,
                        'To',
                        textTo2,
                      ),
                    ),
                    Expanded(
                      child: _buildRowWithIconAndText(
                        Icons.person,
                        'Passengers',
                        textPassengers,
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
    );
  }

  Widget _buildMiddlePart() {
    return Expanded(
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
    );
  }

  Widget _buildLowerPart() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white, // to remove
        child: _buildFab(),
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
                    TextEditingValue(text: textDeparture),
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
                      text: textArrival, // wtf - monthly flight?
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Arrival',
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
