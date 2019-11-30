import 'package:flutter/material.dart';
import 'package:workshop/enums/events.dart';
import 'package:workshop/ui/tickets/cards/sliding_card.dart';

class SlidingCardsV extends StatefulWidget {
  @override
  _SlidingCardsVState createState() => _SlidingCardsVState();
}

// TODO sliding doesn't work after 2. card

class _SlidingCardsVState extends State<SlidingCardsV> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: PageView(
        controller: pageController,
        children: <Widget>[
            SlidingCard(
              name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
              date: events[0].date,
              assetName: events[0].assetName,
              offset: pageOffset,
            ),
            SlidingCard(
              name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
              date: events[0].date,
              assetName: events[0].assetName,
              offset: pageOffset,
            ),
            SlidingCard(
              name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
              date: events[2].date,
              assetName: events[2].assetName,
              offset: pageOffset,
            ),
        ],
      ),
    );
  }
}
