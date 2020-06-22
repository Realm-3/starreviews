library starreviews;

import 'dart:math';

import 'package:flutter/material.dart';
import 'file:///D:/GitHub/starreviews/lib/progress_bar/progress_bar_layout.dart';
import 'package:starreviews/star_display.dart';

class StarReviews extends StatelessWidget {
  final int total;
  final bool showHeader;
  final bool showBottom;
  final bool showRatingNumber;

  final List<String> starNames;
  final TextStyle starNameStyle;
  final TextStyle percentageStyle;
  final bool showPercentage;

  final Color valueColor;
  final Color progressBarBackgroundColor;
  final List<double> values;

  final double starSize;
  final Color starColor;

  final double average;

  StarReviews(
      {Key key,
      @required this.total,
      @required this.starNames,
      this.starSize = 16,
      this.starColor = const Color(0xffffd900),
      this.showRatingNumber = true,
      this.showHeader = true,
      this.showBottom = true,
      this.showPercentage = true,
      this.starNameStyle = const TextStyle(fontSize: 12),
      this.percentageStyle = const TextStyle(fontSize: 12),
      this.valueColor = const Color(0xff656565),
      this.progressBarBackgroundColor = Colors.white,
      @required this.average,
      @required this.values})
      : assert(total != null),
        super(key: key) {
    if (values == null) {
      throw ArgumentError('value cannot be empty');
    }

    if (starNames.length != values.length) {
      throw ArgumentError('startNames and values\' length different');
    }

    if (starNames == null) {
      throw ArgumentError('starNames cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Visibility(
          visible: this.showHeader,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    StarDisplay(
                      value: this.average,
                      size: starSize,
                      starCounts: this.starNames.length,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${this.average} out of ${this.starNames.length}',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Visibility(
                  visible: showRatingNumber,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${this.total} ratings',
                        style: TextStyle(
                            color: const Color(0xff919191), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: showBottom,
          child: Column(
              children: this
                  .starNames
                  .map((e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ProgressBarLayout(
                            starName: e,
                            value: this.values[this.starNames.indexOf(e)],
                            showPercentage: this.showPercentage,
                            starNameStyle: this.starNameStyle,
                            percentageStyle: this.percentageStyle,
                            valueColor: this.valueColor,
                            progressBarBackgroundColor:
                                this.progressBarBackgroundColor,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                        ],
                      ))
                  .toList()),
        )
      ],
    ));
  }

  double _roundDecimal(double number) {
    int decimals = 1;
    int fac = pow(10, decimals);
    double d = number;
    d = (d * fac).round() / fac;
    return d;
  }
}
