import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/tickets/bottom_bart.dart';
import 'package:workshop/ui/tickets/tickets_vm.dart';

class TicketsV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TicketsVM>(
      builder: (context, model, child) => Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text('BODY'),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
