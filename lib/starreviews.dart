library starreviews;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:starreviews/progress-bar-layout.dart';

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

  StarReviews(
      {Key key,
      this.total,
      this.starNames,
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
      this.values})
      : assert(total != null),
        super(key: key) {
    if (values == null) {
      throw ArgumentError('value cannot be empty');
    }

    if (starNames.length > 5) {
      throw ArgumentError('starNames\' cannot be greater than 5');
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
                    _StarDisplay(
                      value: getAverage(),
                      size: ,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${getAverage()} out of 5',
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
                        style:
                        TextStyle(color: const Color(0xff919191), fontSize: 12),
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
            children: <Widget>[
              ProgressBarLayout(
                starName: this.starNames[0],
                value: this.values[0],
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
              ),
              SizedBox(
                height: 11,
              ),
              ProgressBarLayout(
                starName: this.starNames[1],
                value: this.values[1],
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
              ),
              SizedBox(
                height: 11,
              ),
              ProgressBarLayout(
                starName: this.starNames[2],
                value: this.values[2],
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
              ),
              SizedBox(
                height: 11,
              ),
              ProgressBarLayout(
                starName: this.starNames[3],
                value: this.values[3],
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
              ),
              SizedBox(
                height: 11,
              ),
              ProgressBarLayout(
                starName: this.starNames[4],
                value: this.values[4],
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
              ),
              SizedBox(
                height: 11,
              ),
            ],
          ),
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

  double getAverage() {
    double total = 0;
    this.values.forEach((value) {
      total += value;
    });

    int fac = pow(10, 2);
    double d = total / 5;

    return _roundDecimal(((d * fac).round() / fac) * 10);
  }
}

class _StarDisplay extends StatelessWidget {
  final double value;
  final double size;
  final Color color;

  const _StarDisplay(
      {Key key,
        this.value = 0,
        this.size = 16,
        this.color = const Color(0xffffd900)})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          (value == 5)
              ? Icons.star
              : index + 1 < value
              ? Icons.star
              : (index == value.toInt() && value % 1 != 0)
              ? Icons.star_half
              : Icons.star_border,
          color: this.color,
          size: this.size,
        );
      }),
    );
  }
}
