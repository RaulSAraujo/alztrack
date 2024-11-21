import 'package:flutter/material.dart';

import '../input/CustomSlider.dart';
import '../input/CustomSwitchTile.dart';

class BuildLifestyleForm extends StatefulWidget {
  final double initialIMC;
  final bool initialSmoking;
  final double initialAlcoholConsumption;
  final double initialPhysicalActivity;
  final double initialDietQuality;
  final double initialSleepQuality;
  final Function(
    double imc,
    bool smoking,
    double alcoholConsumption,
    double physicalActivity,
    double dietQuality,
    double sleepQuality,
  ) onValuesChanged;

  const BuildLifestyleForm({
    super.key,
    required this.initialIMC,
    required this.initialSmoking,
    required this.initialAlcoholConsumption,
    required this.initialPhysicalActivity,
    required this.initialDietQuality,
    required this.initialSleepQuality,
    required this.onValuesChanged,
  });

  @override
  State<BuildLifestyleForm> createState() => _BuildLifestyleFormState();
}

class _BuildLifestyleFormState extends State<BuildLifestyleForm> {
  late double imc;
  late bool smoking;
  late double alcoholConsumption;
  late double physicalActivity;
  late double dietQuality;
  late double sleepQuality;

  @override
  void initState() {
    super.initState();
    imc = widget.initialIMC;
    smoking = widget.initialSmoking;
    alcoholConsumption = widget.initialAlcoholConsumption;
    physicalActivity = widget.initialPhysicalActivity;
    dietQuality = widget.initialDietQuality;
    sleepQuality = widget.initialSleepQuality;
  }

  void _notifyParent() {
    widget.onValuesChanged(
      imc,
      smoking,
      alcoholConsumption,
      physicalActivity,
      dietQuality,
      sleepQuality,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSlider(
          title: 'IMC',
          min: 15,
          max: 40,
          value: imc,
          onChanged: (newValue) {
            imc = newValue;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        CustomSwitchTile(
          value: smoking,
          onChanged: (value) {
            smoking = value!;

            _notifyParent();
          },
          label: 'Situação de fumante',
        ),
        const SizedBox(height: 8),
        CustomSlider(
          title: 'Consumo semanal de álcool em unidades',
          min: 0,
          max: 20,
          value: alcoholConsumption,
          onChanged: (newValue) {
            alcoholConsumption = newValue;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        CustomSlider(
          title: 'Atividade física semanal em horas',
          min: 0,
          max: 10,
          value: physicalActivity,
          onChanged: (newValue) {
            physicalActivity = newValue;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        CustomSlider(
          title: 'Qualidade da Dieta',
          min: 0,
          max: 10,
          value: dietQuality,
          onChanged: (newValue) {
            dietQuality = newValue;

            _notifyParent();
          },
        ),
        const SizedBox(height: 8),
        CustomSlider(
          title: 'Qualidade do sono',
          min: 4,
          max: 10,
          value: sleepQuality,
          onChanged: (newValue) {
            sleepQuality = newValue;

            _notifyParent();
          },
        )
      ],
    );
  }
}
