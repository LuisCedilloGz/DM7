import 'package:flutter/material.dart';
import 'package:planets2/components/gradient_app_bar.dart';
import 'package:planets2/components/planet_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(),
          PlanetList()
        ],
      ),
    );
  }
}
