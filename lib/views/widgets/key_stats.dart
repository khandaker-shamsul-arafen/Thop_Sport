import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../models/match_details_response.dart';

class KeyStats extends StatelessWidget {
  final Keystats e;
  const KeyStats(this.e, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  e.key.toString(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: AppSizes.size15,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              width: AppSizes.newSize(2),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
                ))
          ],
        ),
        SizedBox(
          height: AppSizes.newSize(1),
        )
      ],
    );
  }
}
