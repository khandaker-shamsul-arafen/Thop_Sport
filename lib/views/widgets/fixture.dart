import 'package:firsttest/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_sizes.dart';

class FixtureWidget extends StatefulWidget {
  const FixtureWidget({super.key});

  @override
  State<FixtureWidget> createState() => _FixtureWidgetState();
}

class _FixtureWidgetState extends State<FixtureWidget> {
  @override
  Widget build(BuildContext context) {
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
                    bottom: AppSizes.newSize(1),
                    left: AppSizes.newSize(2),
                    right: AppSizes.newSize(2)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Pakistan tour of Sri Lanka, 2023 Test',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.size14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffB6585A),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.newSize(1)),
                          child: Text(
                            '1st Test',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppSizes.size16,
                                fontWeight: FontWeight.bold),
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
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(AppAssets.home))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Container(
                                    height: AppSizes.newSize(3),
                                    width: AppSizes.newSize(3),
                                    child: Image.asset(
                                      AppAssets.player,
                                    )),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text("data"),
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
                                          image: AssetImage(AppAssets.home))),
                                ),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Container(
                                    height: AppSizes.newSize(3),
                                    width: AppSizes.newSize(3),
                                    child: Image.asset(AppAssets.player)),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text("data"),
                                SizedBox(
                                  width: AppSizes.newSize(1),
                                ),
                                Text('136-4'),
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
          SizedBox(
            height: AppSizes.newSize(2),
          )
        ],
      ),
    );
  }
}
