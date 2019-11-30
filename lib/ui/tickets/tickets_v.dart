import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/tickets/bottom/bottom_bart.dart';
import 'package:workshop/ui/tickets/cards/sliding_cards_v.dart';
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
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SlidingCardsV(),
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
