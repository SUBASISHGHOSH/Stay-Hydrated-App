import 'dart:math';

class Brain {
  Brain({
    required this.height,
    required this.weight,
  }); //since weight and height cant be null to calculate(null safety)
  final int height;
  final int weight;
  // final int glass;
  double _bmi = 0;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are eating too much! Slow down...Start dieting!';
    } else if (_bmi > 18.5) {
      return 'Good Job! You are healthy as one should be!';
    } else {
      return 'Eat more, Enjoy life and gain some weight in the process then comeback!';
    }
  }

  String getWater(int glass) {
    return 'You drank ' +
        (350 * glass / 1000).toString() +
        'L' +
        ' water today!';
  }
}
