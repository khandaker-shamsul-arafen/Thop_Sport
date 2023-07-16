import 'package:flutter/material.dart';

import '../widgets/fixture.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FixtureWidget(),
          FixtureWidget(),
        ],
      ),
    );
  }
}
