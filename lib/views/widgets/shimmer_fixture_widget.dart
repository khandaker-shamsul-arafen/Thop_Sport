import 'package:firsttest/consts/consts.dart';
import 'package:firsttest/models/team_response.dart';
import 'package:firsttest/views/widgets/container_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/app_sizes.dart';

class FixtureWidgetShimmer extends StatefulWidget {
  const FixtureWidgetShimmer({
    super.key,
  });

  @override
  State<FixtureWidgetShimmer> createState() => _FixtureWidgetShimmerState();
}

class _FixtureWidgetShimmerState extends State<FixtureWidgetShimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.newSize(1), vertical: AppSizes.newSize(.5)),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(1),
                        ),
                        child: ContainerShimmer(
                          height: AppSizes.newSize(2.2),
                          width: AppSizes.newSize(24),
                        ),
                      ),
                      Spacer(),
                      ContainerShimmer(
                        height: AppSizes.newSize(3),
                        width: AppSizes.newSize(10),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(5),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(.6),
                                ),
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(10),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(.6),
                                ),
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(5),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.newSize(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(5),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(.6),
                                ),
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(10),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(.6),
                                ),
                                ContainerShimmer(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(5),
                                ),
                              ],
                            ),
                          ]),
                      Spacer(),
                      ContainerShimmer(
                        height: AppSizes.newSize(5),
                        width: AppSizes.newSize(13),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppSizes.newSize(.6)),
                    child: ContainerShimmer(
                      height: AppSizes.newSize(3),
                      width: AppSizes.newSize(33),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
