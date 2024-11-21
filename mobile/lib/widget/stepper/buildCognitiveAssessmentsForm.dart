import 'package:flutter/material.dart';

import '../input/CustomSlider.dart';
import '../input/CustomSwitchTile.dart';

class BuildCognitiveAssessmentsForm extends StatefulWidget {
  final double initialMMSE;
  final double initialFunctionalAssessment;
  final bool initialMemoryComplaints;
  final bool initialBehavioralProblems;
  final double initialADL;
  final Function(
    double mmse,
    double functionalAssessment,
    bool memoryComplaints,
    bool behavioralProblems,
    double adl,
  ) onValuesChanged;

  const BuildCognitiveAssessmentsForm({
    super.key,
    required this.initialMMSE,
    required this.initialFunctionalAssessment,
    required this.initialMemoryComplaints,
    required this.initialBehavioralProblems,
    required this.initialADL,
    required this.onValuesChanged,
  });

  @override
  State<BuildCognitiveAssessmentsForm> createState() =>
      _BuildCognitiveAssessmentsFormState();
}

class _BuildCognitiveAssessmentsFormState
    extends State<BuildCognitiveAssessmentsForm> {
  late double mmse;
  late double functionalAssessment;
  late bool memoryComplaints;
  late bool behavioralProblems;
  late double adl;

  @override
  void initState() {
    super.initState();
    mmse = widget.initialMMSE;
    functionalAssessment = widget.initialFunctionalAssessment;
    memoryComplaints = widget.initialMemoryComplaints;
    behavioralProblems = widget.initialBehavioralProblems;
    adl = widget.initialADL;
  }

  void _notifyParent() {
    widget.onValuesChanged(
      mmse,
      functionalAssessment,
      memoryComplaints,
      behavioralProblems,
      adl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSlider(
          title: 'Pontuação do Mini-Exame do Estado Mental',
          min: 0,
          max: 30,
          value: mmse,
          onChanged: (newValue) {
            mmse = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title: 'Pontuação de avaliação funcional',
          min: 0,
          max: 10,
          value: functionalAssessment,
          onChanged: (newValue) {
            functionalAssessment = newValue;
            _notifyParent();
          },
        ),
        CustomSwitchTile(
          value: memoryComplaints,
          onChanged: (value) {
            memoryComplaints = value!;
            _notifyParent();
          },
          label: 'Presença de queixas de memória ?',
        ),
        CustomSwitchTile(
          value: behavioralProblems,
          onChanged: (value) {
            behavioralProblems = value!;
            _notifyParent();
          },
          label: 'Presença de problemas comportamentais ?',
        ),
        CustomSlider(
          title: 'Pontuação das Atividades da Vida Diária',
          min: 0,
          max: 10,
          value: adl,
          onChanged: (newValue) {
            adl = newValue;
            _notifyParent();
          },
        ),
      ],
    );
  }
}
