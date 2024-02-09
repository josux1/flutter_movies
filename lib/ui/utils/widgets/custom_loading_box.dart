import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingBox extends StatelessWidget {
  const CustomLoadingBox(
      {super.key, this.height = 0.11, this.width = 0.95, this.index = 0});
  final double height;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final padding = size.height * 0.01;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.8),
          loop: 1000000000000000000,
          period: Duration(milliseconds: duration()),
          child: Container(
            height: size.height * height,
            width: size.width * width,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }

  int duration() {
    if (index % 2 == 0) {
      return 1660;
    }
    return 1500;
  }
}
