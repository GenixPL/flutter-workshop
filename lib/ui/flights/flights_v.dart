import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/flights/first_part.dart';
import 'package:workshop/ui/flights/flights_vm.dart';
import 'package:workshop/ui/flights/main_container.dart';
import 'package:workshop/ui/flights/second_part.dart';
import 'package:workshop/ui/flights/third_part.dart';
import 'package:workshop/ui/flights/top_bar.dart';

class FlightsV extends StatefulWidget {
  @override
  _FlightsVState createState() => _FlightsVState();
}

class _FlightsVState extends State<FlightsV> {
  int _stage = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<FlightsVM>(
      builder: (context, model, child) => Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: TopBarFlights(
                    areButtonsHidden: (_stage == 2),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _getContentForStage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContentForStage() {
    if (_stage == 0) {
      return MainContainer(
        child: FirstPart(
          onFabTap: () {
            setState(() {
              _stage = 1;
            });
          },
        ),
        textBtn1: 'Flight',
        textBtn2: 'Train',
        textBtn3: 'Bus',
      );
    } else if (_stage == 1) {
      return MainContainer(
        child: SecondPart(
          mainContainerSize: (MediaQuery.of(context).size.height * 0.85) - 16,
          availableHeight:
              ((MediaQuery.of(context).size.height * 0.85) - 16) * 0.9,
          availableWidth: MediaQuery.of(context).size.width - 16,
          onFabTap: () {
            setState(() {
              _stage = 2;
            });
          },
        ),
        textBtn1: 'Price',
        textBtn2: 'Duration',
        textBtn3: 'Stops',
      );
    } else if (_stage == 2) {
      return ThirdPart();
    }

    return Text('ERROR');
  }
}
