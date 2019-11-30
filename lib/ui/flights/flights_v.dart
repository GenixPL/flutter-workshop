import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/flights/flights_vm.dart';
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
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: TopBarFlights(),
        ),
      ],
    );
  }
}
