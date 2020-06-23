import 'package:flutter/material.dart';
import 'package:starreviews/starreviews.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

List<String> _names = ['Star 5', 'Star 4', 'Star 3', 'Star 2', 'Star 1'];
List<double> _values = [0.1, 0.3, 0.4, 0.1, 0.1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              StarReviews(
                total: 30,
                starNames: _names,
                values: _values,
                showPercentage: true,
                average: 5,
              ),
              SizedBox(height: 30,),
            StarReviewsHorizontal(
              total: 30,
              starNames: _names,
              showProgressBarBorder: false,
              valueColor: Colors.black,
              progressBarBackgroundColor: Colors.grey.withOpacity(0.4),
              values: _values,
              showPercentage: true,
              starColor: Colors.black,
              average: 4.2,
            )
          ],
          ),
        )
      ),
    );
  }
}
