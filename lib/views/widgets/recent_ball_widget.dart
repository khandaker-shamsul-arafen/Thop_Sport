import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class RecentBAll extends StatelessWidget {
  final dynamic e;
  RecentBAll(this.e, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.newSize(12),
      width: AppSizes.newSize(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.3))),
      child: Text(e.toString()),
    );
  }
}
