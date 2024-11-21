import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../widget/stepper/buildBasicInfoForm.dart';
import '../widget/stepper/buildClinicalMeasurementsForm.dart';
import '../widget/stepper/buildCognitiveAssessmentsForm.dart';
import '../widget/stepper/buildLifestyleForm.dart';
import '../widget/stepper/buildMedicalHistoryForm.dart';
import '../widget/stepper/buildSymptomsForm.dart';
import 'ResultPage.dart';

class MainFormPage extends StatefulWidget {
  @override
  _MainFormPageState createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  bool showAdditionalFields = false;

  bool familyHistoryAlzheimers = false;
  bool memoryComplaints = false;
  bool functionalAssessment = false;
  bool confusion = false;
  bool forgetfulness = false;

  // Additional fields
  final educationLevelController = TextEditingController();
  final physicalActivityController = TextEditingController();
  final dietQualityController = TextEditingController();
  final sleepQualityController = TextEditingController();

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    Step _buildStep({
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

    double age = 70;
    int gender = 0;
    int ethnicity = 0;
    int educationLevel = 0;

    void _updateValuesBasic(
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

    void _updateValuesLifestyle(
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

    void _updateValuesMedical(
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

    void _updateValuesClinical(
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

    void _updateValuesCognitive(
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

    void _updateValuesSymptoms(
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

    Future<void> _submitForm() async {
      await dotenv.load(fileName: '.env');

      final String apiUrl = dotenv.env['API_URL'] ?? '';

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "Age": age,
            "Gender": gender,
            "Ethnicity": ethnicity,
            "EducationLevel": educationLevel,
            "BMI": 0,
            "Smoking": smoking,
            "AlcoholConsumption": alcoholConsumption,
            "PhysicalActivity": physicalActivity,
            "DietQuality": dietQuality,
            "SleepQuality": sleepQuality,
            "FamilyHistoryAlzheimers": familyHistoryAlzheimers,
            "CardiovascularDisease": cardiovascularDisease,
            "Diabetes": diabetes,
            "Depression": depression,
            "HeadInjury": headInjury,
            "Hypertension": hypertension,
            "SystolicBP": systolicBP,
            "DiastolicBP": diastolicBP,
            "CholesterolTotal": cholesterolTotal,
            "CholesterolLDL": cholesterolLDL,
            "CholesterolHDL": cholesterolHDL,
            "CholesterolTriglycerides": cholesterolTriglycerides,
            "MMSE": mmse,
            "FunctionalAssessment": functionalAssessment,
            "MemoryComplaints": memoryComplaints,
            "BehavioralProblems": behavioralProblems,
            "ADL": adl,
            "Confusion": confusion,
            "Disorientation": disorientation,
            "PersonalityChanges": personalityChanges,
            "DifficultyCompletingTasks": difficultyCompletingTasks,
            "Forgetfulness": forgetfulness,
            "Diagnosis": diagnosis
          }),
        );

        if (response.statusCode == 200) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ResultScreen(risk: response.data),
          //   ),
          // );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Erro ao obter o resultado.\nTente novamente mais tarde.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Erro ao conectar com o servidor.\nVerifique sua conexão.')),
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
            _submitForm();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: [
          _buildStep(
            title: 'Dados Básicos',
            content: BuildBasicInfoForm(
              initialAge: age,
              initialGender: gender,
              initialEthnicity: ethnicity,
              initialEducationLevel: educationLevel,
              onValuesChanged: _updateValuesBasic,
            ),
            isActive: _currentStep >= 0,
          ),
          _buildStep(
            title: 'Estilo de Vida',
            content: BuildLifestyleForm(
              initialIMC: imc,
              initialSmoking: smoking,
              initialAlcoholConsumption: alcoholConsumption,
              initialPhysicalActivity: physicalActivity,
              initialDietQuality: dietQuality,
              initialSleepQuality: sleepQuality,
              onValuesChanged: _updateValuesLifestyle,
            ),
            isActive: _currentStep >= 1,
          ),
          _buildStep(
            title: 'Histórico Médico',
            content: BuildMedicalHistoryForm(
              initialFamilyHistoryAlzheimers: familyHistoryAlzheimers,
              initialCardiovascularDisease: cardiovascularDisease,
              initialDiabetes: diabetes,
              initialDepression: depression,
              initialHeadInjury: headInjury,
              initialHypertension: hypertension,
              onValuesChanged: _updateValuesMedical,
            ),
            isActive: _currentStep >= 2,
          ),
          _buildStep(
            title: 'Medidas Clínicas',
            content: BuildClinicalMeasurementsForm(
              initialSystolicBP: systolicBP,
              initialDiastolicBP: diastolicBP,
              initialCholesterolTotal: cholesterolTotal,
              initialCholesterolLDL: cholesterolLDL,
              initialCholesterolHDL: cholesterolHDL,
              initialCholesterolTriglycerides: cholesterolTriglycerides,
              onValuesChanged: _updateValuesClinical,
            ),
            isActive: _currentStep >= 3,
          ),
          _buildStep(
            title: 'Avaliações Cognitivas e Funcionais',
            content: BuildCognitiveAssessmentsForm(
              initialMMSE: mmse,
              initialFunctionalAssessment: functionalAssessment,
              initialMemoryComplaints: memoryComplaints,
              initialBehavioralProblems: behavioralProblems,
              initialADL: adl,
              onValuesChanged: _updateValuesCognitive,
            ),
            isActive: _currentStep >= 4,
          ),
          _buildStep(
            title: 'Sintomas',
            content: BuildSymptomsForm(
              initialConfusion: confusion,
              initialDisorientation: disorientation,
              initialPersonalityChanges: personalityChanges,
              initialDifficultyCompletingTasks: difficultyCompletingTasks,
              initialForgetfulness: forgetfulness,
              onValuesChanged: _updateValuesSymptoms,
            ),
            isActive: _currentStep >= 5,
          ),
        ],
      ),
    );
  }
}
