import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.colour,
      this.cardChild,
      this.onPress}); //since these values can be null if we don't pass arguments in all functions thus required keyword is omitted
  final Color? colour;
  final Widget? cardChild;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class SubmitWidget extends StatelessWidget {
  SubmitWidget({this.submit, this.submissionText = 'CALCULATE'});
  final void Function()? submit;
  final String submissionText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: submit,
      child: Container(
        child: Center(
          child: Text(
            submissionText,
            style: kLabelTextStyle,
          ),
        ),
        color: Color(0xffad0227),
        width: double.infinity,
        height: 50.0,
      ),
    );
  }
}
