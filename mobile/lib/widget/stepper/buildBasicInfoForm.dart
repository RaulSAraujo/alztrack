import 'package:flutter/material.dart';

import '../input/AgeSlider.dart';
import '../input/GenderSelection.dart';
import '../input/SectionTitle.dart';
import '../input/EthnicitySelector.dart';
import '../input/EducationLevelSelector.dart';

class BuildBasicInfoForm extends StatefulWidget {
  final double initialAge;
  final int initialGender;
  final int initialEthnicity;
  final int initialEducationLevel;
  final Function(double, int, int, int) onValuesChanged;

  const BuildBasicInfoForm({
    super.key,
    required this.initialAge,
    required this.initialGender,
    required this.initialEthnicity,
    required this.initialEducationLevel,
    required this.onValuesChanged,
  });

  @override
  State<BuildBasicInfoForm> createState() => _BuildBasicInfoFormState();
}

class _BuildBasicInfoFormState extends State<BuildBasicInfoForm> {
  late double age;
  late int gender;
  late int ethnicity;
  late int educationLevel;

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
    gender = widget.initialGender;
    ethnicity = widget.initialEthnicity;
    educationLevel = widget.initialEducationLevel;
  }

  void _notifyParent() {
    widget.onValuesChanged(age, gender, ethnicity, educationLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Informações Básicas'),
        AgeSlider(
          age: age,
          onChanged: (value) {
            age = value;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        GenderSelection(
          selectedGender: gender,
          onChanged: (int? value) {
            gender = value!;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        EthnicitySelector(
          selectedEthnicity: ethnicity,
          onChanged: (newValue) {
            ethnicity = newValue;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        EducationLevelSelector(
          selectedLevel: educationLevel,
          onChanged: (newValue) {
            educationLevel = newValue;

            _notifyParent();
          },
        ),
      ],
    );
  }
}
