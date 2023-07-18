import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/score_controller.dart';
import '../widgets/fixture.dart';
import 'match_details.dart';

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
  }

  void dispose() {
    scoreController.interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (scoreController.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView(
          children: [
            ...scoreController.teamResponseList
                .map((element) => GestureDetector(
                      onTap: () {
                        if (element.status.toString().toLowerCase() == 'live' ||
                            element.status.toString().toLowerCase() ==
                                'stumps') {
                          scoreController.matchDetails(element.link.toString());
                          Get.to(() => MatchDetails(element.link.toString()));
                        } else {
                          null;
                        }
                      },
                      child: FixtureWidget(
                        element: element,
                      ),
                    )),
          ],
        );
      }
    });
  }
}
