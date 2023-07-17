import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../models/match_details_response.dart';

class ComentryWidget extends StatelessWidget {
  final Commentry e;
  const ComentryWidget(this.e, {super.key});

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
                  e.over.toString(),
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: AppSizes.size15,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              width: AppSizes.newSize(.5),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.size16,
                      color: Colors.white),
                ))
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.2),
          thickness: 1,
        )
      ],
    );
  }
}
