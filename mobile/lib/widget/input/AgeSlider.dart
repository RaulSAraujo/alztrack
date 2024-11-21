import 'package:flutter/material.dart';

class AgeSlider extends StatelessWidget {
  final double age;
  final ValueChanged<double> onChanged;

  const AgeSlider({
    super.key,
    required this.age,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Idade: ${age.toInt()}',
          style: const TextStyle(fontSize: 20),
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
