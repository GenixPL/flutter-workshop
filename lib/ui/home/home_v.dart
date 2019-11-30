import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/home/home_vm.dart';


class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeVM>(
      onModelReady: (model) async {
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title:Text('Home')),
        body: Center(child: Text('Home'),)
      ),
    );
  }
}
