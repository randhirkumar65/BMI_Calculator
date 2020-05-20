import 'package:bmi_calculator/ReusableComponents.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'inputPage.dart';
import 'main.dart';

class DetailPage extends StatelessWidget {
  DetailPage({@required this.bmiResult,this.interpretation,this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
        backgroundColor: Colors.red.shade900,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  '$bmiResult',
                  style: largeButtonTitle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCards(
                customColor: activeColor,
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      '$resultText',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '28.4',
                      style: largeButtonTitle,
                    ),
                    Text(
                      '$interpretation',
                      style: labelStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: FlatButton(
                  child: Text(
                    'Re-Calculate',
                    style: largeButtonTitle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                color: containerColor,
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(top: bottomMargin),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
