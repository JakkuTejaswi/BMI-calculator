import 'package:flutter/material.dart';

void main() => runApp(BmiApp());

class BmiApp extends StatefulWidget {
  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  double? bmi;

  void calculateBMI() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);
    if (height != null && weight != null && height > 0) {
      setState(() => bmi = weight / ((height / 100) * (height / 100)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BMI Calculator')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter height (cm)'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter weight (kg)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: calculateBMI, child: Text('Calculate')),
              SizedBox(height: 20),
              if (bmi != null)
                Text('Your BMI: ${bmi!.toStringAsFixed(2)}', style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
