import 'package:flutter/material.dart';
import 'package:workshop/enums/events.dart';
import 'package:workshop/ui/tickets/cards/sliding_card.dart';

class SlidingCardsV extends StatefulWidget {
  @override
  _SlidingCardsVState createState() => _SlidingCardsVState();
}

// TODO add chaning spacing between cards
// TODO left right

class _SlidingCardsVState extends State<SlidingCardsV> {
  PageController pageController;
  double previousOffset = 0;
  double pageOffset = 0;
  bool swipesLeft = true;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        previousOffset = pageOffset;
        pageOffset = pageController.page;

        if (previousOffset < pageOffset) {
          swipesLeft = true;
        } else {
          swipesLeft = false;
        }
      });
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
            swipesLeft: swipesLeft,
          ),
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: events[0].date,
            assetName: events[0].assetName,
            offset: pageOffset,
            swipesLeft: swipesLeft,
          ),
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: events[2].date,
            assetName: events[2].assetName,
            offset: pageOffset,
            swipesLeft: swipesLeft,
          ),
        ],
      ),
    );
  }
}
