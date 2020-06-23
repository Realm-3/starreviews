import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  final double size;
  final Color color;
  final int starCounts;

  const StarDisplay(
      {Key key,
        this.starCounts = 5,
        this.value = 0,
        this.size = 16,
        this.color = const Color(0xffffd900)})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCounts, (index) {
        return Icon(
          (value - index >= 0.8)
              ? Icons.star
              : (value - index >= 0.3)
              ? Icons.star_half
              : Icons.star_border,
          color: this.color,
          size: this.size,
        );
      }),
    );
  }
}