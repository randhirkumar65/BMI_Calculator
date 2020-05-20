import 'package:flutter/material.dart';
import 'constants.dart';
class GenderWidget extends StatelessWidget {
  GenderWidget({@required this.iconImage,@required this.text});
  final String text;
  final IconData iconImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconImage,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: labelStyle
        )
      ],
    );
  }
}

class ReusableCards extends StatelessWidget {
  ReusableCards({@required this.customColor, this.cardChild,this.onCardPressed});
  final Color customColor;
  final Widget cardChild;
  final Function onCardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
//        color: Color(0xFF1D1E33),
          color: customColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}


class RoundCustomButton extends StatelessWidget {
  RoundCustomButton({@required this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      fillColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
