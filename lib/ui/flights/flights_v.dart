import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/flights/flights_vm.dart';

class FlightsV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FlightsVM>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Flights')),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ],
    );
  }
}
