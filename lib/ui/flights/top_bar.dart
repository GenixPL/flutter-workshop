import 'package:flutter/material.dart';

class TopBarFlights extends StatelessWidget {
  final bool areButtonsHidden;

  TopBarFlights({
    this.areButtonsHidden = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.redAccent,
            Colors.redAccent[100],
          ],
        ),
      ),
      child: (areButtonsHidden)
          ? _buildWothoutButtons(context)
          : _buildWithButtons(context),
    );
  }

  Widget _buildWithButtons(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: <Widget>[
          Text(
            'AirAsia',
            style: TextStyle(
              fontFamily: 'Yellowtail',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: 16),
              Expanded(
                child: _buildEmptyButton('ONE WAY'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildEmptyButton('ROUND'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildFilledButton('MULTICITY'),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWothoutButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'AirAsia',
                  style: TextStyle(
                    fontFamily: 'Yellowtail',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyButton(String text) {
    return OutlineButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }

  Widget _buildFilledButton(String text) {
    return RaisedButton(
      onPressed: () {},
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.redAccent,
        ),
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
