import 'package:flutter/material.dart';
import 'package:workshop/ui/base/base_view.dart';
import 'package:workshop/ui/home/home_vm.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeVM>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text('Home'),
    );
  }
}
