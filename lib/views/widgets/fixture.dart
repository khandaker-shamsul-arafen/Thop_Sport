import 'package:firsttest/consts/consts.dart';
import 'package:firsttest/models/team_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_sizes.dart';

class FixtureWidget extends StatefulWidget {
  final Live element;

  const FixtureWidget({super.key, required this.element,});

  @override
  State<FixtureWidget> createState() => _FixtureWidgetState();
}

class _FixtureWidgetState extends State<FixtureWidget> {

  @override
  Widget build(BuildContext context) {
    var title = (widget.element.title.toString()).split('.');
    String title1 = title[0];
    String title2 = title[0];
    String status = widget.element.status.toString();
    String team1Image = widget.element.t1Image.toString();
    String team2Image = widget.element.t2Image.toString();
    String team1Name = widget.element.t1Name.toString();
    String team2Name = widget.element.t2Name.toString();
    String team1Score = widget.element.t1Score.toString();
    String team2Score = widget.element.t2Score.toString();
    String message = widget.element.message.toString();

    return Padding(
      padding: EdgeInsets.all(AppSizes.newSize(1)),
      child: Column(
        children: [
          Container(
            height: AppSizes.newSize(24),
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
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.newSize(1)),
                          child: Center(
                            child: Text(
                              title2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.size14,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffB6585A),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.newSize(1)),
                          child: Center(
                            child: Text(
                              title1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.size16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
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
                    bottom: AppSizes.newSize(2),
                    left: AppSizes.newSize(2),
                    right: AppSizes.newSize(2)),
                child: Row(
                  children: [
                    Container(
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
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(team1Image))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                // Container(
                                //     height: AppSizes.newSize(3),
                                //     width: AppSizes.newSize(3),
                                //     child: Image.network(
                                //       team2Image,
                                //     )),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text(team1Name ?? ""),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text(team1Score),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.newSize(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: AppSizes.newSize(3),
                                  width: AppSizes.newSize(3),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(team2Image))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                // Container(
                                //     height: AppSizes.newSize(3),
                                //     width: AppSizes.newSize(3),
                                //     child: Image.asset(AppAssets.player)),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text(team2Name),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text(team2Score),
                              ],
                            ),
                          ]),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      height: AppSizes.newSize(5),
                      width: AppSizes.newSize(15),
                      child: Center(
                          child: Text(
                            'LIVE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 2,
              ),
              Center(
                child: Text(
                  'DAy 1 Second Season ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
