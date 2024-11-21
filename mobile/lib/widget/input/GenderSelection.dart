import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final int selectedGender;
  final ValueChanged<int?> onChanged;

  const GenderSelection({
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione o gênero',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildGenderOption('Masculino', 0),
            _buildGenderOption('Feminino', 1),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String gender, int value) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: selectedGender,
          onChanged: onChanged,
        ),
        Text(gender),
      ],
    );
  }
}
