import 'package:flutter/material.dart';
import 'package:starreviews/progress_bar/progress_bar.dart';

class ProgressBarLayout extends StatelessWidget {
  final String starName;
  final TextStyle starNameStyle;
  final TextStyle percentageStyle;
  final bool showPercentage;

  final Color valueColor;
  final Color progressBarBackgroundColor;
  final double value;

  ProgressBarLayout(
        {Key key,
          this.starName,
          this.showPercentage = true,
          this.starNameStyle = const TextStyle(fontSize: 12),
          this.percentageStyle = const TextStyle(fontSize: 12),
          this.valueColor = const Color(0xff656565),
          this.progressBarBackgroundColor = Colors.white,
          this.value})
    : super(key: key) {
    if (value == null) {
    throw ArgumentError('value cannot be empty');
    }

    if (starName == null) {
      throw ArgumentError('starName cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(this.starName, style: this.starNameStyle),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ProgressBar(
              value: this.value,
              valueColor: this.valueColor,
              backgroundColor: this.progressBarBackgroundColor,
            ),
          ),
          Visibility(
            visible: this.showPercentage,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text((this.value * 100).toInt().toString() + '%',
                    style: this.percentageStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}