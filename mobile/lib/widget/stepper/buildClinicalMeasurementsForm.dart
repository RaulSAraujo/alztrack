import 'package:flutter/material.dart';

import '../input/CustomSlider.dart';

class BuildClinicalMeasurementsForm extends StatefulWidget {
  final double initialSystolicBP;
  final double initialDiastolicBP;
  final double initialCholesterolTotal;
  final double initialCholesterolLDL;
  final double initialCholesterolHDL;
  final double initialCholesterolTriglycerides;
  final Function(
    double systolicBP,
    double diastolicBP,
    double cholesterolTotal,
    double cholesterolLDL,
    double cholesterolHDL,
    double cholesterolTriglycerides,
  ) onValuesChanged;

  const BuildClinicalMeasurementsForm({
    super.key,
    required this.initialSystolicBP,
    required this.initialDiastolicBP,
    required this.initialCholesterolTotal,
    required this.initialCholesterolLDL,
    required this.initialCholesterolHDL,
    required this.initialCholesterolTriglycerides,
    required this.onValuesChanged,
  });

  @override
  State<BuildClinicalMeasurementsForm> createState() =>
      _BuildClinicalMeasurementsFormState();
}

class _BuildClinicalMeasurementsFormState
    extends State<BuildClinicalMeasurementsForm> {
  late double systolicBP;
  late double diastolicBP;
  late double cholesterolTotal;
  late double cholesterolLDL;
  late double cholesterolHDL;
  late double cholesterolTriglycerides;

  @override
  void initState() {
    super.initState();
    systolicBP = widget.initialSystolicBP;
    diastolicBP = widget.initialDiastolicBP;
    cholesterolTotal = widget.initialCholesterolTotal;
    cholesterolLDL = widget.initialCholesterolLDL;
    cholesterolHDL = widget.initialCholesterolHDL;
    cholesterolTriglycerides = widget.initialCholesterolTriglycerides;
  }

  void _notifyParent() {
    widget.onValuesChanged(
      systolicBP,
      diastolicBP,
      cholesterolTotal,
      cholesterolLDL,
      cholesterolHDL,
      cholesterolTriglycerides,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSlider(
          title: 'Pressão arterial sistólica(mmHg)',
          min: 90,
          max: 180,
          value: systolicBP,
          onChanged: (newValue) {
            systolicBP = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title: 'Pressão arterial diastólica(mmHg)',
          min: 60,
          max: 180,
          value: diastolicBP,
          onChanged: (newValue) {
            diastolicBP = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title: 'Níveis de colesterol total(mg/dL)',
          min: 150,
          max: 300,
          value: cholesterolTotal,
          onChanged: (newValue) {
            cholesterolTotal = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title:
              'Níveis de colesterol de lipoproteína de baixa densidade(mg/dL)',
          min: 50,
          max: 200,
          value: cholesterolLDL,
          onChanged: (newValue) {
            cholesterolLDL = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title:
              'Níveis de colesterol de lipoproteína de alta densidade(mg/dL)',
          min: 20,
          max: 100,
          value: cholesterolHDL,
          onChanged: (newValue) {
            cholesterolHDL = newValue;
            _notifyParent();
          },
        ),
        CustomSlider(
          title: 'Níveis de triglicerídeos(mg/dL)',
          min: 50,
          max: 400,
          value: cholesterolTriglycerides,
          onChanged: (newValue) {
            cholesterolTriglycerides = newValue;
            _notifyParent();
          },
        ),
      ],
    );
  }
}
