import 'package:flutter/material.dart';
import '../shared/color.dart';

class Loading extends StatelessWidget {
  final double? height;
  final double? width;
  final bool barrier;
  final Color? color;

  const Loading(
      {Key? key, this.height, this.barrier = false, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: barrier ? black.withOpacity(0.70) : Colors.transparent,
      width: barrier ? double.maxFinite : width,
      height: barrier ? double.maxFinite : height,
      child: Center(child: CircularProgressIndicator(color: color)),
    );
  }
}
