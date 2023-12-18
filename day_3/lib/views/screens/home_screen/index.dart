import 'package:flutter/material.dart';
import 'package:day_3/views/layouts/master.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenContent: SafeArea(
          child:
              Container(padding: EdgeInsets.all(20), child: Text('home Page'))),
      screenTitle: 'Home',
      screenFotter: true,
    );
  }
}
