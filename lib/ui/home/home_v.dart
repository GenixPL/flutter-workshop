import 'package:flutter/material.dart';
import 'package:workshop/enums/routes.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/home/home_vm.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeVM>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Home')),
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
            RaisedButton(
              color: Colors.amber,
              child: Text('Tickets'),
              onPressed: () => Navigator.pushNamed(context, ticketsRoute),
            ),
          ],
        ),
      ],
    );
  }
}
