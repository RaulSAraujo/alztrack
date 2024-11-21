
import 'package:flutter/material.dart';

class EthnicitySelector extends StatelessWidget {
  final int selectedEthnicity;
  final ValueChanged<int> onChanged;

  const EthnicitySelector({
    Key? key,
    required this.selectedEthnicity,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione Etnia',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton<int>(
          value: selectedEthnicity,
          isExpanded: true,
          onChanged: (int? value) {
            if (value != null) {
              onChanged(value);
            }
          },
          items: const [
            DropdownMenuItem(
              value: 0,
              child: Text('Caucasian'),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text('Afro-americano'),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('Asiático'),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text('Outro'),
            ),
          ],
          dropdownColor: Colors.white,
        ),
      ],
    );
  }
}