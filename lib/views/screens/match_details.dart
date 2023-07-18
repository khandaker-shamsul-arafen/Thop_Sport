import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../consts/app_assets.dart';
import '../../consts/consts.dart';
import '../../controllers/score_controller.dart';
import '../widgets/batter_bowler_widget.dart';
import '../widgets/bowlerList.dart';
import '../widgets/comentry_widget.dart';
import '../widgets/key_stats.dart';
import '../widgets/recent_ball_widget.dart';

class MatchDetails extends StatefulWidget {
  final String link;
  MatchDetails(this.link, {super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  ScoreController scoreController = Get.find();
  void initState() {
    super.initState();
    scoreController.loadAd();
    scoreController.loadAdins();
    scoreController.interstitialAd?.show();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return RefreshIndicator(
      onRefresh: () async {
        scoreController.matchDetails(widget.link);
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.background))),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Obx(
            () {
              if (scoreController.matchLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppSizes.newSize(4),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.keyboard_arrow_left,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(15),
                                ),
                                Text(
                                  "LIVE SCORE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: AppSizes.size16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.newSize(7),
                            ),
                            Padding(
                              padding: EdgeInsets.all(AppSizes.newSize(1)),
                              child: Row(
                                children: [
                                  Text(
                                    scoreController.matchResponseModel.value
                                            .match?.t1name?.name
                                            .toString() ??
                                        "",
                                    style: TextStyle(
                                        fontSize: AppSizes.size18,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(5)),
                                    height: AppSizes.newSize(3.2),
                                    width: AppSizes.newSize(8),
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppSizes.newSize(.5),
                                              vertical: AppSizes.newSize(.3)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppAssets.live))),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppSizes.newSize(2),
                                  left: AppSizes.newSize(1)),
                              child: Text(
                                scoreController.matchResponseModel.value.match
                                        ?.t2name?.name
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: AppSizes.size18,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.newSize(.7),
                    ),
                    //Day 2 First Season
                    Expanded(
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          Obx(
                            () => Container(
                              width: AppSizes.newSize(44),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSizes.newSize(1)),
                                child: Center(
                                  child: Text(
                                    scoreController.matchResponseModel.value
                                            .match?.node
                                            .toString() ??
                                        '',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: AppSizes.size15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.newSize(.7),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.newSize(1)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.4))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSizes.newSize(2)),
                                child: Column(
                                  children: [
                                    Obx(
                                      () => Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppSizes.newSize(1),
                                                      ),
                                                      child: Text(
                                                        "BATTER",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.4)),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "R",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "B",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "4S",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "6S",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "SR",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppSizes.newSize(1),
                                            ),
                                            ...scoreController
                                                .batterDetailsResponseList
                                                .map((element) =>
                                                    BatterAndBowlerWidget(
                                                        element))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "BOWLER",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.4)),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "O",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6)),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "M",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6)),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "R",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6)),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "W",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6)),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "ECO",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AppSizes.size15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6)),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSizes.newSize(1),
                                            ),
                                            ...scoreController
                                                .bowlerDetailsResponseList
                                                .map((element) =>
                                                    BowlerWidget(element))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.newSize(.7),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.newSize(1), vertical: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.4))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes.newSize(2)),
                                    child: Text(
                                      'LAST 8 BALLS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AppSizes.size16,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ),
                                  // Obx(() {
                                  //   return
                                  // })
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ...scoreController.lastEightBall
                                          .map(
                                            (e) => Container(
                                              height: AppSizes.newSize(10),
                                              width: AppSizes.newSize(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.white
                                                          .withOpacity(0.3))),
                                              child: Center(
                                                child: Text(
                                                  e.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: AppSizes.size14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          )
                                          .take(8)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.newSize(1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.newSize(1)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.4))),
                              child: Column(children: [
                                SizedBox(
                                  height: AppSizes.newSize(1),
                                ),
                                Text(
                                  "KEY STATS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizes.size15),
                                ),
                                Obx(() => Padding(
                                      padding:
                                          EdgeInsets.all(AppSizes.newSize(1)),
                                      child: Column(
                                        children: [
                                          ...scoreController.kStateResponseList
                                              .map((element) =>
                                                  KeyStats(element))
                                        ],
                                      ),
                                    ))
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.newSize(1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.newSize(1)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.4))),
                              child: Column(children: [
                                SizedBox(
                                  height: AppSizes.newSize(1),
                                ),
                                Text(
                                  "BALL BY BALL COMMERY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizes.size15),
                                ),
                                SizedBox(
                                  height: AppSizes.newSize(1),
                                ),
                                Obx(
                                  () => Padding(
                                    padding:
                                        EdgeInsets.all(AppSizes.newSize(1)),
                                    child: Column(
                                      children: [
                                        ...scoreController.comentryResponseList
                                            .map((element) =>
                                                ComentryWidget(element))
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          bottomNavigationBar: SizedBox(
              width: scoreController.bannerAd!.size.width.toDouble(),
              height: scoreController.bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: scoreController.bannerAd!)),
        ),
      ),
    );
  }
}
