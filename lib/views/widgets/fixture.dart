import 'dart:convert';

import 'package:firsttest/consts/consts.dart';
import 'package:firsttest/models/team_response.dart';
import 'package:firsttest/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/app_sizes.dart';
import '../../controllers/score_controller.dart';

class FixtureWidget extends StatefulWidget {
  final Live element;

  const FixtureWidget({
    super.key,
    required this.element,
  });

  @override
  State<FixtureWidget> createState() => _FixtureWidgetState();
}

class _FixtureWidgetState extends State<FixtureWidget> {
  ScoreController storeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var title = (widget.element.title.toString()).split("•");
    String title1 = title[0];
    String title2 = title[1];
    String status = widget.element.status.toString();
    String team1Image = widget.element.t1Image.toString();
    String team2Image = widget.element.t2Image.toString();
    String team1Name = widget.element.t1Name.toString();
    String team2Name = widget.element.t2Name.toString();
    String team1Score = widget.element.t1Score.toString();
    String team2Score = widget.element.t2Score.toString();
    String message = widget.element.message.toString();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.newSize(1), vertical: AppSizes.newSize(.5)),
      child: Column(
        children: [
          Container(
            //height: AppSizes.newSize(21),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: AppSizes.newSize(2),
                    bottom: AppSizes.newSize(0),
                    left: AppSizes.newSize(2),
                    right: AppSizes.newSize(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(1),
                        ),
                        child: Text(
                          title2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppSizes.size15,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffB6585A),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.newSize(.5),
                            vertical: AppSizes.newSize(.2)),
                        child: Center(
                          child: Text(
                            title1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppSizes.size14,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppSizes.newSize(1),
                    bottom: AppSizes.newSize(1.5),
                    left: AppSizes.newSize(2),
                    right: AppSizes.newSize(2)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(3),
                                  decoration: BoxDecoration(
                                      // color: Colors.blue,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(team1Image))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1.5),
                                ),
                                Flexible(
                                  child: Text(
                                    "$team1Name  $team1Score",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppSizes.size16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.newSize(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(3),
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(team2Image))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1.2),
                                ),
                                Flexible(
                                  child: Text(
                                    "$team2Name  $team2Score",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppSizes.size16),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: AppSizes.newSize(1),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        height: AppSizes.newSize(5),
                        width: AppSizes.newSize(15),
                        child: Center(
                            child: Text(
                          status,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: (status.toLowerCase() == 'complete')
                                  ? Colors.blue
                                  : (status.toLowerCase() == 'live')
                                      ? Colors.red
                                      : Colors.green,
                              fontSize: AppSizes.size16),
                        )),
                      ),
                    ),
                    Obx(() {
                      bool selected = storeController.favouriteList
                          .contains(widget.element);
                      return Container(
                          width: AppSizes.newSize(6),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: (selected)
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  ),
                            onPressed: () async {
                              if (selected) {
                                storeController.favouriteList
                                    .remove(widget.element);
                              } else {
                                storeController.favouriteList
                                    .add(widget.element);
                              }
                              String jsonString =
                                  jsonEncode(storeController.favouriteList);
                              await writeStorage('fixture', jsonString);

                              print(selected);
                            },
                          ));
                    })
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 2,
              ),
              Center(
                child: Text(
                  message,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: AppSizes.size16,
                    color: (status.toLowerCase() == 'complete')
                        ? Colors.white
                        : (status.toLowerCase() == 'live')
                            ? Colors.black
                            : Colors.amber,
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
