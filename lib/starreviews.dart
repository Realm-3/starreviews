library starreviews;

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StarReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: _ProgressBar(value: 0.6,)
    );
  }
}

class _ProgressBar extends StatelessWidget {

  final Color valueColor;
  final Color backgroundColor;
  final double value;

  _ProgressBar({
    this.valueColor = const Color(0xff656565),
    this.backgroundColor = Colors.white,
    this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 1,
          color: const Color(0xffcecece)
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 10,
          child: LinearPercentIndicator(
            lineHeight: 10,
            padding: null,
            linearStrokeCap: LinearStrokeCap.roundAll,
            percent: this.value, // percent filled
            progressColor: this.valueColor,
            backgroundColor: this.backgroundColor,
          ),
        ),
      ),
    );
  }
}
