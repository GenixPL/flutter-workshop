import 'package:flutter/material.dart';

class ThirdPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  // Padding(
  //                     padding: const EdgeInsets.only(bottom: 16),
  //                     child: Align(
  //                       alignment: Alignment.bottomCenter,
  //                       child: FloatingActionButton(
  //                         elevation: 0,
  //                         backgroundColor: Colors.redAccent,
  //                         child: AnimatedBuilder(
  //                           animation: _fabAnimation,
  //                           child: Icon(
  //                             Icons.fingerprint,
  //                             color: Colors.white,
  //                           ),
  //                           builder: (context, child) => Transform.rotate(
  //                             angle: _fabAnimation.value,
  //                             child: child,
  //                           ),
  //                         ),
  //                         onPressed: () => _fabController.forward(),
  //                       ),
  //                     ),
  //                   ),
}
