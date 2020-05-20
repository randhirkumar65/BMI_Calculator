import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableComponents.dart';
import 'constants.dart';
import 'ResultsPage.dart';
import 'bmi_calculator.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double currentHeight = 180;
  int currentWeight = 60;
  int currentAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCards(
                      onCardPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      customColor: selectedGender == Gender.male
                          ? activeColor
                          : inactiveColor,
                      cardChild: GenderWidget(
                        iconImage: FontAwesomeIcons.mars,
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCards(
                    onCardPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    customColor: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    cardChild: GenderWidget(
                      iconImage: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCards(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: labelStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text('$currentHeight', style: heightLabelStyle),
                      Text('cm', style: labelStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.red,
                      activeTrackColor: Colors.white,
                      overlayColor: Colors.green,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(),
                    ),
                    child: Slider(
                      value: currentHeight,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      min: 120.0,
                      max: 220.0,
                      divisions: 10,
                      onChanged: (currentVal) {
                        setState(() {
                          currentHeight = currentVal;
                        });
                      },
                    ),
                  ),
                ],
              ),
              customColor: activeColor,
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCards(
                        cardChild: WeightCards(text: 'Weight',weight: currentWeight,onMinusPressed: () {
                          setState(() {
                            currentWeight--;
                          });
                        },onPlusPressed: () {
                          setState(() {
                            currentWeight++;
                          });
                        },),
                    customColor: activeColor,
                  )),
                  Expanded(
                      child: ReusableCards(
                        cardChild: WeightCards(text: 'Age', weight: currentAge,onPlusPressed: () {
                          setState(() {
                            currentAge++;
                          });
                        },onMinusPressed: () {
                          setState(() {
                            currentAge--;
                          });
                        },),
                    customColor: activeColor,
                  )),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                child: Text('Calculate',style: largeButtonTitle,),
                onPressed: () {
                  CalculateBMI calculator = CalculateBMI(height: currentHeight.toInt(),weight: currentWeight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(bmiResult: calculator.Calculate(),interpretation: calculator.getInterpretaion(),resultText: calculator.getResult(),);
                  }));
                },
              ),
              color: containerColor,
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.only(top: bottomMargin),
            )
          ],
        ),
      ),
    );
  }
}

class WeightCards extends StatelessWidget {

  WeightCards({@required this.text,@required this.weight,this.onMinusPressed,this.onPlusPressed});
  final String text;
  final int weight;
  final Function onPlusPressed;
  final Function onMinusPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text,style: labelStyle,),
        Text(weight.toString(),style: heightLabelStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundCustomButton(icon: FontAwesomeIcons.plus,onPress: onPlusPressed,),
            SizedBox(width: 10,),
            RoundCustomButton(icon: FontAwesomeIcons.minus,onPress: onMinusPressed)
          ],
        ),
      ],
    );
  }
}

