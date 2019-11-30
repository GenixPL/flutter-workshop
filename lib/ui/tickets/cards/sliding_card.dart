import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:workshop/ui/tickets/cards/card_content.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;
  final bool swipesLeft;
  final int index;

  const SlidingCard({
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
    @required this.swipesLeft,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() % 1 - 0.5), 2) / 0.08));
    double xAlign = (offset.abs() - index);

    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                assetName,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(xAlign, 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
