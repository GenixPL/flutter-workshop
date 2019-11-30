import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  final String textBtn1;
  final String textBtn2;
  final String textBtn3;

  MainContainer({
    @required this.child,
    @required this.textBtn1,
    @required this.textBtn2,
    @required this.textBtn3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: (MediaQuery.of(context).size.height * 0.85) - 16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _button(context, textBtn1, true),
                      _button(context, textBtn2, false),
                      _button(context, textBtn3, false),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 90,
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context, String text, bool isActive) {
    return Container(
      width: (MediaQuery.of(context).size.width - 16) / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.grey[600] : Colors.grey,
            ),
          ),
          Spacer(),
          Container(
            height: 4,
            color: isActive ? Colors.redAccent : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
