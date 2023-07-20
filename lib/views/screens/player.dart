import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/score_controller.dart';
import '../widgets/fixture.dart';
import '../widgets/shimmer_fixture_widget.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  ScoreController storeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (storeController.loading.value) {
        return ListView(
          children: [
            ...List.generate(8, (index) => FixtureWidgetShimmer()),
          ],
        );
      } else {
        return ListView(
          children: [
            ...storeController.favouriteList.map((element) => FixtureWidget(
                  element: element,
                )),
          ],
        );
      }
    });
  }
}
