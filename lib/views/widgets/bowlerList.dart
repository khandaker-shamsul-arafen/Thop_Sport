import 'package:firsttest/consts/app_sizes.dart';
import 'package:firsttest/models/match_details_response.dart';
import 'package:flutter/material.dart';

class BowlerWidget extends StatelessWidget {
  Bowler element;
  BowlerWidget(this.element, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: AppSizes.newSize(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.newSize(1),
                  ),
                  child: Text(
                    element.bowler.toString(),
                    style: TextStyle(
                        fontSize: AppSizes.size15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.4),
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              )),
          SizedBox(
            width: AppSizes.newSize(.4),
          ),
          Expanded(
              flex: 1,
              child: Text(
                element.o.toString(),
                style: TextStyle(
                    fontSize: AppSizes.size15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6)),
              )),
          Expanded(
              flex: 1,
              child: Text(
                element.m.toString(),
                style: TextStyle(
                    fontSize: AppSizes.size15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6)),
              )),
          Expanded(
              flex: 1,
              child: Text(
                element.r.toString(),
                style: TextStyle(
                    fontSize: AppSizes.size15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6)),
              )),
          Expanded(
              flex: 1,
              child: Text(
                element.w.toString(),
                style: TextStyle(
                    fontSize: AppSizes.size15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6)),
              )),
          Expanded(
              flex: 1,
              child: Text(
                element.eCO.toString(),
                style: TextStyle(
                    fontSize: AppSizes.size15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6)),
              )),
        ],
      ),
    );
  }
}
