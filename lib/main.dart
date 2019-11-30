import 'package:flutter/material.dart';
import 'package:workshop/ui/home/home_v.dart';
import 'package:workshop/ui/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeV(),
    );
  }
}

