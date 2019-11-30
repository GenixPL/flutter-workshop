import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:workshop/navigation/router.dart';
import 'package:workshop/utils/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = locator<Router>();

  get initRoute => null;

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      initialRoute: initRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      navigatorObservers: [router],
      theme: theme,
    );
  }
}

ThemeData theme = ThemeData(
  primaryColor: Colors.grey[850],
  accentColor: Colors.amber,
);
