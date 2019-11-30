import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/tickets/bottom/bottom_bar.dart';
import 'package:workshop/ui/tickets/cards/sliding_cards_v.dart';
import 'package:workshop/ui/tickets/tickets_vm.dart';
import 'package:workshop/ui/tickets/top/top_bar.dart';

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
    return Stack(
      children: [
        TopBar(),
        Align(
          alignment: Alignment.center,
          child: SlidingCardsV(),
        ),
        BottomBar(),
      ],
    );
  }
}
