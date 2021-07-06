import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.sex, required this.genderText});
  final IconData sex;
  final String genderText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          sex,
          size: 80.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.child, this.weightChanger});
  final IconData? child;
  final Function()? weightChanger;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightChanger,
      child: Icon(child),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
