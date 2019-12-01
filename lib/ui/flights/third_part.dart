import 'dart:math';

import 'package:flutter/material.dart';

class ThirdPart extends StatefulWidget {
  @override
  _ThirdPartState createState() => _ThirdPartState();
}

class _ThirdPartState extends State<ThirdPart> with TickerProviderStateMixin {
  AnimationController _fabController;
  Animation _fabAnimation;
  List<Widget> tickets = List();
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  initState() {
    super.initState();

    _fabController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _fabAnimation = Tween(
      begin: pi * 0.25,
      end: 0.0,
    ).animate(_fabController);

    Future.delayed(Duration(milliseconds: 200)).then((_) {
      _listKey.currentState.insertItem(0);
      Future.delayed(Duration(milliseconds: 200)).then((_) {
        _listKey.currentState.insertItem(1);
        Future.delayed(Duration(milliseconds: 200)).then((_) {
          _listKey.currentState.insertItem(2);
          Future.delayed(Duration(milliseconds: 200)).then((_) {
            _listKey.currentState.insertItem(3);
          });
        });
      });
    });
  }

  @override
  dispose() {
    _fabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tickets = List();
    tickets
        .add(_buildTicket(context, 'Sahara', 'SHE', 'SE2341', 'Macao', 'MAC'));
    tickets.add(
        _buildTicket(context, 'Macao', 'MAC', 'KU2342', 'Cape Verde', 'CAP'));
    tickets.add(
        _buildTicket(context, 'Cape Vrde', 'CAP', 'KR3452', 'Ireland', 'IRE'));
    tickets.add(
        _buildTicket(context, 'Ireland', 'IRE', 'MR4321', 'Sahara', 'SHE'));

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: _buildList(),
            ),
            _buildFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return AnimatedList(
      key: _listKey,
      itemBuilder: (context, i, animation) => SlideTransition(
        child: tickets[i],
        position: animation.drive(Tween(
          begin: Offset(0, 10),
          end: Offset.zero,
        )),
      ),
    );
  }

  Widget _buildTicket(
    BuildContext context,
    String text1,
    String text2,
    String text3,
    String text4,
    String text5,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      child: ClipPath(
        clipper: TicketClipper(5),
        child: Material(
          elevation: 4.0,
          shadowColor: Color(0x30E5E5E5),
          color: Colors.transparent,
          child: ClipPath(
            clipper: TicketClipper(10),
            child: Card(
              elevation: 0.0,
              margin: const EdgeInsets.all(2.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          text1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.flight,
                          color: Colors.redAccent,
                        ),
                        Text(text3),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          text4,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          text5,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          child: AnimatedBuilder(
            animation: _fabAnimation,
            child: Icon(
              Icons.fingerprint,
              color: Colors.white,
            ),
            builder: (context, child) => Transform.rotate(
              angle: _fabAnimation.value,
              child: child,
            ),
          ),
          onPressed: () => _fabController.forward(),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double radius;

  TicketClipper(this.radius);

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
