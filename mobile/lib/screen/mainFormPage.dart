import 'dart:convert';

import 'package:alztrack/screen/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widget/stepper/buildBasicInfoForm.dart';
import '../widget/stepper/buildClinicalMeasurementsForm.dart';
import '../widget/stepper/buildCognitiveAssessmentsForm.dart';
import '../widget/stepper/buildLifestyleForm.dart';
import '../widget/stepper/buildMedicalHistoryForm.dart';
import '../widget/stepper/buildSymptomsForm.dart';

class MainFormPage extends StatefulWidget {
  const MainFormPage({super.key});

  @override
  _MainFormPageState createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  double age = 70;
  int gender = 0;
  int ethnicity = 0;
  int educationLevel = 0;

  void updateValuesBasic(
    double newAge,
    int newGender,
    int newEthnicity,
    int newEducationLevel,
  ) {
    setState(() {
      age = newAge;
      gender = newGender;
      ethnicity = newEthnicity;
      educationLevel = newEducationLevel;
    });
  }

  double imc = 15;
  bool smoking = false;
  double alcoholConsumption = 0;
  double physicalActivity = 0;
  double dietQuality = 0;
  double sleepQuality = 4;

  void updateValuesLifestyle(
    double newIMC,
    bool newSmoking,
    double newAlcoholConsumption,
    double newPhysicalActivity,
    double newDietQuality,
    double newSleepQuality,
  ) {
    setState(() {
      imc = newIMC;
      smoking = newSmoking;
      alcoholConsumption = newAlcoholConsumption;
      physicalActivity = newPhysicalActivity;
      dietQuality = newDietQuality;
      sleepQuality = newSleepQuality;
    });
  }

  bool familyHistoryAlzheimers = false;
  bool cardiovascularDisease = false;
  bool diabetes = false;
  bool depression = false;
  bool headInjury = false;
  bool hypertension = false;

  void updateValuesMedical(
    bool newFamilyHistoryAlzheimers,
    bool newCardiovascularDisease,
    bool newDiabetes,
    bool newDepression,
    bool newHeadInjury,
    bool newHypertension,
  ) {
    setState(() {
      familyHistoryAlzheimers = newFamilyHistoryAlzheimers;
      cardiovascularDisease = newCardiovascularDisease;
      diabetes = newDiabetes;
      depression = newDepression;
      headInjury = newHeadInjury;
      hypertension = newHypertension;
    });
  }

  double systolicBP = 90;
  double diastolicBP = 60;
  double cholesterolTotal = 150;
  double cholesterolLDL = 50;
  double cholesterolHDL = 20;
  double cholesterolTriglycerides = 50;

  void updateValuesClinical(
    double newSystolicBP,
    double newDiastolicBP,
    double newCholesterolTotal,
    double newCholesterolLDL,
    double newCholesterolHDL,
    double newCholesterolTriglycerides,
  ) {
    setState(() {
      systolicBP = newSystolicBP;
      diastolicBP = newDiastolicBP;
      cholesterolTotal = newCholesterolTotal;
      cholesterolLDL = newCholesterolLDL;
      cholesterolHDL = newCholesterolHDL;
      cholesterolTriglycerides = newCholesterolTriglycerides;
    });
  }

  double mmse = 0;
  double functionalAssessment = 0;
  bool memoryComplaints = false;
  bool behavioralProblems = false;
  double adl = 0;

  void updateValuesCognitive(
    double newMMSE,
    double newFunctionalAssessment,
    bool newMemoryComplaints,
    bool newBehavioralProblems,
    double newADL,
  ) {
    setState(() {
      mmse = newMMSE;
      functionalAssessment = newFunctionalAssessment;
      memoryComplaints = newMemoryComplaints;
      behavioralProblems = newBehavioralProblems;
      adl = newADL;
    });
  }

  bool confusion = false;
  bool disorientation = false;
  bool personalityChanges = false;
  bool difficultyCompletingTasks = false;
  bool forgetfulness = false;

  void updateValuesSymptoms(
    bool newConfusion,
    bool newDisorientation,
    bool newPersonalityChanges,
    bool newDifficultyCompletingTasks,
    bool newForgetfulness,
  ) {
    setState(() {
      confusion = newConfusion;
      disorientation = newDisorientation;
      personalityChanges = newPersonalityChanges;
      difficultyCompletingTasks = newDifficultyCompletingTasks;
      forgetfulness = newForgetfulness;
    });
  }

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    Step buildStep({
      required String title,
      required Widget content,
      required bool isActive,
    }) {
      return Step(
        title: Text(title),
        content: content,
        isActive: isActive,
      );
    }

    Future<void> submitForm() async {
      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.131:5000/api'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "Age": age,
            "Gender": gender,
            "Ethnicity": ethnicity,
            "EducationLevel": educationLevel,
            "BMI": imc,
            "Smoking": smoking ? 1 : 0,
            "AlcoholConsumption": alcoholConsumption,
            "PhysicalActivity": physicalActivity,
            "DietQuality": dietQuality,
            "SleepQuality": sleepQuality,
            "FamilyHistoryAlzheimers": familyHistoryAlzheimers ? 1 : 0,
            "CardiovascularDisease": cardiovascularDisease ? 1 : 0,
            "Diabetes": diabetes ? 1 : 0,
            "Depression": depression ? 1 : 0,
            "HeadInjury": headInjury ? 1 : 0,
            "Hypertension": hypertension ? 1 : 0,
            "SystolicBP": systolicBP,
            "DiastolicBP": diastolicBP,
            "CholesterolTotal": cholesterolTotal,
            "CholesterolLDL": cholesterolLDL,
            "CholesterolHDL": cholesterolHDL,
            "CholesterolTriglycerides": cholesterolTriglycerides,
            "MMSE": mmse,
            "FunctionalAssessment": functionalAssessment,
            "MemoryComplaints": memoryComplaints ? 1 : 0,
            "BehavioralProblems": behavioralProblems ? 1 : 0,
            "ADL": adl,
            "Confusion": confusion ? 1 : 0,
            "Disorientation": disorientation ? 1 : 0,
            "PersonalityChanges": personalityChanges ? 1 : 0,
            "DifficultyCompletingTasks": difficultyCompletingTasks ? 1 : 0,
            "Forgetfulness": forgetfulness ? 1 : 0,
            "Diagnosis": 0
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(risk: data['previsao']),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Erro ao obter o resultado.\nTente novamente mais tarde.',
              ),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Erro ao conectar com o servidor.\nVerifique sua conexão.',
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Avaliação'),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 5) {
            setState(() {
              _currentStep++;
            });
          } else {
            // Submissão final do formulário
            submitForm();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        onStepTapped: (value) {
          if (_currentStep > value) {
            setState(() {
              _currentStep = value;
            });
          }
        },
        steps: [
          buildStep(
            title: 'Dados Básicos',
            content: BuildBasicInfoForm(
              initialAge: age,
              initialGender: gender,
              initialEthnicity: ethnicity,
              initialEducationLevel: educationLevel,
              onValuesChanged: updateValuesBasic,
            ),
            isActive: _currentStep >= 0,
          ),
          buildStep(
            title: 'Estilo de Vida',
            content: BuildLifestyleForm(
              initialIMC: imc,
              initialSmoking: smoking,
              initialAlcoholConsumption: alcoholConsumption,
              initialPhysicalActivity: physicalActivity,
              initialDietQuality: dietQuality,
              initialSleepQuality: sleepQuality,
              onValuesChanged: updateValuesLifestyle,
            ),
            isActive: _currentStep >= 1,
          ),
          buildStep(
            title: 'Histórico Médico',
            content: BuildMedicalHistoryForm(
              initialFamilyHistoryAlzheimers: familyHistoryAlzheimers,
              initialCardiovascularDisease: cardiovascularDisease,
              initialDiabetes: diabetes,
              initialDepression: depression,
              initialHeadInjury: headInjury,
              initialHypertension: hypertension,
              onValuesChanged: updateValuesMedical,
            ),
            isActive: _currentStep >= 2,
          ),
          buildStep(
            title: 'Medidas Clínicas',
            content: BuildClinicalMeasurementsForm(
              initialSystolicBP: systolicBP,
              initialDiastolicBP: diastolicBP,
              initialCholesterolTotal: cholesterolTotal,
              initialCholesterolLDL: cholesterolLDL,
              initialCholesterolHDL: cholesterolHDL,
              initialCholesterolTriglycerides: cholesterolTriglycerides,
              onValuesChanged: updateValuesClinical,
            ),
            isActive: _currentStep >= 3,
          ),
          buildStep(
            title: 'Avaliações Cognitivas e Funcionais',
            content: BuildCognitiveAssessmentsForm(
              initialMMSE: mmse,
              initialFunctionalAssessment: functionalAssessment,
              initialMemoryComplaints: memoryComplaints,
              initialBehavioralProblems: behavioralProblems,
              initialADL: adl,
              onValuesChanged: updateValuesCognitive,
            ),
            isActive: _currentStep >= 4,
          ),
          buildStep(
            title: 'Sintomas',
            content: BuildSymptomsForm(
              initialConfusion: confusion,
              initialDisorientation: disorientation,
              initialPersonalityChanges: personalityChanges,
              initialDifficultyCompletingTasks: difficultyCompletingTasks,
              initialForgetfulness: forgetfulness,
              onValuesChanged: updateValuesSymptoms,
            ),
            isActive: _currentStep >= 5,
          ),
        ],
      ),
    );
  }
}
