import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int risk; // 0 ou 1

  const ResultScreen({super.key, required this.risk});

  String getRiskLevel(int risk) {
    return risk == 0 ? 'Baixo Risco' : 'Alto Risco';
  }

  Color getRiskColor(int risk) {
    return risk == 0 ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final riskLevel = getRiskLevel(risk);
    final riskColor = getRiskColor(risk);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado da Análise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resultado do Formulário',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: riskColor.withOpacity(0.2),
              ),
              child: Center(
                child: Text(
                  riskLevel,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: riskColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              risk == 0
                  ? 'Com base nos dados fornecidos, você apresenta baixo risco de Alzheimer.'
                  : 'Com base nos dados fornecidos, você apresenta alto risco de Alzheimer.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
