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
  final bool showProgressBarBorder;

  StarReviews(
      {Key key,
      @required this.total,
      @required this.starNames,
      this.starSize = 16,
      this.showProgressBarBorder = true,
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
                            showBorder: showProgressBarBorder,
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
}

class StarReviewsHorizontal extends StatelessWidget {
  final int total;
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

  final bool showOnlyAverage;
  final bool showProgressBarBorder;
  final TextStyle averageNumberTextStyle;
  final double spaceBetween;

  StarReviewsHorizontal(
      {Key key,
      @required this.total,
      @required this.starNames,
      this.starSize = 12,
      this.spaceBetween = 30,
      this.showProgressBarBorder = true,
      this.showOnlyAverage = false,
      this.starColor = const Color(0xffffd900),
      this.showRatingNumber = true,
      this.showPercentage = true,
      this.starNameStyle = const TextStyle(fontSize: 12),
      this.percentageStyle = const TextStyle(fontSize: 12),
      this.averageNumberTextStyle =
          const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                this.average.toString(),
                style: this.averageNumberTextStyle,
              ),
              StarDisplay(
                value: this.average,
                size: starSize,
                color: this.starColor,
                starCounts: this.starNames.length,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${this.total} ratings',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          SizedBox(
            width: this.spaceBetween,
          ),
          if (!this.showOnlyAverage) ...[
            Expanded(
              child: StarReviews(
                total: this.total,
                starNames: this.starNames,
                starSize: this.starSize,
                starColor: this.starColor,
                showRatingNumber: this.showRatingNumber,
                showHeader: false,
                showBottom: true,
                showPercentage: this.showPercentage,
                starNameStyle: this.starNameStyle,
                percentageStyle: this.percentageStyle,
                valueColor: this.valueColor,
                showProgressBarBorder: this.showProgressBarBorder,
                progressBarBackgroundColor: this.progressBarBackgroundColor,
                average: this.average,
                values: this.values,
              ),
            )
          ]
        ],
      ),
    );
  }
}
