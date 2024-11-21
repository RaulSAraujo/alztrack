import 'package:flutter/material.dart';

import '../input/CustomSwitchTile.dart';

class BuildSymptomsForm extends StatefulWidget {
  final bool initialConfusion;
  final bool initialDisorientation;
  final bool initialPersonalityChanges;
  final bool initialDifficultyCompletingTasks;
  final bool initialForgetfulness;

  final Function(
    bool confusion,
    bool disorientation,
    bool personalityChanges,
    bool difficultyCompletingTasks,
    bool forgetfulness,
  ) onValuesChanged;
  const BuildSymptomsForm({
    super.key,
    required this.initialConfusion,
    required this.initialDisorientation,
    required this.initialPersonalityChanges,
    required this.initialDifficultyCompletingTasks,
    required this.initialForgetfulness,
    required this.onValuesChanged,
  });

  @override
  State<BuildSymptomsForm> createState() => _BuildSymptomsFormState();
}

class _BuildSymptomsFormState extends State<BuildSymptomsForm> {
  late bool confusion;
  late bool disorientation;
  late bool personalityChanges;
  late bool difficultyCompletingTasks;
  late bool forgetfulness;

  @override
  void initState() {
    super.initState();
    confusion = widget.initialConfusion;
    disorientation = widget.initialDisorientation;
    personalityChanges = widget.initialPersonalityChanges;
    difficultyCompletingTasks = widget.initialDifficultyCompletingTasks;
    forgetfulness = widget.initialForgetfulness;
  }

  void _notifyParent() {
    widget.onValuesChanged(
      confusion,
      disorientation,
      personalityChanges,
      difficultyCompletingTasks,
      forgetfulness,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitchTile(
          value: confusion,
          onChanged: (value) {
            confusion = value!;
            _notifyParent();
          },
          label: 'Presença de confusão ?',
        ),
        CustomSwitchTile(
          value: disorientation,
          onChanged: (value) {
            disorientation = value!;
            _notifyParent();
          },
          label: 'Presença de desorientação ?',
        ),
        CustomSwitchTile(
          value: personalityChanges,
          onChanged: (value) {
            personalityChanges = value!;
            _notifyParent();
          },
          label: 'Presença de mudanças de personalidade ?',
        ),
        CustomSwitchTile(
          value: difficultyCompletingTasks,
          onChanged: (value) {
            difficultyCompletingTasks = value!;
            _notifyParent();
          },
          label: 'Presença de dificuldade em concluir tarefas ?',
        ),
        CustomSwitchTile(
          value: forgetfulness,
          onChanged: (value) {
            forgetfulness = value!;
            _notifyParent();
          },
          label: 'Presença de esquecimento ?',
        ),
      ],
    );
  }
}
