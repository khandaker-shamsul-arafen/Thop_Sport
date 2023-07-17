import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/score_controller.dart';
import '../widgets/fixture.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  ScoreController scoreController = Get.put(ScoreController());

  void initState() {
    super.initState();
    scoreController.teamScheudle();
    // scoreController.matchDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (scoreController.loading.value) {
        return Center(child: const CircularProgressIndicator());
      } else {
        return ListView(
          children: [
            ...scoreController.teamResponseList.map((element) => FixtureWidget(
                  element: element,
                )),
          ],
        );
      }
    });
  }
}
