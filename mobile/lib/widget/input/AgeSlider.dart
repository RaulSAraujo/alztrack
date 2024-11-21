import 'package:flutter/material.dart';

class AgeSlider extends StatelessWidget {
  final double age;
  final ValueChanged<double> onChanged;

  const AgeSlider({
    Key? key,
    required this.age,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Idade: ${age.toInt()}',
          style: TextStyle(fontSize: 20),
        ),
        Slider(
          value: age,
          min: 60,
          max: 90,
          divisions: 100,
          label: age.toInt().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
