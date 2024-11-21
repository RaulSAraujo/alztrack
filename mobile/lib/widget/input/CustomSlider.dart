import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String title;
  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    Key? key,
    required this.title,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$title: ${value.toInt()}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: 100,
          label: value.toInt().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
