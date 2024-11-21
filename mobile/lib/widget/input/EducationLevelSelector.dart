import 'package:flutter/material.dart';

class EducationLevelSelector extends StatelessWidget {
  final int selectedLevel;
  final ValueChanged<int> onChanged;

  const EducationLevelSelector({
    super.key,
    required this.selectedLevel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Education Level',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButton<int>(
          value: selectedLevel,
          isExpanded: true,
          onChanged: (int? value) {
            if (value != null) {
              onChanged(value);
            }
          },
          items: const [
            DropdownMenuItem(
              value: 0,
              child: Text('Nenhum'),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text('Ensino Médio'),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('Bacharel'),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text('Superior'),
            ),
          ],
          dropdownColor: Colors.white,
        ),
      ],
    );
  }
}
