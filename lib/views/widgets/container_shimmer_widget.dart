import 'package:flutter/material.dart';

class ContainerShimmer extends StatelessWidget {
  final double height;
  final double width;

  const ContainerShimmer(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
    );
  }
}
