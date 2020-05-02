import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final Color valueColor;
  final Color backgroundColor;
  final double value;

  ProgressBar({Key key, this.valueColor, this.backgroundColor, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1, color: const Color(0xffcecece))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 10,
          child: LinearPercentIndicator(
            lineHeight: 10,
            padding: null,
            linearStrokeCap: LinearStrokeCap.roundAll,
            percent: this.value,
            // percent filled
            progressColor: this.valueColor,
            backgroundColor: this.backgroundColor,
          ),
        ),
      ),
    );
  }
}
