import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/flights/flights_vm.dart';
import 'package:workshop/ui/flights/main_container.dart';
import 'package:workshop/ui/flights/top_bar.dart';

class FlightsV extends StatelessWidget {
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
                  child: TopBarFlights(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MainContainer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
