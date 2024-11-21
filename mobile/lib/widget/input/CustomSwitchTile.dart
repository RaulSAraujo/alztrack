
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const CustomSwitchTile({
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 4.0), // Reduz o padding vertical
      child: SwitchListTile(
        title: Text(
          label,
          style: TextStyle(fontSize: 16), // Diminui o tamanho da fonte
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.teal,
        inactiveTrackColor: Colors.grey,
        contentPadding: EdgeInsets.all(0), // Remove o padding extra
      ),
    );
  }
}