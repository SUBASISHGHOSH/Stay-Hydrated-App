import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stay_hydrated/Icon_content.dart';
import 'package:flutter/widgets.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'brain.dart';

enum Sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex? gender;
  double currentSliderValue = 0;
  int glass = 0;
  int weight = 50;
  int height = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('STAY HYDRATED')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          gender = Sex.male;
                        },
                      );
                    },
                    colour: gender == Sex.male
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild: IconContent(sex: Icons.male, genderText: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          gender = Sex.female;
                        },
                      );
                    },
                    colour: gender == Sex.female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild:
                        IconContent(sex: Icons.female, genderText: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GLASS OF WATER',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        glass.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'gl',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: glass.toDouble(),
                    min: 0.0,
                    max: 100.0,
                    activeColor: kActiveSliderColor,
                    onChanged: (newGlass) {
                      setState(() {
                        glass = newGlass.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icons.exposure_minus_1,
                              weightChanger: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icons.plus_one,
                              weightChanger: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icons.exposure_minus_1,
                              weightChanger: () {
                                setState(() {
                                  height--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icons.plus_one,
                              weightChanger: () {
                                setState(() {
                                  height++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SubmitWidget(
            submit: () {
              Brain calc = Brain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    value: calc.getBMI(),
                    result: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                    water: calc.getWater(glass),
                  ),
                ),
              );
            },
            submissionText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
