import 'package:flutter/material.dart';

import '../input/CustomSwitchTile.dart';

class BuildMedicalHistoryForm extends StatefulWidget {
  final bool initialFamilyHistoryAlzheimers;
  final bool initialCardiovascularDisease;
  final bool initialDiabetes;
  final bool initialDepression;
  final bool initialHeadInjury;
  final bool initialHypertension;
  final Function(
    bool familyHistoryAlzheimers,
    bool cardiovascularDisease,
    bool diabetes,
    bool depression,
    bool headInjury,
    bool hypertension,
  ) onValuesChanged;

  const BuildMedicalHistoryForm({
    Key? key,
    required this.initialFamilyHistoryAlzheimers,
    required this.initialCardiovascularDisease,
    required this.initialDiabetes,
    required this.initialDepression,
    required this.initialHeadInjury,
    required this.initialHypertension,
    required this.onValuesChanged,
  }) : super(key: key);

  @override
  State<BuildMedicalHistoryForm> createState() =>
      _BuildMedicalHistoryFormState();
}

class _BuildMedicalHistoryFormState extends State<BuildMedicalHistoryForm> {
  late bool familyHistoryAlzheimers;
  late bool cardiovascularDisease;
  late bool diabetes;
  late bool depression;
  late bool headInjury;
  late bool hypertension;

  @override
  void initState() {
    super.initState();
    familyHistoryAlzheimers = widget.initialFamilyHistoryAlzheimers;
    cardiovascularDisease = widget.initialCardiovascularDisease;
    diabetes = widget.initialDiabetes;
    depression = widget.initialDepression;
    headInjury = widget.initialHeadInjury;
    hypertension = widget.initialHypertension;
  }

  void _notifyParent() {
    widget.onValuesChanged(
      familyHistoryAlzheimers,
      cardiovascularDisease,
      diabetes,
      depression,
      headInjury,
      hypertension,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitchTile(
          value: familyHistoryAlzheimers,
          onChanged: (value) {
            familyHistoryAlzheimers = value!;

            _notifyParent();
          },
          label: 'Possui Histórico familiar ?',
        ),
        CustomSwitchTile(
          value: cardiovascularDisease,
          onChanged: (value) {
            cardiovascularDisease = value!;

            _notifyParent();
          },
          label: 'Presença de doença cardiovascular ?',
        ),
        CustomSwitchTile(
          value: diabetes,
          onChanged: (value) {
            diabetes = value!;

            _notifyParent();
          },
          label: 'Presença de diabetes ?',
        ),
        CustomSwitchTile(
          value: depression,
          onChanged: (value) {
            depression = value!;

            _notifyParent();
          },
          label: 'Presença de depressão ?',
        ),
        CustomSwitchTile(
          value: headInjury,
          onChanged: (value) {
            headInjury = value!;

            _notifyParent();
          },
          label: 'Possui histórico de traumatismo craniano ?',
        ),
        CustomSwitchTile(
          value: hypertension,
          onChanged: (value) {
            hypertension = value!;

            _notifyParent();
          },
          label: 'Presença de hipertensão ?',
        ),
      ],
    );
  }
}
